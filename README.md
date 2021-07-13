# flutter_animated_dialog

A new Flutter dialog with a series of beautiful animations, slide fade rotate size scale rotate3D animations.
Dialog barrier include status bar at the top of screen, solved the problem of default dialog.


## demo

<img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/size.gif" width="50%">

## Getting Started

## Null safety

```yaml
dependencies:
  flutter_animated_dialog: ^2.0.1
```


## Previous version

```yaml
dependencies:
  flutter_animated_dialog: ^1.2.0
```



```dart
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
```

```dart
showAnimatedDialog(
  context: context,
  barrierDismissible: true,
  builder: (BuildContext context) {
    return ClassicGeneralDialogWidget(
      titleText: 'Title',
      contentText: 'content',
      onPositiveClick: () {
        Navigator.of(context).pop();
      },
      onNegativeClick: () {
        Navigator.of(context).pop();
      },
    );
  },
  animationType: DialogTransitionType.size,
  curve: Curves.fastOutSlowIn,
  duration: Duration(seconds: 1),
);
```


## 🚀 Roadmap

<table>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/default.gif" width="260px">
      <br />
      default
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/fade.gif" width="260px">
      <br />
      fade
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/slideFromTop.gif" width="260px">
      <br />
      slideFromTop
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/slideFromBottom.gif" width="260px">
      <br />
      slideFromBottom
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/slideFromBottomFade.gif" width="260px">
      <br />
      slideFromBottomFade
      <br />
      </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/slideFromLeft.gif" width="260px">
      <br />
      slideFromLeft
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/slideFromLeftFade.gif" width="260px">
      <br />
      slideFromLeftFade
      <br />
      </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/slideFromRight.gif" width="260px">
      <br />
      slideFromRight
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/slideFromRightFade.gif" width="260px">
      <br />
      slideFromRightFade
      <br />
      </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/scale.gif" width="260px">
      <br />
      scale
      <br />
      </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/fadeScale.gif" width="260px">
      <br />
      fadeScale
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/scaleRotate.gif" width="260px">
      <br />
      scaleRotate
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/rotate.gif" width="260px">
      <br />
      rotate
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/rotate3D.gif" width="260px">
      <br />
      rotate3D
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/size.gif" width="260px">
      <br />
      size
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/sizeFade.gif" width="260px">
      <br />
      sizeFade
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/generalDialog.gif" width="260px">
      <br />
      generalDialog
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/listSingleSelect.gif" width="260px">
      <br />
      listSingleSelect
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/listDialog.gif" width="260px">
      <br />
      listDialog
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/listMultipleSelect.gif" width="260px">
      <br />
      listMultipleSelect
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/customDialog.gif" width="260px">
      <br />
      customDialog
      <br />
    </td>
   
  </tr>
</table>


### showAnimatedDialog param

property             | description
---------------------|----------------------------
context              | BuildContext (Not Null)(required)
barrierDismissible   | bool (default false)    
builder              | WidgetBuilder (Not Null)(required)
animationType        | DialogTransitionType (default DialogTransitionType.fade)
curve                | Curve (default Curves.linear)
duration             | Duration (default const Duration(milliseconds: 400))   
alignment            | AlignmentGeometry (default Alignment.center)   


## Example
[example](https://github.com/JackJonson/flutter_animated_dialog/blob/master/example/lib/main.dart)


