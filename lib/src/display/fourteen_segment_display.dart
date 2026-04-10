import 'package:segment_display/src/character_segment_map.dart';
import 'package:segment_display/src/display/segment_display.dart';
import 'package:segment_display/src/segment/segment.dart';

/// 14-segment display stateless widget.
///
/// * [Wikipedia: Fourteen-segment display](https://en.wikipedia.org/wiki/Fourteen-segment_display)
class FourteenSegmentDisplay extends SegmentDisplay {
  /// Creates a 14-segment display.
  ///
  /// see [SegmentDisplay] for more info about properties and methods.
  ///
  /// Use [customCharacterMap] to add or override character-to-bitmask entries.
  /// Custom entries are merged on top of [CharacterSegmentMap.fourteen].
  FourteenSegmentDisplay({
    super.key,
    required super.value,
    super.segmentStyle,
    super.size,
    super.characterCount,
    super.characterSpacing,
    super.backgroundColor,
    super.showDisabledDividers,
    Map<String, int>? customCharacterMap,
  }) : super(
          characterMap: customCharacterMap == null
              ? CharacterSegmentMap.fourteen
              : {...CharacterSegmentMap.fourteen, ...customCharacterMap},
        );

  @override
  List<Segment> createSingleCharacter(double indent) {
    return [
      Segment.fourteenM(segmentStyle, segmentSize, indent),
      Segment.fourteenL(segmentStyle, segmentSize, indent),
      Segment.fourteenK(segmentStyle, segmentSize, indent),
      Segment.fourteenJ(segmentStyle, segmentSize, indent),
      Segment.fourteenI(segmentStyle, segmentSize, indent),
      Segment.fourteenH(segmentStyle, segmentSize, indent),
      Segment.fourteenG2(segmentStyle, segmentSize, indent),
      Segment.fourteenG1(segmentStyle, segmentSize, indent),
      Segment.fourteenF(segmentStyle, segmentSize, indent),
      Segment.fourteenE(segmentStyle, segmentSize, indent),
      Segment.fourteenD(segmentStyle, segmentSize, indent),
      Segment.fourteenC(segmentStyle, segmentSize, indent),
      Segment.fourteenB(segmentStyle, segmentSize, indent),
      Segment.fourteenA(segmentStyle, segmentSize, indent),
    ];
  }
}
