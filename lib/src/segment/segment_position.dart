import 'dart:ui';

/// Position of segment on display.
class SegmentPosition {
  /// Offset from left.
  final double left;

  /// Offset from top.
  final double top;

  /// Creates [SegmentPosition] with [left] and [top] offset.
  const SegmentPosition(this.left, this.top);

  //////////////////////////////////////////////////////////////////////////////
  // 7-segment
  //////////////////////////////////////////////////////////////////////////////

  /// Creates [SegmentPosition] for top segment in 7-segment display.
  SegmentPosition.sevenA(Size size, double padding)
      : this(size.width + padding, 0.0);

  /// Creates [SegmentPosition] for top right segment in 7-segment display.
  SegmentPosition.sevenB(Size size, double padding)
      : this(size.width + size.height + padding, size.width);

  /// Creates [SegmentPosition] for bottom right segment in 7-segment display.
  SegmentPosition.sevenC(Size size, double padding)
      : this(size.width + size.height + padding, 2 * size.width + size.height);

  /// Creates [SegmentPosition] for bottom segment in 7-segment display.
  SegmentPosition.sevenD(Size size, double padding)
      : this(size.width + padding, 2 * size.width + 2 * size.height);

  /// Creates [SegmentPosition] for bottom left segment in 7-segment display.
  SegmentPosition.sevenE(Size size, double padding)
      : this(padding, 2 * size.width + size.height);

  /// Creates [SegmentPosition] for top left segment in 7-segment display.
  SegmentPosition.sevenF(Size size, double padding) : this(padding, size.width);

  /// Creates [SegmentPosition] for middle segment in 7-segment display.
  SegmentPosition.sevenG(Size size, double padding)
      : this(size.width + padding, size.width + size.height);

  //////////////////////////////////////////////////////////////////////////////
  // 14-segment
  //////////////////////////////////////////////////////////////////////////////

  /// Creates [SegmentPosition] for top segment
  /// in 14-segment display.
  SegmentPosition.fourteenA(Size size, double padding)
      : this.sevenA(size, padding);

  /// Creates [SegmentPosition] for top right vertical segment
  /// in 14-segment display.
  SegmentPosition.fourteenB(Size size, double padding)
      : this.sevenB(size, padding);

  /// Creates [SegmentPosition] for bottom right vertical segment
  /// in 14-segment display,
  SegmentPosition.fourteenC(Size size, double padding)
      : this.sevenC(size, padding);

  /// Creates [SegmentPosition] for bottom segment
  /// in 14-segment display.
  SegmentPosition.fourteenD(Size size, double padding)
      : this.sevenD(size, padding);

  /// Creates [SegmentPosition] for bottom left vertical segment
  /// in 14-segment display.
  SegmentPosition.fourteenE(Size size, double padding)
      : this.sevenE(size, padding);

  /// Creates [SegmentPosition] for top left vertical segment
  /// in 14-segment display.
  SegmentPosition.fourteenF(Size size, double padding)
      : this.sevenF(size, padding);

  /// Creates [SegmentPosition] for middle left segment
  /// in 14-segment display.
  SegmentPosition.fourteenG1(Size size, double padding)
      : this(size.width + padding, size.height + size.width);

  /// Creates [SegmentPosition] for middle right segment
  /// in 14-segment display.
  SegmentPosition.fourteenG2(Size size, double padding)
      : this(
          2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
          size.height + size.width,
        );

  /// Creates [SegmentPosition] for top left diagonal segment
  /// in 14-segment display.
  SegmentPosition.fourteenH(Size size, double padding)
      : this(size.width + padding, size.width);

  /// Creates [SegmentPosition] for top center segment
  /// in 14-segment display.
  SegmentPosition.fourteenI(Size size, double padding)
      : this(
          size.width + (size.height / 2.0 - size.width / 2.0) + padding,
          size.width,
        );

  /// Creates [SegmentPosition] for top right diagonal segment
  /// in 14-segment display.
  SegmentPosition.fourteenJ(Size size, double padding)
      : this(
          2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
          size.width,
        );

  /// Creates [SegmentPosition] for bottom left diagonal segment
  /// in 14-segment display.
  SegmentPosition.fourteenK(Size size, double padding)
      : this(size.width + padding, 2 * size.width + size.height);

  /// Creates [SegmentPosition] for bottom center vertical segment
  /// in 14-segment display.
  SegmentPosition.fourteenL(Size size, double padding)
      : this(
          size.width + (size.height / 2.0 - size.width / 2.0) + padding,
          2 * size.width + size.height,
        );

  /// Creates [SegmentPosition] for bottom right diagonal segment
  /// in 14-segment display.
  SegmentPosition.fourteenM(Size size, double padding)
      : this(
          2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
          2 * size.width + size.height,
        );

  //////////////////////////////////////////////////////////////////////////////
  // 16-segment
  //////////////////////////////////////////////////////////////////////////////

  /// Returns [SegmentPosition] for top left horizontal segment
  /// in 16-segment display.
  SegmentPosition.sixteenA1(Size size, double padding)
      : this(size.width + padding, 0.0);

  /// Returns [SegmentPosition] for top right horizontal segment
  /// in 16-segment display.
  SegmentPosition.sixteenA2(Size size, double padding)
      : this(2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
            0.0);

  /// Returns [SegmentPosition] for top right vertical segment
  /// in 16-segment display.
  SegmentPosition.sixteenB(Size size, double padding)
      : this.sevenB(size, padding);

  /// Returns [SegmentPosition] for bottom right vertical segment
  /// in 14-segment display.
  SegmentPosition.sixteenC(Size size, double padding)
      : this.sevenC(size, padding);

  /// Returns [SegmentPosition] for bottom left horizontal segment
  /// in 16-segment display.
  SegmentPosition.sixteenD1(Size size, double padding)
      : this(
          2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
          2 * size.width + 2 * size.height,
        );

  /// Returns [SegmentPosition] for bottom right horizontal segment
  /// in 16-segment display.
  SegmentPosition.sixteenD2(Size size, double padding)
      : this(size.width + padding, 2 * size.width + 2 * size.height);

  /// Returns [SegmentPosition] for bottom left vertical segment
  /// in 16-segment display.
  SegmentPosition.sixteenE(Size size, double padding)
      : this.sevenE(size, padding);

  /// Returns [SegmentPosition] for top left vertical segment
  /// in 16-segment display.
  SegmentPosition.sixteenF(Size size, double padding)
      : this.sevenF(size, padding);

  /// Returns [SegmentPosition] for middle left segment
  /// in 16-segment display.
  SegmentPosition.sixteenG1(Size size, double padding)
      : this.fourteenG1(size, padding);

  /// Returns [SegmentPosition] for middle right segment
  /// in 16-segment display.
  SegmentPosition.sixteenG2(Size size, double padding)
      : this.fourteenG2(size, padding);

  /// Returns [SegmentPosition] for top left diagonal segment
  /// in 16-segment display.
  SegmentPosition.sixteenH(Size size, double padding)
      : this.fourteenH(size, padding);

  /// Returns [SegmentPosition] for top center vertical segment
  /// in 16-segment display.
  SegmentPosition.sixteenI(Size size, double padding)
      : this.fourteenI(size, padding);

  /// Returns [SegmentPosition] for top right diagonal segment
  /// in 16-segment display.
  SegmentPosition.sixteenJ(Size size, double padding)
      : this.fourteenJ(size, padding);

  /// Returns [SegmentPosition] for bottom left diagonal segment
  /// in 16-segment display
  SegmentPosition.sixteenK(Size size, double padding)
      : this.fourteenK(size, padding);

  /// Returns [SegmentPosition] for bottom center vertical segment
  /// in 16-segment display.
  SegmentPosition.sixteenL(Size size, double padding)
      : this.fourteenL(size, padding);

  /// Returns [SegmentPosition] for bottom right diagonal segment
  /// in 16-segment display.
  SegmentPosition.sixteenM(Size size, double padding)
      : this.fourteenM(size, padding);
}
