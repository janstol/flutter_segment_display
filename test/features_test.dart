import 'package:flutter_test/flutter_test.dart';
import 'package:segment_display/segment_display.dart';

void main() {
  // Use size=1 and segmentBaseSize=Size(1,4) so segmentSize=Size(1,4):
  //   charWidth = 2*1 + 4 = 6
  //   dotWidth  = 1
  // Default characterSpacing = 7
  const size = 1.0;
  const spacing = 7.0;
  const charW = 6.0; // 2*segW + segH
  const dotW = 1.0; // segW

  // ---------------------------------------------------------------------------
  // Issue #5 — computeSize consistency
  // ---------------------------------------------------------------------------
  group('computeSize — default mode', () {
    test('single character', () {
      final d = SevenSegmentDisplay(value: '1', size: size);
      final s = d.computeSize();
      // 1 char, 0 dividers, 0 spacings
      expect(s.width, charW);
    });

    test('three characters', () {
      final d = SevenSegmentDisplay(value: '123', size: size);
      final s = d.computeSize();
      // 3 chars, 2 spacings
      expect(s.width, 3 * charW + 2 * spacing);
    });

    test('value with decimal point', () {
      final d = SevenSegmentDisplay(value: '1.2', size: size);
      final s = d.computeSize();
      // 2 chars + 1 divider = 3 items, 2 spacings
      expect(s.width, 2 * charW + dotW + 2 * spacing);
    });

    test('single character with characterCount=3', () {
      final d =
          SevenSegmentDisplay(value: '1', size: size, characterCount: 3);
      final s = d.computeSize();
      // 3 char slots, 2 spacings
      expect(s.width, 3 * charW + 2 * spacing);
    });
  });

  // ---------------------------------------------------------------------------
  // Issue #6 — showDisabledDividers
  // ---------------------------------------------------------------------------
  group('showDisabledDividers', () {
    test('computeSize: 3 chars without decimal in value', () {
      final d = SevenSegmentDisplay(
        value: '123',
        size: size,
        showDisabledDividers: true,
      );
      final s = d.computeSize();
      // 3 char+dot groups, 2 spacings between groups
      expect(s.width, 3 * (charW + dotW) + 2 * spacing);
    });

    test('computeSize: 2 chars with decimal between them', () {
      final d = SevenSegmentDisplay(
        value: '1.2',
        size: size,
        showDisabledDividers: true,
      );
      final s = d.computeSize();
      // 2 char+dot groups, 1 spacing between them
      expect(s.width, 2 * (charW + dotW) + 1 * spacing);
    });

    test('createDisplaySegments: disabled dot added after each char', () {
      final d = SevenSegmentDisplay(
        value: '12',
        size: size,
        showDisabledDividers: true,
      );
      final segments = d.createDisplaySegments();
      // 7 segs * 2 chars + 2 dots = 16
      expect(segments.length, 7 * 2 + 2);
    });

    test('createDisplaySegments: dot is enabled when . follows char', () {
      final d = SevenSegmentDisplay(
        value: '1.2',
        size: size,
        showDisabledDividers: true,
      );
      final segments = d.createDisplaySegments();
      // 7 segs * 2 chars + 2 dots = 16
      expect(segments.length, 7 * 2 + 2);
      // dot after '1' is the 8th segment (index 7), should be enabled
      expect(segments[7].isEnabled, isTrue);
      // dot after '2' is the 16th segment (index 15), should be disabled
      expect(segments[15].isEnabled, isFalse);
    });

    test('createDisplaySegments: all dots disabled when no . in value', () {
      final d = SevenSegmentDisplay(
        value: '123',
        size: size,
        showDisabledDividers: true,
      );
      final segments = d.createDisplaySegments();
      // 7*3 + 3 dots = 24
      expect(segments.length, 24);
      // dots at index 7, 15, 23
      expect(segments[7].isEnabled, isFalse);
      expect(segments[15].isEnabled, isFalse);
      expect(segments[23].isEnabled, isFalse);
    });

    test('default false — no extra dot segments', () {
      final d = SevenSegmentDisplay(value: '12', size: size);
      final segments = d.createDisplaySegments();
      // 7 segs * 2 chars = 14 (no dots)
      expect(segments.length, 14);
    });
  });

  // ---------------------------------------------------------------------------
  // Issue #1 — customCharacterMap
  // ---------------------------------------------------------------------------
  group('customCharacterMap', () {
    test('custom entry is used to enable segments', () {
      // 0x7F = all 7 segments enabled
      const customMap = <String, int>{'@': 0x7F};
      final d = SevenSegmentDisplay(
        value: '@',
        size: size,
        customCharacterMap: customMap,
      );
      final segments = d.createDisplaySegments();
      expect(segments.length, 7);
      expect(segments.every((s) => s.isEnabled), isTrue);
    });

    test('custom entry overrides built-in entry', () {
      // Override '0' to show nothing
      final d = SevenSegmentDisplay(
        value: '0',
        size: size,
        customCharacterMap: {'0': 0x00},
      );
      final segments = d.createDisplaySegments();
      expect(segments.every((s) => !s.isEnabled), isTrue);
    });

    test('null customCharacterMap uses default map', () {
      final d = SevenSegmentDisplay(value: '0', size: size);
      final segments = d.createDisplaySegments();
      // 0x7E = 0111 1110 = 6 segments enabled (all except middle)
      expect(segments.where((s) => s.isEnabled).length, 6);
    });

    test('fourteen segment display supports customCharacterMap', () {
      final d = FourteenSegmentDisplay(
        value: '@',
        size: size,
        customCharacterMap: {'@': 0x3FFF}, // all 14 segments
      );
      final segments = d.createDisplaySegments();
      expect(segments.every((s) => s.isEnabled), isTrue);
    });

    test('sixteen segment display supports customCharacterMap', () {
      final d = SixteenSegmentDisplay(
        value: '@',
        size: size,
        customCharacterMap: {'@': 0xFFFF}, // all 16 segments
      );
      final segments = d.createDisplaySegments();
      expect(segments.every((s) => s.isEnabled), isTrue);
    });
  });
}
