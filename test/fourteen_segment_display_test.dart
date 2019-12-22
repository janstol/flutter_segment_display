import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:segment_display/segment_display.dart';

import 'fixture.dart';

void main() {
  group('14-segment display tests', () {
    testWidgets('Default segment style', (tester) async {
      final widget = createFourteenSegmentDisplayTest();

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/14-default.png'),
      );
    });

    testWidgets('Rect segment style', (tester) async {
      final widget = createFourteenSegmentDisplayTest(
        segmentStyle: const RectSegmentStyle(),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/14-rect.png'),
      );
    });

    testWidgets('Hex segment style', (tester) async {
      final widget = createFourteenSegmentDisplayTest(
        segmentStyle: const HexSegmentStyle(),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/14-hex.png'),
      );
    });
  });
}
