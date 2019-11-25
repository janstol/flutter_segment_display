import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:segment_display/src/character_segment_map.dart';
import 'package:segment_display/src/segment_style/default_segment_style.dart';
import 'package:segment_display/src/segment_style/hex_segment_style.dart';
import 'package:segment_display/src/segment/segment.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';
import 'package:segment_display/src/segment_display_painter.dart';

/// This class represents general segment display.
///
/// To create concrete segment display, extend [SegmentDisplay] class
/// and implement [createSingleCharacter] method.
abstract class SegmentDisplay extends StatelessWidget {
  /// Characters to be displayed on display.
  final String value;

  /// Size of characters on display.
  ///
  /// NOTE: [SegmentStyle.segmentBaseSize] * [size] = [segmentSize]
  final double size;

  /// Style for segments which defines shape, color or size for segments.
  ///
  /// Example: [DefaultSegmentStyle], [HexSegmentStyle]
  final SegmentStyle segmentStyle;

  /// Number of characters to display, used when building display.
  ///
  /// The [value] length will be used when no count is provided.
  ///
  /// If [characterCount] > [value.length] then text will be left padded.
  /// This also means if [characterCount] < [value.length] then
  /// only last X characters will be displayed (based on [characterCount]).
  ///
  /// For example:
  ///  * [characterCount] is set to 3 and [value] value to "1" -
  ///     this will be displayed like "__1" (left padded).
  ///  * [characterCount] is set to 1 and [value] value to "123" -
  ///     this will be displayed like "3" (only last character).
  final int characterCount;

  /// Space between individual characters
  final double characterSpacing;

  /// [Color] of display background
  final Color backgroundColor;

  /// Mappings from character (string) to int (hex) which represents enabled and
  /// disabled segments for given character.
  ///
  ///   * [CharacterSegmentMap.seven] for 7-segment display
  ///   * [CharacterSegmentMap.fourteen] for 14-segment display
  ///   * ...
  final Map<String, int> characterMap;

  const SegmentDisplay({
    Key key,
    @required this.value,
    @required this.characterMap,
    double size,
    SegmentStyle segmentStyle,
    this.characterCount,
    double characterSpacing,
    Color backgroundColor,
  })  : size = size ?? 10.0,
        segmentStyle = segmentStyle ?? const DefaultSegmentStyle(),
        characterSpacing = characterSpacing ?? 7.0,
        backgroundColor = backgroundColor ?? const Color(0xff000000),
        super(key: key);

  /// Size of segments.
  ///
  /// * [Size.width] represents 'thickness' of segment
  /// * [Size.height] represents 'length' of segment
  Size get segmentSize => segmentStyle.segmentBaseSize * size;

  @override
  Widget build(BuildContext context) {
    final _displaySize = computeSize();

    return Semantics(
      label: "Segment display",
      value: value,
      textDirection: TextDirection.ltr,
      child: Container(
        color: backgroundColor,
        child: SizedBox(
          width: _displaySize.width,
          height: _displaySize.height,
          child: CustomPaint(
            size: _displaySize,
            painter: SegmentDisplayPainter(
              segments: createDisplaySegments(),
              enabledColor: segmentStyle.enabledColor,
              disabledColor: segmentStyle.disabledColor,
            ),
          ),
        ),
      ),
    );
  }

  /// Returns `true` when [character] can be displayed on the display.
  bool canDisplay(String character) => characterMap.containsKey(character);

  /// Creates whole display - all characters (all segments)
  List<Segment> createDisplaySegments() {
    final charCount = characterCount ?? value.length;
    final segments = <Segment>[];

    double indent = 0;

    // Add left padding when characterCount > text.length
    for (var i = value.length - charCount; i < value.length; i++) {
      var char = "";
      if (i >= 0 && i < value.length) {
        char = value[i];
      }

      // handle dividers rendering
      if (CharacterSegmentMap.dividerCharacters.values.contains(char)) {
        final segment = createDividerCharacter(char, indent);
        if (segment != null) {
          indent += segmentSize.width + characterSpacing;
          segments.add(segment);
        }
        continue;
      }

      final characterSegments = createSingleCharacter(indent);

      // when character can be displayed, enable given segments
      if (char.isNotEmpty && canDisplay(char)) {
        final encoding = characterMap[char];
        for (var i = 0; i < characterSegments.length; i++) {
          if (encoding >> i & 1 == 1) {
            characterSegments[i].isEnabled = true;
          }
        }
      }

      indent += (2 * segmentSize.width + segmentSize.height) + characterSpacing;
      segments.addAll(characterSegments);
    }

    return segments;
  }

  /// Returns current [Size] of whole display.
  Size computeSize() {
    final dividers = CharacterSegmentMap.dividerCharacters.values;

    final charCount = characterCount ??
        value.split("").where((c) => !dividers.contains(c)).length;
    final dividerCharCount = value.split("").where(dividers.contains).length;

    final charsWidth = charCount * (2 * segmentSize.width + segmentSize.height);
    final dividersWidth = dividerCharCount * segmentSize.width;
    final width = charsWidth + dividersWidth;
    final widthOffset = characterSpacing * (charCount - 1) +
        (characterSpacing * dividerCharCount);
    final height = (2 * segmentSize.height) + (3 * segmentSize.width);

    return Size(width + widthOffset, height);
  }

  /// Creates segments to display a (single) character.
  List<Segment> createSingleCharacter(double indent);

  /// Creates special segment to display dividers like decimal point or colon.
  Segment createDividerCharacter(String character, double indent) {
    if (character == CharacterSegmentMap.dividerCharacters["decimalPoint"]) {
      return Segment.decimalPoint(segmentStyle, segmentSize, indent);
    } else if (character == CharacterSegmentMap.dividerCharacters["colon"]) {
      return Segment.colon(segmentStyle, segmentSize, indent);
    } else {
      return null;
    }
  }
}
