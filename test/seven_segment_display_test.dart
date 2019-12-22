import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:segment_display/segment_display.dart';

import 'fixture.dart';

void main() {
  group('7-segment display tests', () {
    testWidgets('Default segment style', (tester) async {
      final widget = createSevenSegmentDisplayTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/7-default.png'),
      );
    });

    testWidgets('Rect segment style', (tester) async {
      final widget = createSevenSegmentDisplayTest(
        segmentStyle: const RectSegmentStyle(),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/7-rect.png'),
      );
    });

    testWidgets('Hex segment style', (tester) async {
      final widget = createSevenSegmentDisplayTest(
        segmentStyle: const HexSegmentStyle(),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/7-hex.png'),
      );
    });
  });
}
