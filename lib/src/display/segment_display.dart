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
  final String text;

  /// Size of characters on display.
  ///
  /// NOTE: [SegmentStyle.segmentBaseSize] * [textSize] = [segmentSize]
  final double textSize;

  /// Style for segments which defines shape, color or size for segments.
  ///
  /// Example: [DefaultSegmentStyle], [HexSegmentStyle]
  final SegmentStyle segmentStyle;

  /// Number of characters to display, used when building display.
  ///
  /// The [text] length will be used when no count is provided.
  ///
  /// If [characterCount] > [text.length] then text will be left padded.
  /// This also means if [characterCount] < [text.lenght] then
  /// only last X characters will be displayed (based on [characterCount]).
  ///
  /// For example:
  ///  * [characterCount] is set to 3 and [text] value to "1" -
  ///     this will be displayed like "__1" (left padded).
  ///  * [characterCount] is set to 1 and [text] value to "123" -
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
    @required this.text,
    @required this.characterMap,
    double textSize,
    SegmentStyle segmentStyle,
    this.characterCount,
    double characterSpacing,
    Color backgroundColor,
  })  : textSize = textSize ?? 10.0,
        segmentStyle = segmentStyle ?? const DefaultSegmentStyle(),
        characterSpacing = characterSpacing ?? 7.0,
        backgroundColor = backgroundColor ?? const Color(0xff000000),
        super(key: key);

  /// Size of segments.
  ///
  /// * [Size.width] represents 'thickness' of segment
  /// * [Size.height] represents 'length' of segment
  Size get segmentSize => segmentStyle.segmentBaseSize * textSize;

  @override
  Widget build(BuildContext context) {
    final charCount = characterCount ?? text.length;
    final size = computeSize(charCount);

    return Semantics(
      label: "Segment display",
      value: text,
      textDirection: TextDirection.ltr,
      child: Container(
        color: backgroundColor,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: CustomPaint(
            size: size,
            painter: SegmentDisplayPainter(
              segments: createDisplaySegments(charCount, size),
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
  List<Segment> createDisplaySegments(int charCount, Size size) {
    final segments = <Segment>[];

    // Add left padding when characterCount > text.length
    for (var i = text.length - charCount; i < text.length; i++) {
      var char = "";
      if (i >= 0 && i < text.length) {
        char = text[i];
      }

      final characterSegments =
          createSingleCharacter(i - (text.length - charCount));

      // when character can be displayed, enable given segments
      if (char.isNotEmpty && canDisplay(char)) {
        final encoding = characterMap[char];
        for (var i = 0; i < characterSegments.length; i++) {
          if (encoding >> i & 1 == 1) {
            characterSegments[i].isEnabled = true;
          }
        }
      }

      segments.addAll(characterSegments);
    }

    return segments;
  }

  /// Returns current [Size] of whole display.
  Size computeSize(int charCount) {
    final width = charCount * (2 * segmentSize.width + segmentSize.height);
    final widthOffset = characterSpacing * (charCount - 1);
    final height = (2 * segmentSize.height) + (3 * segmentSize.width);

    return Size(width + widthOffset, height);
  }

  /// Creates segments to display a single character.
  List<Segment> createSingleCharacter(int charIndex);
}
