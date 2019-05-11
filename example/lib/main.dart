import 'package:flutter/material.dart';
import 'package:segment_display/segment_display.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Segment Display Example',
      theme: ThemeData(
        accentColor: Colors.red,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Flutter Segment Display Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SevenSegmentDisplay(
                text: "$_counter",
                textSize: 12.0,
                backgroundColor: Colors.transparent,
                segmentStyle: DefaultSegmentStyle(
                  enabledColor: Theme.of(context).accentColor,
                  disabledColor:
                      Theme.of(context).accentColor.withOpacity(0.15),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
