import 'package:segment_display/src/character_segment_map.dart';
import 'package:segment_display/src/display/segment_display.dart';
import 'package:segment_display/src/segment/segment.dart';

/// 16-segment display stateless widget.
///
/// * [Wikipedia: Sixteen-segment display](https://en.wikipedia.org/wiki/Sixteen-segment_display)
class SixteenSegmentDisplay extends SegmentDisplay {
  /// Creates a 16-segment display.
  ///
  /// see [SegmentDisplay] for more info about properties and methods.
  ///
  /// Use [customCharacterMap] to add or override character-to-bitmask entries.
  /// Custom entries are merged on top of [CharacterSegmentMap.sixteen].
  SixteenSegmentDisplay({
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
              ? CharacterSegmentMap.sixteen
              : {...CharacterSegmentMap.sixteen, ...customCharacterMap},
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
