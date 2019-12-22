import 'package:flutter/material.dart';
import 'package:segment_display/segment_display.dart';
import 'package:intl/intl.dart';

void main() => runApp(App(
      title: 'Segment display example',
    ));

class App extends StatefulWidget {
  const App({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter;
  int _displayType;
  SegmentStyle _segmentStyle;
  Color _accentColor;
  bool _decimalPointEnabled;

  @override
  void initState() {
    super.initState();
    _accentColor = const Color(0xFFFF0000);
    _counter = 0;
    _displayType = 0;
    _decimalPointEnabled = false;
    _segmentStyle = DefaultSegmentStyle(
      enabledColor: _accentColor,
      disabledColor: _accentColor.withOpacity(0.15),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeSegmentStyle(SegmentStyle segmentStyle) {
    setState(() {
      _segmentStyle = segmentStyle;
    });
  }

  void _changeDisplayType(int type) {
    setState(() {
      _displayType = type;
    });
  }

  void _changeColor(Color color) {
    setState(() {
      _accentColor = color;
      _segmentStyle = _segmentStyle.copyWith(
        enabledColor: _accentColor,
        disabledColor: _accentColor.withOpacity(0.15),
      );
    });
  }

  void _switchDecimal(bool value) {
    setState(() {
      _decimalPointEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        accentColor: _accentColor,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            PopupMenuButton<SegmentStyle>(
              tooltip: 'Segment style',
              icon: Icon(Icons.style),
              onSelected: _changeSegmentStyle,
              itemBuilder: (context) {
                return [
                  PopupMenuItem<SegmentStyle>(
                    value: DefaultSegmentStyle(
                      enabledColor: Theme.of(context).accentColor,
                      disabledColor:
                          Theme.of(context).accentColor.withOpacity(0.15),
                    ),
                    child: const Text('Default'),
                  ),
                  PopupMenuItem<SegmentStyle>(
                    value: RectSegmentStyle(
                      enabledColor: Theme.of(context).accentColor,
                      disabledColor:
                          Theme.of(context).accentColor.withOpacity(0.15),
                    ),
                    child: const Text('Rect'),
                  ),
                  PopupMenuItem<SegmentStyle>(
                    value: HexSegmentStyle(
                      enabledColor: Theme.of(context).accentColor,
                      disabledColor:
                          Theme.of(context).accentColor.withOpacity(0.15),
                    ),
                    child: const Text('Hex'),
                  ),
                ];
              },
            ),
            PopupMenuButton<int>(
              tooltip: 'Display type',
              icon: Icon(Icons.filter_7),
              onSelected: _changeDisplayType,
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(value: 0, child: const Text('7-segment')),
                  PopupMenuItem<int>(value: 1, child: const Text('14-segment')),
                  PopupMenuItem<int>(value: 2, child: const Text('16-segment')),
                ];
              },
            ),
            PopupMenuButton<Color>(
              tooltip: 'Color',
              icon: Icon(Icons.color_lens),
              onSelected: _changeColor,
              itemBuilder: (context) {
                return [
                  PopupMenuItem<Color>(
                    value: const Color(0xFFFF0000),
                    child: const Text('Red'),
                  ),
                  PopupMenuItem<Color>(
                    value: const Color(0xFF00FF00),
                    child: const Text('Green'),
                  ),
                  PopupMenuItem<Color>(
                    value: const Color(0xFF0000FF),
                    child: const Text('Blue'),
                  ),
                  PopupMenuItem<Color>(
                    value: const Color(0xFF00FFFF),
                    child: const Text('Cyan'),
                  ),
                  PopupMenuItem<Color>(
                    value: const Color(0xFFFFFF00),
                    child: const Text('Yellow'),
                  ),
                  PopupMenuItem<Color>(
                    value: const Color(0xFFFFFFFF),
                    child: const Text('White'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _Display(
                value: '${DateFormat("HH:mm").format(DateTime.now())}',
                size: 7.0,
                type: _displayType,
                style: _segmentStyle,
              ),
              const SizedBox(height: 100),
              _Display(
                value: 'Count',
                size: 5.0,
                type: _displayType,
                style: _segmentStyle,
              ),
              const SizedBox(height: 30),
              _Display(
                value: _decimalPointEnabled
                    ? (_counter / 10).toStringAsFixed(1)
                    : '$_counter',
                size: 12.0,
                type: _displayType,
                style: _segmentStyle,
              ),
              const SizedBox(height: 30),
              Switch(
                value: _decimalPointEnabled,
                activeColor: _accentColor,
                onChanged: _switchDecimal,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _Display extends StatelessWidget {
  final String value;
  final int type;
  final double size;
  final SegmentStyle style;

  const _Display({Key key, this.value, this.type, this.style, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displays = [
      SevenSegmentDisplay(value: value, size: size, segmentStyle: style),
      FourteenSegmentDisplay(value: value, size: size, segmentStyle: style),
      SixteenSegmentDisplay(value: value, size: size, segmentStyle: style),
    ];

    return displays[type];
  }
}
