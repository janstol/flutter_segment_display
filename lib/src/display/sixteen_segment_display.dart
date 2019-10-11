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
          characterMap: CharacterSegmentMap.sixteen,
        );

  @override
  List<Segment> createSingleCharacter(int charIndex) {
    final padding = charIndex * (2 * segmentSize.width + segmentSize.height) +
        (charIndex * characterSpacing);

    return [
      Segment.sixteenM(segmentStyle, segmentSize, padding),
      Segment.sixteenL(segmentStyle, segmentSize, padding),
      Segment.sixteenK(segmentStyle, segmentSize, padding),
      Segment.sixteenJ(segmentStyle, segmentSize, padding),
      Segment.sixteenI(segmentStyle, segmentSize, padding),
      Segment.sixteenH(segmentStyle, segmentSize, padding),
      Segment.sixteenG2(segmentStyle, segmentSize, padding),
      Segment.sixteenG1(segmentStyle, segmentSize, padding),
      Segment.sixteenF(segmentStyle, segmentSize, padding),
      Segment.sixteenE(segmentStyle, segmentSize, padding),
      Segment.sixteenD2(segmentStyle, segmentSize, padding),
      Segment.sixteenD1(segmentStyle, segmentSize, padding),
      Segment.sixteenC(segmentStyle, segmentSize, padding),
      Segment.sixteenB(segmentStyle, segmentSize, padding),
      Segment.sixteenA2(segmentStyle, segmentSize, padding),
      Segment.sixteenA1(segmentStyle, segmentSize, padding),
    ];
  }
}
