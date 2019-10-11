import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:segment_display/segment_display.dart';

final _sevenSegmentDisplayMapping = CharacterSegmentMap.seven.keys.join();
final _fourteenSegmentDisplayMapping = CharacterSegmentMap.fourteen.keys.join();
final _sixteenSegmentDisplayMapping = CharacterSegmentMap.sixteen.keys.join();

/// Creates test [SevenSegmentDisplay] for
/// all characters supported by this display.
Widget createSevenSegmentDisplayTest(
    {SegmentStyle segmentStyle = const DefaultSegmentStyle()}) {
  return Center(
    child: RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (final v in _splitString(_sevenSegmentDisplayMapping, 10))
            SevenSegmentDisplay(
              text: v,
              textSize: 5,
              segmentStyle: segmentStyle,
            ),
        ],
      ),
    ),
  );
}

/// Creates test [FourteenSegmentDisplay] for
/// all characters supported by this display.
Widget createFourteenSegmentDisplayTest(
    {SegmentStyle segmentStyle = const DefaultSegmentStyle()}) {
  return Center(
    child: RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (final v in _splitString(_fourteenSegmentDisplayMapping, 10))
            FourteenSegmentDisplay(
              text: v,
              textSize: 5,
              segmentStyle: segmentStyle,
            ),
        ],
      ),
    ),
  );
}

/// Creates test [SixteenSegmentDisplay] for
/// all characters supported by this display.
Widget createSixteenSegmentDisplayTest(
    {SegmentStyle segmentStyle = const DefaultSegmentStyle()}) {
  return Center(
    child: RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (final v in _splitString(_sixteenSegmentDisplayMapping, 10))
            SixteenSegmentDisplay(
              text: v,
              textSize: 5,
              segmentStyle: segmentStyle,
            ),
        ],
      ),
    ),
  );
}

/// Helps to split string into chunks,
/// every string has length of at-most [charCount].
List<String> _splitString(String string, int charCount) {
  final chunks = <String>[];
  for (var i = 0; i < string.length; i += charCount) {
    chunks.add(string.substring(
      i,
      (i + charCount > string.length) ? string.length : i + charCount,
    ));
  }
  return chunks;
}
