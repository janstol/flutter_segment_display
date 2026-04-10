import 'package:segment_display/src/character_segment_map.dart';
import 'package:segment_display/src/display/segment_display.dart';
import 'package:segment_display/src/segment/segment.dart';

/// 7-segment display stateless widget.
///
/// * [Wikipedia: Seven-segment display](https://en.wikipedia.org/wiki/Seven-segment_display)
class SevenSegmentDisplay extends SegmentDisplay {
  /// Creates a 7-segment display.
  ///
  /// see [SegmentDisplay] for more info about properties and methods.
  ///
  /// Use [customCharacterMap] to add or override character-to-bitmask entries.
  /// Custom entries are merged on top of [CharacterSegmentMap.seven].
  ///
  /// Example — custom pattern for character `'*'`:
  /// ```dart
  /// SevenSegmentDisplay(
  ///   value: '*',
  ///   customCharacterMap: {'*': 0x63},
  /// )
  /// ```
  SevenSegmentDisplay({
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
              ? CharacterSegmentMap.seven
              : {...CharacterSegmentMap.seven, ...customCharacterMap},
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
