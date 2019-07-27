import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool showPerformance = false;

  onSettingCallback() {
    setState(() {
      showPerformance = !showPerformance;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appTitle = 'Styled Toast Example';
    return  MaterialApp(
      title: appTitle,
      showPerformanceOverlay: showPerformance,
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return MyHomePage(
            title: appTitle,
            onSetting: onSettingCallback,
          );
        },
      ),
    );
  }
}

// The StatefulWidget's job is to take in some data and create a State class.
// In this case, the Widget takes a title, and creates a _MyHomePageState.
class MyHomePage extends StatefulWidget {
  final String title;

  final VoidCallback onSetting;

  MyHomePage({Key key, this.title, this.onSetting}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// The State class is responsible for two things: holding some data you can
// update and building the UI using that data.
class _MyHomePageState extends State<MyHomePage> {
  // Whether the green box should be visible or invisible

  String dismissRemind = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              widget.onSetting?.call();
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.only(left: 15.0),
              height: 35.0,
              alignment: Alignment.centerLeft,
              child: Text('Normal Toast'),
              color: const Color(0xFFDDDDDD),
            ),
            ListTile(
              title: Text('Normal toast'),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(custom borderRadius textStyle etc)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(position)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(custom position)",
              ),
              onTap: () {
              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(fade anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(slideFromTop anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(slideFromTopFade anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(slideFromBottom anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(slideFromBottomFade anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "normal toast(slideFromLeft anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "normal toast(slideFromLeftFade anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(slideFromRight anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(slideFromRightFade anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "normal toast(size anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "normal toast(sizefade anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "normal toast(scale anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(fadeScale anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(rotate anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(fadeRotate anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast(scaleRotate anim)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Normal toast with onDismissed($dismissRemind)",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),

            ///Custom toast content widget
            Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 50.0),
              padding: EdgeInsets.only(left: 15.0),
              height: 35.0,
              alignment: Alignment.centerLeft,
              child: Text('Custom toast content widget'),
              color: const Color(0xFFDDDDDD),
            ),
            ListTile(
              title: Text(
                "Custom toast content widget",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Custom toast content widget with icon convinient fail",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "Custom toast content widget with icon convinient success",
              ),
              onTap: () {

              },
            ),
            Divider(
              height: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}