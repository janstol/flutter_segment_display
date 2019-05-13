import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';

/// Single segment in segment display such as [SevenSegmentDisplay].
class Segment {
  /// Describes shape of segment (how to draw segment on canvas)
  Path path;

  /// State of segment - on or off
  bool isEnabled;

  /// Creates single display segment
  Segment({
    @required this.path,
    this.isEnabled = false,
  });

  //
  // 7-segment
  //

  /// Creates top segment in 7-segment display
  Segment.sevenA(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath7A(segmentSize, padding));

  /// Creates top right segment in 7-segment display
  Segment.sevenB(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath7B(segmentSize, padding));

  /// Creates bottom right segment in 7-segment display
  Segment.sevenC(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath7C(segmentSize, padding));

  /// Creates bottom segment in 7-segment display
  Segment.sevenD(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath7D(segmentSize, padding));

  /// Creates bottom left segment in 7-segment display
  Segment.sevenE(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath7E(segmentSize, padding));

  /// Creates top left segment in 7-segment display
  Segment.sevenF(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath7F(segmentSize, padding));

  /// Creates middle segment in 7-segment display
  Segment.sevenG(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath7G(segmentSize, padding));

  //
  // 14-segment
  //

  /// Creates top segment in 14-segment display
  Segment.fourteenA(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14A(segmentSize, padding));

  /// Creates top right vertical segment in 14-segment display
  Segment.fourteenB(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14B(segmentSize, padding));

  /// Creates bottom right vertical segment in 14-segment display
  Segment.fourteenC(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14C(segmentSize, padding));

  /// Creates bottom segment in 14-segment display
  Segment.fourteenD(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14D(segmentSize, padding));

  /// Creates bottom left vertical segment in 14-segment display
  Segment.fourteenE(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14E(segmentSize, padding));

  /// Creates top left vertical segment in 14-segment display
  Segment.fourteenF(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14F(segmentSize, padding));

  /// Creates middle left segment in 14-segment display
  Segment.fourteenG1(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14G1(segmentSize, padding));

  /// Creates middle right segment in 14-segment display
  Segment.fourteenG2(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14G2(segmentSize, padding));

  /// Creates top left diagonal segment in 14-segment display
  Segment.fourteenH(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14H(segmentSize, padding));

  /// Creates top center vertical segment in 14-segment display
  Segment.fourteenI(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14I(segmentSize, padding));

  /// Creates top right diagonal segment in 14-segment display
  Segment.fourteenJ(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14J(segmentSize, padding));

  /// Creates bottom left diagonal segment in 14-segment display
  Segment.fourteenK(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14K(segmentSize, padding));

  /// Creates bottom center vertical segment in 14-segment display
  Segment.fourteenL(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14L(segmentSize, padding));

  /// Creates bottom right diagonal segment in 14-segment display
  Segment.fourteenM(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14M(segmentSize, padding));

  //
  // 16-segment
  //

  /// Creates top left horizontal segment in 16-segment display
  Segment.sixteenA1(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16A1(segmentSize, padding));

  /// Creates top right horizontal segment in 16-segment display
  Segment.sixteenA2(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16A2(segmentSize, padding));

  /// Creates top right vertical segment in 16-segment display
  Segment.sixteenB(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16B(segmentSize, padding));

  /// Creates bottom right vertical segment in 16-segment display
  Segment.sixteenC(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16C(segmentSize, padding));

  /// Creates bottom right horizontal segment in 16-segment display
  Segment.sixteenD1(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16D1(segmentSize, padding));

  /// Creates bottom left horizontal segment in 16-segment display
  Segment.sixteenD2(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16D2(segmentSize, padding));

  /// Creates bottom left vertical segment in 16-segment display
  Segment.sixteenE(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16E(segmentSize, padding));

  /// Creates top left vertical segment in 16-segment display
  Segment.sixteenF(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16F(segmentSize, padding));

  /// Creates middle left segment in 16-segment display
  Segment.sixteenG1(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16G1(segmentSize, padding));

  /// Creates middle right segment in 16-segment display
  Segment.sixteenG2(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16G2(segmentSize, padding));

  /// Creates top left diagonal segment in 16-segment display
  Segment.sixteenH(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16H(segmentSize, padding));

  /// Creates top center vertical segment in 16-segment display
  Segment.sixteenI(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16I(segmentSize, padding));

  /// Creates top right diagonal segment in 16-segment display
  Segment.sixteenJ(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16J(segmentSize, padding));

  /// Creates bottom left diagonal segment in 16-segment display
  Segment.sixteenK(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16K(segmentSize, padding));

  /// Creates bottom center vertical segment in 16-segment display
  Segment.sixteenL(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16L(segmentSize, padding));

  /// Creates bottom right diagonal segment in 16-segment display
  Segment.sixteenM(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath16M(segmentSize, padding));
}
