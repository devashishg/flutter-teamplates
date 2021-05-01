import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Timer',
      theme: new ThemeData(
        primaryColor: Colors.grey.shade800,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int _seconds = 1;

  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(
      secondsToDisplay: _seconds,
      child: Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MyTextWidget(), //just update this widget
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: _addPressed,
                  iconSize: 150.0,
                ),
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () => print("to be implemented"),
                  iconSize: 150.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _addPressed() {
    setState(() {
      _seconds++;
    });
  }
}

class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidget inheritedWidget = MyInheritedWidget.of(context);
    return Text(
      inheritedWidget.secondsToDisplay.toString(),
      textScaleFactor: 5.0,
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final int secondsToDisplay;

  MyInheritedWidget({
    Key key,
    @required this.secondsToDisplay,
    @required Widget child,
  }) : super(key: key, child: child);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) =>
      secondsToDisplay != oldWidget.secondsToDisplay;
}
