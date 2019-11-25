import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:segment_display/segment_display.dart';

final _dividerCharacters = CharacterSegmentMap.dividerCharacters.values.join();

final _sevenSegmentDisplayMapping =
    CharacterSegmentMap.seven.keys.join() + _dividerCharacters;

final _fourteenSegmentDisplayMapping =
    CharacterSegmentMap.fourteen.keys.join() + _dividerCharacters;

final _sixteenSegmentDisplayMapping =
    CharacterSegmentMap.sixteen.keys.join() + _dividerCharacters;

/// Creates test [SevenSegmentDisplay] for
/// all characters supported by this display.
Widget createSevenSegmentDisplayTest(
    {SegmentStyle segmentStyle = const DefaultSegmentStyle()}) {
  return Center(
    child: RepaintBoundary(
      child: Container(
        color: const Color(0xFF000000),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (final v in _splitString(_sevenSegmentDisplayMapping, 11))
              Column(
                children: <Widget>[
                  SevenSegmentDisplay(
                    value: v,
                    size: 6,
                    characterSpacing: 5.0,
                    segmentStyle: segmentStyle,
                  ),
                  const SizedBox(height: 4.0),
                ],
              )
          ],
        ),
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
      child: Container(
        color: const Color(0xFF000000),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (final v in _splitString(_fourteenSegmentDisplayMapping, 12))
              Column(
                children: <Widget>[
                  FourteenSegmentDisplay(
                    value: v,
                    size: 6,
                    characterSpacing: 5.0,
                    segmentStyle: segmentStyle,
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
          ],
        ),
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
      child: Container(
        color: const Color(0xFF000000),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (final v in _splitString(_sixteenSegmentDisplayMapping, 12))
              Column(
                children: <Widget>[
                  SixteenSegmentDisplay(
                    value: v,
                    size: 6,
                    characterSpacing: 5.0,
                    segmentStyle: segmentStyle,
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
          ],
        ),
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
