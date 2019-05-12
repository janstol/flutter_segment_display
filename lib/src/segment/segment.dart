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

  ///
  /// 7-segment
  ///

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

  ///
  /// 14-segment
  ///

  /// Creates top segment in 14-segment display
  Segment.fourteenA(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14A(segmentSize, padding));

  /// Creates top right segment in 14-segment display
  Segment.fourteenB(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14B(segmentSize, padding));

  /// Creates bottom right segment in 14-segment display
  Segment.fourteenC(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14C(segmentSize, padding));

  /// Creates bottom segment in 14-segment display
  Segment.fourteenD(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14D(segmentSize, padding));

  /// Creates bottom left segment in 14-segment display
  Segment.fourteenE(SegmentStyle style, Size segmentSize, double padding)
      : this(path: style.createPath14E(segmentSize, padding));

  /// Creates top left segment in 14-segment display
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
}
