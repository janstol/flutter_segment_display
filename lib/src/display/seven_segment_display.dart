import 'package:flutter/widgets.dart';
import 'package:segment_display/src/character_segment_map.dart';
import 'package:segment_display/src/display/segment_display.dart';
import 'package:segment_display/src/segment/segment.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';

/// 7-segment display stateless widget.
///
/// * [Wikipedia: Seven-segment display](https://en.wikipedia.org/wiki/Seven-segment_display)
class SevenSegmentDisplay extends SegmentDisplay {
  /// Creates a 7-segment display.
  ///
  /// see [SegmentDisplay] for more info about properties and methods.
  const SevenSegmentDisplay({
    Key key,
    @required String value,
    SegmentStyle segmentStyle,
    double size,
    int characterCount,
    double characterSpacing,
    Color backgroundColor,
  }) : super(
          key: key,
          value: value,
          size: size,
          segmentStyle: segmentStyle,
          characterCount: characterCount,
          characterSpacing: characterSpacing,
          backgroundColor: backgroundColor,
          characterMap: CharacterSegmentMap.seven,
        );

  @override
  List<Segment> createSingleCharacter(double indent) {
    return [
      Segment.sevenG(segmentStyle, segmentSize, indent),
      Segment.sevenF(segmentStyle, segmentSize, indent),
      Segment.sevenE(segmentStyle, segmentSize, indent),
      Segment.sevenD(segmentStyle, segmentSize, indent),
      Segment.sevenC(segmentStyle, segmentSize, indent),
      Segment.sevenB(segmentStyle, segmentSize, indent),
      Segment.sevenA(segmentStyle, segmentSize, indent),
    ];
  }
}
