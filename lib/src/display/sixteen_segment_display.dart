import 'package:flutter/widgets.dart';
import 'package:segment_display/src/character_segment_map.dart';
import 'package:segment_display/src/display/segment_display.dart';
import 'package:segment_display/src/segment/segment.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';

/// 16-segment display stateless widget.
///
/// * [Wikipedia: Sixteen-segment display](https://en.wikipedia.org/wiki/Sixteen-segment_display)
class SixteenSegmentDisplay extends SegmentDisplay {
  /// Creates a 16-segment display.
  ///
  /// see [SegmentDisplay] for more info about properties and methods.
  const SixteenSegmentDisplay({
    Key? key,
    required String value,
    SegmentStyle? segmentStyle,
    double? size,
    int? characterCount,
    double? characterSpacing,
    Color? backgroundColor,
  }) : super(
          key: key,
          value: value,
          size: size,
          segmentStyle: segmentStyle,
          characterCount: characterCount,
          characterSpacing: characterSpacing,
          backgroundColor: backgroundColor,
          characterMap: CharacterSegmentMap.sixteen,
        );

  @override
  List<Segment> createSingleCharacter(double indent) {
    return [
      Segment.sixteenM(segmentStyle, segmentSize, indent),
      Segment.sixteenL(segmentStyle, segmentSize, indent),
      Segment.sixteenK(segmentStyle, segmentSize, indent),
      Segment.sixteenJ(segmentStyle, segmentSize, indent),
      Segment.sixteenI(segmentStyle, segmentSize, indent),
      Segment.sixteenH(segmentStyle, segmentSize, indent),
      Segment.sixteenG2(segmentStyle, segmentSize, indent),
      Segment.sixteenG1(segmentStyle, segmentSize, indent),
      Segment.sixteenF(segmentStyle, segmentSize, indent),
      Segment.sixteenE(segmentStyle, segmentSize, indent),
      Segment.sixteenD2(segmentStyle, segmentSize, indent),
      Segment.sixteenD1(segmentStyle, segmentSize, indent),
      Segment.sixteenC(segmentStyle, segmentSize, indent),
      Segment.sixteenB(segmentStyle, segmentSize, indent),
      Segment.sixteenA2(segmentStyle, segmentSize, indent),
      Segment.sixteenA1(segmentStyle, segmentSize, indent),
    ];
  }
}
