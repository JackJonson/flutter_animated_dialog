import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_dialog_transitions.dart';

/// Is dialog showing
bool isShowing = false;

enum DialogTransitionType {
  fade,
  slideFromTop,
  slideFromTopFade,
  slideFromBottom,
  slideFromBottomFade,
  slideFromLeft,
  slideFromLeftFade,
  slideFromRight,
  slideFromRightFade,
  scale,
  fadeScale,
  rotate,
  scaleRotate,
  fadeRotate,
  rotate3D,
  size,
  sizeFade,
  none,
}

/// Displays a Material dialog above the current contents of the app
Future<T?> showAnimatedDialog<T>({
  required BuildContext context,
  bool barrierDismissible = false,
  required WidgetBuilder builder,
  DialogTransitionType animationType = DialogTransitionType.fade,
  Curve curve = Curves.linear,
  Duration? duration,
  AlignmentGeometry? alignment,
  Axis? axis,
}) {
  final ThemeData theme = Theme.of(context);
  isShowing = true;
  final Alignment safeAlignment = (alignment ?? Alignment.center) as Alignment;

  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        top: false,
        child:
            Builder(builder: (context) => Theme(data: theme, child: pageChild)),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.8),
    transitionDuration: duration ?? const Duration(milliseconds: 400),
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      switch (animationType) {
        case DialogTransitionType.fade:
          return FadeTransition(opacity: animation, child: child);
        case DialogTransitionType.slideFromRight:
          return SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .chain(CurveTween(curve: curve))
                .animate(animation),
            child: child,
          );
        case DialogTransitionType.slideFromLeft:
          return SlideTransition(
            transformHitTests: false,
            position:
                Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                    .chain(CurveTween(curve: curve))
                    .animate(animation),
            child: child,
          );
        case DialogTransitionType.slideFromRightFade:
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .chain(CurveTween(curve: curve))
                .animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        case DialogTransitionType.slideFromLeftFade:
          return SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                    .chain(CurveTween(curve: curve))
                    .animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        case DialogTransitionType.slideFromTop:
          return SlideTransition(
            transformHitTests: false,
            position:
                Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                    .chain(CurveTween(curve: curve))
                    .animate(animation),
            child: child,
          );
        case DialogTransitionType.slideFromTopFade:
          return SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                    .chain(CurveTween(curve: curve))
                    .animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        case DialogTransitionType.slideFromBottom:
          return SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .chain(CurveTween(curve: curve))
                .animate(animation),
            child: child,
          );
        case DialogTransitionType.slideFromBottomFade:
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .chain(CurveTween(curve: curve))
                .animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        case DialogTransitionType.scale:
          return ScaleTransition(
              alignment: safeAlignment,
              scale: CurvedAnimation(
                  parent: animation, curve: Interval(0.0, 0.5, curve: curve)),
              child: child);
        case DialogTransitionType.fadeScale:
          return ScaleTransition(
            alignment: safeAlignment,
            scale: CurvedAnimation(
                parent: animation, curve: Interval(0.0, 0.5, curve: curve)),
            child: FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: curve),
                child: child),
          );
        case DialogTransitionType.scaleRotate:
          return ScaleTransition(
            alignment: safeAlignment,
            scale: CurvedAnimation(
                parent: animation, curve: Interval(0.0, 0.5, curve: curve)),
            child: CustomRotationTransition(
              alignment: safeAlignment,
              turns: Tween<double>(begin: 1, end: 2).animate(CurvedAnimation(
                  parent: animation, curve: Interval(0.0, 1.0, curve: curve))),
              child: child,
            ),
          );
        case DialogTransitionType.rotate:
          return CustomRotationTransition(
            alignment: safeAlignment,
            turns: Tween<double>(begin: 1, end: 2).animate(CurvedAnimation(
                parent: animation, curve: Interval(0.0, 1.0, curve: curve))),
            child: child,
          );
        case DialogTransitionType.fadeRotate:
          return CustomRotationTransition(
            alignment: safeAlignment,
            turns: Tween<double>(begin: 1, end: 2).animate(CurvedAnimation(
                parent: animation, curve: Interval(0.0, 1.0, curve: curve))),
            child: FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: curve),
                child: child),
          );
        case DialogTransitionType.rotate3D:
          return Rotation3DTransition(
            alignment: safeAlignment,
            turns: Tween<double>(begin: math.pi, end: 2 * math.pi).animate(
                CurvedAnimation(
                    parent: animation,
                    curve: Interval(0.0, 1.0, curve: curve))),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: animation,
                  curve: Interval(0.5, 1.0, curve: Curves.elasticOut))),
              child: child,
            ),
          );
        case DialogTransitionType.size:
          return Align(
              alignment: safeAlignment,
              child: SizeTransition(
                  sizeFactor: CurvedAnimation(parent: animation, curve: curve),
                  axis: axis ?? Axis.vertical,
                  child: child));
        case DialogTransitionType.sizeFade:
          return Align(
            alignment: safeAlignment,
            child: SizeTransition(
              sizeFactor: CurvedAnimation(parent: animation, curve: curve),
              child: FadeTransition(
                  opacity: CurvedAnimation(parent: animation, curve: curve),
                  child: child),
            ),
          );
        case DialogTransitionType.none:
          return child;
      }
    },
  );
}

/// CustomDialogWidget with null safety
class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    Key? key,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.bottomWidget,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
    this.minWidth,
  }) : super(key: key);

  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final List<Widget>? actions;
  final Widget? bottomWidget;
  final Color? backgroundColor;
  final double? elevation;
  final String? semanticLabel;
  final ShapeBorder? shape;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final List<Widget> children = <Widget>[];
    String? label = semanticLabel;

    if (title != null) {
      children.add(Padding(
        padding: titlePadding ??
            EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0),
        child: DefaultTextStyle(
          style: titleTextStyle ??
              dialogTheme.titleTextStyle ??
              theme.textTheme.titleLarge!,
          child: Semantics(
            namesRoute: true,
            container: true,
            child: title!,
          ),
        ),
      ));
    }

    if (content != null) {
      children.add(
        Flexible(
          child: Padding(
            padding: contentPadding!,
            child: DefaultTextStyle(
              style: contentTextStyle ??
                  dialogTheme.contentTextStyle ??
                  theme.textTheme.bodyMedium!,
              child: content!,
            ),
          ),
        ),
      );
    }

    if (bottomWidget != null) {
      children.add(bottomWidget!);
    } else if (actions != null) {
      children.add(
        ButtonBarTheme(
          data: ButtonBarTheme.of(context),
          child: ButtonBar(
            children: actions!,
          ),
        ),
      );
    }

    Widget dialogChild = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    if (label != null) {
      dialogChild = Semantics(
        namesRoute: true,
        label: label,
        child: dialogChild,
      );
    }

    dialogChild = CustomDialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      minWidth: minWidth ?? 280.0,
      shape: shape,
      child: dialogChild,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: dialogChild,
    );
  }
}

/// CustomDialog with null safety
class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    this.backgroundColor,
    this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.minWidth = 280.0,
    this.shape,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final Color? backgroundColor;
  final double? elevation;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final double minWidth;
  final ShapeBorder? shape;

  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)));
  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: minWidth),
            child: Material(
              color: backgroundColor ??
                  dialogTheme.backgroundColor ??
                  Theme.of(context).dialogBackgroundColor,
              elevation:
                  elevation ?? dialogTheme.elevation ?? _defaultElevation,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              type: MaterialType.card,
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
