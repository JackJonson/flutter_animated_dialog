# flutter_animated_dialog

A new Flutter dialog with a series of beautiful animations, slide fade rotate size scale rotate3D animations.
Dialog barrier include status bar at the top of screen, solved the problem of default dialog.


## demo

<img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/SizeAnim.gif" width="50%">


## Getting Started

```yaml
dependencies:
  flutter_animated_dialog: ^1.0.0
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
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/DefaultToastWidget.gif" width="260px">
      <br />
      DefaultToastWidget
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/FadeAnim.gif" width="260px">
      <br />
      FadeAnim
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/SlideFromTopAnim.gif" width="260px">
      <br />
      SlideFromTopAnim
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/SlideFromBottomAnim.gif" width="260px">
      <br />
      SlideFromBottomAnim
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/SlideFromLeftAnim.gif" width="260px">
      <br />
      SlideFromLeftAnim
      <br />
      </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/SlideFromRightAnim.gif" width="260px">
      <br />
      SlideFromRightAnim
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/ScaleAnim.gif" width="260px">
      <br />
      ScaleAnim
      <br />
      </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/FadeScaleAnim.gif" width="260px">
      <br />
      FadeScaleAnim
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/RotateAnim.gif" width="260px">
      <br />
      RotateAnim
      <br />
      </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/FadeRotateAnim.gif" width="260px">
      <br />
      FadeRotateAnim
      <br />
      </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/ScaleRotateAnim.gif" width="260px">
      <br />
      ScaleRotateAnim
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/OnDismiss.gif" width="260px">
      <br />
      OnDismiss
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/CustomToastWidget.gif" width="260px">
      <br />
      CustomToastWidget
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/CustomFailToastWidget.gif" width="260px">
      <br />
      CustomFailToastWidget
      <br />
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/JackJonson/flutter_animated_dialog/master/screenshots/CustomSuccessToastWidget.gif" width="260px">
      <br />
      CustomSuccessToastWidget
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


