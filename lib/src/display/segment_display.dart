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
  final int? characterCount;

  /// Space between individual characters
  final double characterSpacing;

  /// [Color] of display background
  final Color backgroundColor;

  /// When `true`, a decimal point is always rendered after each regular
  /// character — disabled (dim) by default, enabled when `.` follows that
  /// character in [value].
  ///
  /// This mirrors real hardware displays where each digit cell has a built-in
  /// dot that is always physically present.
  ///
  /// Example: `value: "12.3"` with `showDisabledDividers: true` renders the
  /// dot after `1` as disabled and the dot after `2` as enabled.
  final bool showDisabledDividers;

  /// Mappings from character (string) to int (hex) which represents enabled and
  /// disabled segments for given character.
  ///
  ///   * [CharacterSegmentMap.seven] for 7-segment display
  ///   * [CharacterSegmentMap.fourteen] for 14-segment display
  ///   * ...
  final Map<String, int> characterMap;

  const SegmentDisplay({
    super.key,
    required this.value,
    required this.characterMap,
    double? size,
    SegmentStyle? segmentStyle,
    this.characterCount,
    double? characterSpacing,
    Color? backgroundColor,
    bool? showDisabledDividers,
  })  : size = size ?? 10.0,
        segmentStyle = segmentStyle ?? const DefaultSegmentStyle(),
        characterSpacing = characterSpacing ?? 7.0,
        backgroundColor = backgroundColor ?? const Color(0xff000000),
        showDisabledDividers = showDisabledDividers ?? false;

  /// Size of segments.
  ///
  /// * [Size.width] represents 'thickness' of segment
  /// * [Size.height] represents 'length' of segment
  Size get segmentSize => segmentStyle.segmentBaseSize * size;

  @override
  Widget build(BuildContext context) {
    final displaySize = computeSize();

    return Semantics(
      label: 'Segment display',
      value: value,
      textDirection: TextDirection.ltr,
      child: Container(
        color: backgroundColor,
        child: SizedBox(
          width: displaySize.width,
          height: displaySize.height,
          child: CustomPaint(
            size: displaySize,
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

  /// Creates whole display - all characters (all segments).
  List<Segment> createDisplaySegments() {
    return showDisabledDividers
        ? _createDisplaySegmentsWithDots()
        : _createDisplaySegmentsDefault();
  }

  /// Default rendering: dividers only appear when present in [value].
  List<Segment> _createDisplaySegmentsDefault() {
    final charCount = characterCount ?? value.length;
    final segments = <Segment>[];
    final dividers = CharacterSegmentMap.dividerCharacters.values;

    double indent = 0;
    bool isFirst = true;

    for (var i = value.length - charCount; i < value.length; i++) {
      var char = '';
      if (i >= 0 && i < value.length) char = value[i];

      if (!isFirst) indent += characterSpacing;
      isFirst = false;

      if (dividers.contains(char)) {
        final segment = createDividerCharacter(char, indent);
        if (segment != null) {
          segments.add(segment);
          indent += segmentSize.width;
        }
        continue;
      }

      final characterSegments = createSingleCharacter(indent);
      if (char.isNotEmpty && canDisplay(char)) {
        final encoding = characterMap[char];
        for (var j = 0; j < characterSegments.length; j++) {
          if (encoding! >> j & 1 == 1) characterSegments[j].isEnabled = true;
        }
      }
      indent += (2 * segmentSize.width + segmentSize.height);
      segments.addAll(characterSegments);
    }

    return segments;
  }

  /// Rendering with [showDisabledDividers]: a decimal point is always shown
  /// after each regular character, enabled only when `.` follows in [value].
  /// Colons (`:`) are still rendered as standalone dividers.
  List<Segment> _createDisplaySegmentsWithDots() {
    final decimalPoint = CharacterSegmentMap.dividerCharacters['decimalPoint']!;
    final colon = CharacterSegmentMap.dividerCharacters['colon']!;

    // Pre-process value into (char, hasDot) pairs, consuming '.' characters.
    final pairs = _buildRenderPairs(decimalPoint, colon);

    // Apply characterCount: left-pad or trim.
    final charCount = characterCount ?? pairs.length;
    final padded = _applyCharacterCount(pairs, charCount);

    final segments = <Segment>[];
    double indent = 0;
    bool isFirst = true;

    for (final (char, hasDot, isColon) in padded) {
      if (!isFirst) indent += characterSpacing;
      isFirst = false;

      if (isColon) {
        final segment = createDividerCharacter(colon, indent);
        if (segment != null) {
          segments.add(segment);
          indent += segmentSize.width;
        }
        continue;
      }

      // Regular character
      final characterSegments = createSingleCharacter(indent);
      if (char.isNotEmpty && canDisplay(char)) {
        final encoding = characterMap[char];
        for (var j = 0; j < characterSegments.length; j++) {
          if (encoding! >> j & 1 == 1) characterSegments[j].isEnabled = true;
        }
      }
      indent += (2 * segmentSize.width + segmentSize.height);
      segments.addAll(characterSegments);

      // Decimal point (enabled or ghost)
      segments.add(Segment.decimalPoint(
        segmentStyle,
        segmentSize,
        indent,
        isEnabled: hasDot,
      ));
      indent += segmentSize.width;
    }

    return segments;
  }

  /// Converts [value] into a list of (char, hasDot, isColon) records,
  /// consuming '.' characters and associating them with the preceding char.
  List<(String, bool, bool)> _buildRenderPairs(
    String decimalPoint,
    String colon,
  ) {
    final result = <(String, bool, bool)>[];
    var i = 0;
    while (i < value.length) {
      final char = value[i];
      if (char == decimalPoint) {
        // Leading dot or dot after a colon — skip (unusual but safe).
        i++;
        continue;
      }
      if (char == colon) {
        result.add(('', false, true));
        i++;
        continue;
      }
      // Regular character — peek for following dot.
      final hasDot =
          i + 1 < value.length && value[i + 1] == decimalPoint;
      result.add((char, hasDot, false));
      i += hasDot ? 2 : 1;
    }
    return result;
  }

  /// Applies [charCount] to the pairs list: left-pad with empty slots or
  /// trim from the left.
  List<(String, bool, bool)> _applyCharacterCount(
    List<(String, bool, bool)> pairs,
    int charCount,
  ) {
    // Count only regular (non-colon) slots for padding.
    final regularCount = pairs.where((p) => !p.$3).length;
    if (regularCount < charCount) {
      final padding = List.filled(charCount - regularCount, ('', false, false));
      return [...padding, ...pairs];
    }
    if (regularCount > charCount) {
      // Trim from the left, keeping colons.
      var trimmed = [...pairs];
      var excess = regularCount - charCount;
      trimmed.removeWhere((p) {
        if (!p.$3 && excess > 0) {
          excess--;
          return true;
        }
        return false;
      });
      return trimmed;
    }
    return pairs;
  }

  /// Returns current [Size] of whole display.
  Size computeSize() {
    final height = (2 * segmentSize.height) + (3 * segmentSize.width);

    if (showDisabledDividers) {
      final decimalPoint =
          CharacterSegmentMap.dividerCharacters['decimalPoint']!;
      final colon = CharacterSegmentMap.dividerCharacters['colon']!;
      final pairs = _buildRenderPairs(decimalPoint, colon);
      final charCount = characterCount ??
          pairs.where((p) => !p.$3).length;
      final colonCount = pairs.where((p) => p.$3).length;
      final totalItems = charCount + colonCount;

      final charWidth = 2 * segmentSize.width + segmentSize.height;
      final dotWidth = segmentSize.width;
      final colonWidth = segmentSize.width;

      // Each regular char slot has charWidth + dotWidth (dot tightly attached).
      // Colons take colonWidth.
      // characterSpacing between each item (regular+dot groups and colons).
      final contentWidth =
          charCount * (charWidth + dotWidth) + colonCount * colonWidth;
      final spacingWidth =
          totalItems > 1 ? (totalItems - 1) * characterSpacing : 0.0;

      return Size(contentWidth + spacingWidth, height);
    }

    // Default sizing.
    final dividers = CharacterSegmentMap.dividerCharacters.values;
    final charCount = characterCount ??
        value.split('').where((c) => !dividers.contains(c)).length;
    final dividerCharCount =
        value.split('').where(dividers.contains).length;
    final totalItems = charCount + dividerCharCount;

    final charsWidth = charCount * (2 * segmentSize.width + segmentSize.height);
    final dividersWidth = dividerCharCount * segmentSize.width;
    final spacingWidth =
        totalItems > 1 ? (totalItems - 1) * characterSpacing : 0.0;

    return Size(charsWidth + dividersWidth + spacingWidth, height);
  }

  /// Creates segments to display a (single) character.
  List<Segment> createSingleCharacter(double indent);

  /// Creates special segment to display dividers like decimal point or colon.
  Segment? createDividerCharacter(String character, double indent) {
    if (character == CharacterSegmentMap.dividerCharacters['decimalPoint']) {
      return Segment.decimalPoint(segmentStyle, segmentSize, indent);
    } else if (character == CharacterSegmentMap.dividerCharacters['colon']) {
      return Segment.colon(segmentStyle, segmentSize, indent);
    } else {
      return null;
    }
  }
}
