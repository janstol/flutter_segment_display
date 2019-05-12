import 'package:flutter/widgets.dart';
import 'package:segment_display/src/character_segment_map.dart';
import 'package:segment_display/src/display/segment_display.dart';
import 'package:segment_display/src/segment/segment.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';

/// 7-segment display stateless widget.
///
/// [Wikipedia: Seven-segment display](https://en.wikipedia.org/wiki/Seven-segment_display)
class SevenSegmentDisplay extends SegmentDisplay {
  /// Creates a 7-segment display.
  ///
  /// see [SegmentDisplay] for more info about properties and methods.
  const SevenSegmentDisplay({
    Key key,
    @required String text,
    @required SegmentStyle segmentStyle,
    double textSize,
    int characterCount,
    double characterSpacing,
    Color backgroundColor,
  }) : super(
          key: key,
          text: text,
          textSize: textSize,
          segmentStyle: segmentStyle,
          characterCount: characterCount,
          characterSpacing: characterSpacing,
          backgroundColor: backgroundColor,
          characterMap: CharacterSegmentMap.seven,
        );

  @override
  List<Segment> createSingleCharacter(int charIndex) {
    final padding = charIndex * (2 * segmentSize.width + segmentSize.height) +
        (charIndex * characterSpacing);

    return [
      Segment.sevenG(segmentStyle, segmentSize, padding),
      Segment.sevenF(segmentStyle, segmentSize, padding),
      Segment.sevenE(segmentStyle, segmentSize, padding),
      Segment.sevenD(segmentStyle, segmentSize, padding),
      Segment.sevenC(segmentStyle, segmentSize, padding),
      Segment.sevenB(segmentStyle, segmentSize, padding),
      Segment.sevenA(segmentStyle, segmentSize, padding),
    ];
  }
}
