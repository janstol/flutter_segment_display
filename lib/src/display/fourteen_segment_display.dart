import 'package:flutter/widgets.dart';
import 'package:segment_display/src/character_segment_map.dart';
import 'package:segment_display/src/display/segment_display.dart';
import 'package:segment_display/src/segment/segment.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';

/// 14-segment display stateless widget
class FourteenSegmentDisplay extends SegmentDisplay {
  /// Creates a 14-segment display
  ///
  /// see [SegmentDisplay] for more info
  const FourteenSegmentDisplay({
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
          characterMap: CharacterSegmentMap.fourteen,
        );

  @override
  List<Segment> createSingleCharacter(int charIndex) {
    final padding = charIndex * (2 * segmentSize.width + segmentSize.height) +
        (charIndex * characterSpacing);

    return [
      Segment.fourteenM(segmentStyle, segmentSize, padding),
      Segment.fourteenL(segmentStyle, segmentSize, padding),
      Segment.fourteenK(segmentStyle, segmentSize, padding),
      Segment.fourteenJ(segmentStyle, segmentSize, padding),
      Segment.fourteenI(segmentStyle, segmentSize, padding),
      Segment.fourteenH(segmentStyle, segmentSize, padding),
      Segment.fourteenG2(segmentStyle, segmentSize, padding),
      Segment.fourteenG1(segmentStyle, segmentSize, padding),
      Segment.fourteenF(segmentStyle, segmentSize, padding),
      Segment.fourteenE(segmentStyle, segmentSize, padding),
      Segment.fourteenD(segmentStyle, segmentSize, padding),
      Segment.fourteenC(segmentStyle, segmentSize, padding),
      Segment.fourteenB(segmentStyle, segmentSize, padding),
      Segment.fourteenA(segmentStyle, segmentSize, padding),
    ];
  }
}
