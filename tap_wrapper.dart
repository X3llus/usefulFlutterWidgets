import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "tap_wrapper",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Wrapper(title: "tap_wrapper"),
    );
  }
}

class Wrapper extends StatefulWidget {
  Wrapper({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  int taps = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Wraps the entire screen in a gesture detector.
      onTap: () { // Code to run when a tap is detected
        setState(() {
          // set/change state variabels
          text++;
        });
      },
      // pass this into child
      child: MainBody(this)
    );
  }
}

class MainBody extends StatelessWidget {

  final _WrapperState parent;

  MainBody(this.parent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.parent.taps.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}