import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

///Single selection callback of list dialog
typedef OnSingleSelectionCallback = void Function(int selectedIndex);

///Multiple selection callback of list dialog
typedef OnMultiSelectionCallback = void Function(List<int> selectedIndexes);

///
///created time: 2019-07-31 09:35
///author linzhiliang
///version 1.0
///since
///file name: classic_dialog_widget.dart
///description: General dialog
///
@immutable
class ClassicGeneralDialogWidget extends StatelessWidget {
  ///Title text of the dialog
  final String titleText;

  ///Content text of the dialog
  final String contentText;

  ///Text of negative button, the left button at the bottom of dialog
  final String negativeText;

  ///Text of positive button, the right button at the bottom of dialog
  final String positiveText;

  ///Click callback of negative button
  final VoidCallback onNegativeClick;

  ///Click callback of positive button
  final VoidCallback onPositiveClick;

  ///Actions at the bottom of dialog, when this is set, [negativeText] [positiveText] [onNegativeClick] [onPositiveClick] will not work。
  final List<Widget> actions;

  ClassicGeneralDialogWidget({
    this.titleText,
    this.contentText,
    this.actions,
    this.negativeText,
    this.positiveText,
    this.onNegativeClick,
    this.onPositiveClick,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomDialogWidget(
      title: titleText != null
          ? Text(
              titleText,
              style: Theme.of(context).dialogTheme.titleTextStyle,
            )
          : null,
      content: contentText != null
          ? Text(
              contentText,
              style: Theme.of(context).dialogTheme.contentTextStyle,
            )
          : null,
      actions: actions ??
          [
            onNegativeClick != null
                ? FlatButton(
                    onPressed: onNegativeClick,
                    splashColor: Theme.of(context).splashColor,
                    highlightColor: Theme.of(context).highlightColor,
                    child: new Text(
                      negativeText ?? 'cancel',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.overline.color,
                          fontSize:
                              Theme.of(context).textTheme.button.fontSize),
                    ),
                  )
                : null,
            onPositiveClick != null
                ? FlatButton(
                    onPressed: onPositiveClick,
                    splashColor: Theme.of(context).splashColor,
                    highlightColor: Theme.of(context).highlightColor,
                    child: new Text(
                      positiveText ?? 'confirm',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize:
                              Theme.of(context).textTheme.button.fontSize),
                    ),
                  )
                : null,
          ],
      elevation: 0.0,
      shape: Theme.of(context).dialogTheme.shape,
    );
  }
}

///List type
enum ListType {
  ///Single
  single,

  ///Single select
  singleSelect,

  ///Multiple select
  multiSelect,
}

///
///created time: 2019-08-01 08:59
///author linzhiliang
///version 1.0
///since
///file name: classic_dialog_widget.dart
///description: Classic dialog with list content
///
class ClassicListDialogWidget<T> extends StatefulWidget {
  ///Title text of the dialog
  final String titleText;

  ///Data of the list
  final List<T> dataList;

  ///Custom list item widget
  final Widget listItem;

  ///Click callback of default list item
  final VoidCallback onListItemClick;

  ///List type
  final ListType listType;

//  ///Single selection callback
//  final OnSingleSelectionCallback onListSingleSelectionCallback;
//
//  ///Multiple selection callback
//  final OnMultiSelectionCallback onListMultiSelectionCallback;

  ///Text of negative button, the left button at the bottom of dialog
  final String negativeText;

  ///Text of positive button, the right button at the bottom of dialog
  final String positiveText;

  ///Click callback of negative button
  final VoidCallback onNegativeClick;

  ///Click callback of positive button
  final VoidCallback onPositiveClick;

  ///Actions at the bottom of dialog, when this is set, [negativeText] [positiveText] [onNegativeClick] [onPositiveClick] will not work。
  final List<Widget> actions;

  ClassicListDialogWidget({
    this.titleText,
    this.dataList,
    this.listItem,
    this.onListItemClick,
    this.listType = ListType.single,
    this.actions,
    this.negativeText,
    this.positiveText,
    this.onNegativeClick,
    this.onPositiveClick,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassicListDialogWidgetState<T>();
  }
}

class ClassicListDialogWidgetState<T> extends State<ClassicListDialogWidget> {
  T selectedValue;

  List<bool> valueList;
  List<T> selectedList = [];

  @override
  void initState() {
    super.initState();
    valueList = List.generate(widget.dataList.length, (index) {
      return false;
    }).toList(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget contentWidget;
    if (widget.dataList != null) {
      contentWidget = ListView.builder(
        itemBuilder: (context, index) {
          if (widget.listItem == null) {
            switch (widget.listType) {
              case ListType.single:
                return ListTile(
                  title: Text(
                    widget.dataList[index].toString(),
                    style: Theme.of(context).dialogTheme.contentTextStyle,
                  ),
                  onTap: widget.onListItemClick ??
                      () {
                        Navigator.of(context).pop(widget.dataList[index]);
                      },
                );
                break;
              case ListType.singleSelect:
                return RadioListTile<T>(
                  title: Text(
                    widget.dataList[index].toString(),
                    style: Theme.of(context).dialogTheme.contentTextStyle,
                  ),
                  value: widget.dataList[index],
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                );
                break;
              case ListType.multiSelect:
                return CheckboxListTile(
                  selected: valueList[index],
                  value: valueList[index],
                  title: Text(
                    widget.dataList[index].toString(),
                    style: Theme.of(context).dialogTheme.contentTextStyle,
                  ),
                  onChanged: (value) {
                    setState(() {
                      valueList[index] = value;
                    });
                  },
                  activeColor: Theme.of(context).accentColor,
                );
                break;
              default:
                break;
            }
          } else {
            return widget.listItem;
          }
        },
        itemCount: widget.dataList.length,
      );
    } else {}

    return CustomDialogWidget(
      title: widget.titleText != null
          ? Text(
              widget.titleText,
              style: Theme.of(context).dialogTheme.titleTextStyle,
            )
          : null,
      contentPadding: EdgeInsets.all(0.0),
      content: contentWidget,
      actions: widget.actions ??
          [
            FlatButton(
              onPressed: widget.onNegativeClick ??
                  () {
                    Navigator.of(context).pop();
                  },
              splashColor: Theme.of(context).splashColor,
              highlightColor: Theme.of(context).highlightColor,
              child: new Text(
                widget.negativeText ?? 'cancel',
                style: TextStyle(
                    color: Theme.of(context).textTheme.overline.color,
                    fontSize: Theme.of(context).textTheme.button.fontSize),
              ),
            ),
            FlatButton(
              onPressed: widget.onPositiveClick ??
                  () {
                    switch (widget.listType) {
                      case ListType.single:
                        Navigator.of(context).pop();
                        break;
                      case ListType.singleSelect:
                        Navigator.of(context).pop(selectedValue);
                        break;
                      case ListType.multiSelect:
                        selectedList.clear();
                        int length=valueList.length;
                        for (int i=0;i<length;i++) {
                          if (valueList[i]) {
                            selectedList.add(widget.dataList[i]);
                          }
                        }
                        Navigator.of(context).pop(selectedList);
                        break;
                    }
                  },
              splashColor: Theme.of(context).splashColor,
              highlightColor: Theme.of(context).highlightColor,
              child: new Text(
                widget.positiveText ?? 'confirm',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Theme.of(context).textTheme.button.fontSize),
              ),
            ),
          ],
      elevation: 0.0,
      shape: Theme.of(context).dialogTheme.shape,
    );
  }
}
