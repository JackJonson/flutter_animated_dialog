import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

typedef OnSingleSelectionCallback = void Function(int selectedIndex);
typedef OnMultiSelectionCallback = void Function(List<int> selectedIndexes);

@immutable
class ClassicGeneralDialogWidget extends StatelessWidget {
  final String? titleText;
  final String? contentText;
  final String? negativeText;
  final String? positiveText;
  final TextStyle? negativeTextStyle;
  final TextStyle? positiveTextStyle;
  final VoidCallback? onNegativeClick;
  final VoidCallback? onPositiveClick;
  final List<Widget>? actions;

  const ClassicGeneralDialogWidget({
    Key? key,
    this.titleText,
    this.contentText,
    this.actions,
    this.negativeText,
    this.positiveText,
    this.negativeTextStyle,
    this.positiveTextStyle,
    this.onNegativeClick,
    this.onPositiveClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialogWidget(
      title: titleText != null
          ? Text(
              titleText!,
              style: Theme.of(context).textTheme.titleLarge,
            )
          : null,
      content: contentText != null
          ? Text(
              contentText!,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : null,
      actions: actions ??
          [
            if (onNegativeClick != null)
              TextButton(
                onPressed: onNegativeClick,
                child: Text(
                  negativeText ?? 'Cancel',
                  style: negativeTextStyle ??
                      TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
              ),
            if (onPositiveClick != null)
              TextButton(
                onPressed: onPositiveClick,
                child: Text(
                  positiveText ?? 'Confirm',
                  style: positiveTextStyle ??
                      TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
          ],
      elevation: 0.0,
      shape: Theme.of(context).dialogTheme.shape,
    );
  }
}

enum ListType { single, singleSelect, multiSelect }

class ClassicListDialogWidget<T> extends StatefulWidget {
  final String? titleText;
  final List<T> dataList;
  final Widget? listItem;
  final VoidCallback? onListItemClick;
  final ListType listType;
  final ListTileControlAffinity controlAffinity;
  final Color? activeColor;
  final List<int> selectedIndexes;
  final int selectedIndex;
  final String? negativeText;
  final String? positiveText;
  final VoidCallback? onNegativeClick;
  final VoidCallback? onPositiveClick;
  final List<Widget>? actions;

  const ClassicListDialogWidget({
    Key? key,
    this.titleText,
    required this.dataList,
    this.listItem,
    this.onListItemClick,
    this.listType = ListType.single,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.activeColor,
    this.selectedIndexes = const [],
    this.selectedIndex = -1,
    this.actions,
    this.negativeText,
    this.positiveText,
    this.onNegativeClick,
    this.onPositiveClick,
  }) : super(key: key);

  @override
  State<ClassicListDialogWidget<T>> createState() =>
      _ClassicListDialogWidgetState<T>();
}

class _ClassicListDialogWidgetState<T>
    extends State<ClassicListDialogWidget<T>> {
  late int selectedIndex;
  late List<bool> valueList;
  late List<int> selectedIndexes;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
    selectedIndexes = List.from(widget.selectedIndexes);
    valueList = List.generate(
      widget.dataList.length,
      (index) => widget.selectedIndexes.contains(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = ListView.builder(
      shrinkWrap: true,
      itemCount: widget.dataList.length,
      itemBuilder: (context, index) {
        if (widget.listItem != null) return widget.listItem!;
        switch (widget.listType) {
          case ListType.single:
            return ListTile(
              title: Text(
                widget.dataList[index].toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: widget.onListItemClick ??
                  () => Navigator.of(context).pop(index),
            );
          case ListType.singleSelect:
            return RadioListTile<int>(
              controlAffinity: widget.controlAffinity,
              title: Text(
                widget.dataList[index].toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              activeColor: widget.activeColor ?? Theme.of(context).primaryColor,
              value: index,
              groupValue: selectedIndex,
              onChanged: (value) => setState(() => selectedIndex = value!),
            );
          case ListType.multiSelect:
            return CheckboxListTile(
              controlAffinity: widget.controlAffinity,
              title: Text(
                widget.dataList[index].toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              value: valueList[index],
              onChanged: (value) => setState(() => valueList[index] = value!),
              activeColor: widget.activeColor ?? Theme.of(context).primaryColor,
            );
        }
      },
    );

    return CustomDialogWidget(
      title: widget.titleText != null
          ? Text(widget.titleText!, style: Theme.of(context).textTheme.titleLarge)
          : null,
      content: Container(width: double.maxFinite, child: contentWidget),
      contentPadding: const EdgeInsets.all(0),
      actions: widget.actions ??
          [
            if (widget.onNegativeClick != null)
              TextButton(
                onPressed: widget.onNegativeClick,
                child: Text(widget.negativeText ?? 'Cancel'),
              ),
            TextButton(
              onPressed: widget.onPositiveClick ??
                  () {
                    switch (widget.listType) {
                      case ListType.single:
                        Navigator.of(context).pop();
                        break;
                      case ListType.singleSelect:
                        Navigator.of(context).pop(selectedIndex);
                        break;
                      case ListType.multiSelect:
                        selectedIndexes = [];
                        for (int i = 0; i < valueList.length; i++) {
                          if (valueList[i]) selectedIndexes.add(i);
                        }
                        Navigator.of(context).pop(selectedIndexes);
                        break;
                    }
                  },
              child: Text(widget.positiveText ?? 'Confirm'),
            ),
          ],
      elevation: 0,
      shape: Theme.of(context).dialogTheme.shape,
    );
  }
}
