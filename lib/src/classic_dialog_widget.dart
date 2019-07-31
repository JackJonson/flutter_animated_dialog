import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

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
  final String titleText;

  final String contentText;

  final String negativeText;

  final String positiveText;

  final VoidCallback onNegativeClick;

  final VoidCallback onPositiveClick;

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
