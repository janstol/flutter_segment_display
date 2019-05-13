import 'dart:ui';

/// Position of segment on display
class SegmentPosition {
  /// Offset from left
  final double left;

  /// Offset from top
  final double top;

  /// Creates [SegmentPosition] with [left] and [top] offset
  const SegmentPosition(this.left, this.top);

  //
  // 7-segment
  //

  /// Returns [SegmentPosition] for top segment in 7-segment display
  static SegmentPosition sevenA(Size size, double padding) => SegmentPosition(
        size.width + padding,
        0.0,
      );

  /// Returns [SegmentPosition] for top right segment in 7-segment display
  static SegmentPosition sevenB(Size size, double padding) => SegmentPosition(
        size.width + size.height + padding,
        size.width,
      );

  /// Returns [SegmentPosition] for bottom right segment in 7-segment display
  static SegmentPosition sevenC(Size size, double padding) => SegmentPosition(
        size.width + size.height + padding,
        2 * size.width + size.height,
      );

  /// Returns [SegmentPosition] for bottom segment in 7-segment display
  static SegmentPosition sevenD(Size size, double padding) => SegmentPosition(
        size.width + padding,
        2 * size.width + 2 * size.height,
      );

  /// Returns [SegmentPosition] for bottom letft segment in 7-segment display
  static SegmentPosition sevenE(Size size, double padding) => SegmentPosition(
        padding,
        2 * size.width + size.height,
      );

  /// Returns [SegmentPosition] for top left segment in 7-segment display
  static SegmentPosition sevenF(Size size, double padding) => SegmentPosition(
        padding,
        size.width,
      );

  /// Returns [SegmentPosition] for middle segment in 7-segment display
  static SegmentPosition sevenG(Size size, double padding) => SegmentPosition(
        size.width + padding,
        size.width + size.height,
      );

  //
  // 14-segment
  //

  /// Returns [SegmentPosition] for top segment in 14-segment display
  static SegmentPosition fourteenA(Size size, double padding) =>
      sevenA(size, padding);

  /// Returns [SegmentPosition] for top right vertical segment in 14-segment display
  static SegmentPosition fourteenB(Size size, double padding) =>
      sevenB(size, padding);

  /// Returns [SegmentPosition] for bottom right vertical segment in 14-segment display
  static SegmentPosition fourteenC(Size size, double padding) =>
      sevenC(size, padding);

  /// Returns [SegmentPosition] for bottom segment in 14-segment display
  static SegmentPosition fourteenD(Size size, double padding) =>
      sevenD(size, padding);

  /// Returns [SegmentPosition] for bottom left vertical segment in 14-segment display
  static SegmentPosition fourteenE(Size size, double padding) =>
      sevenE(size, padding);

  /// Returns [SegmentPosition] for top left vertical segment in 14-segment display
  static SegmentPosition fourteenF(Size size, double padding) =>
      sevenF(size, padding);

  /// Returns [SegmentPosition] for middle left segment in 14-segment display
  static SegmentPosition fourteenG1(Size size, double padding) =>
      SegmentPosition(
        size.width + padding,
        size.height + size.width,
      );

  /// Returns [SegmentPosition] for middle right segment in 14-segment display
  static SegmentPosition fourteenG2(Size size, double padding) =>
      SegmentPosition(
        2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
        size.height + size.width,
      );

  /// Returns [SegmentPosition] for top left diagonal segment in 14-segment display
  static SegmentPosition fourteenH(Size size, double padding) =>
      SegmentPosition(
        size.width + padding,
        size.width,
      );

  /// Returns [SegmentPosition] for top center segment in 14-segment display
  static SegmentPosition fourteenI(Size size, double padding) =>
      SegmentPosition(
        size.width + (size.height / 2.0 - size.width / 2.0) + padding,
        size.width,
      );

  /// Returns [SegmentPosition] for top right diagonal segment in 14-segment display
  static SegmentPosition fourteenJ(Size size, double padding) =>
      SegmentPosition(
        2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
        size.width,
      );

  /// Returns [SegmentPosition] for bottom left diagonal segment in 14-segment display
  static SegmentPosition fourteenK(Size size, double padding) =>
      SegmentPosition(
        size.width + padding,
        2 * size.width + size.height,
      );

  /// Returns [SegmentPosition] for bottom center vertical segment in 14-segment display
  static SegmentPosition fourteenL(Size size, double padding) =>
      SegmentPosition(
        size.width + (size.height / 2.0 - size.width / 2.0) + padding,
        2 * size.width + size.height,
      );

  /// Returns [SegmentPosition] for bottom right diagonal segment in 14-segment display
  static SegmentPosition fourteenM(Size size, double padding) =>
      SegmentPosition(
        2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
        2 * size.width + size.height,
      );

  //
  // 14-segment
  //

  /// Returns [SegmentPosition] for top left horizontal segment in 16-segment display
  static SegmentPosition sixteenA1(Size size, double padding) =>
      SegmentPosition(
        size.width + padding,
        0.0,
      );

  /// Returns [SegmentPosition] for top right horizontal segment in 16-segment display
  static SegmentPosition sixteenA2(Size size, double padding) =>
      SegmentPosition(
        2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
        0.0,
      );

  /// Returns [SegmentPosition] for top right vertical segment in 16-segment display
  static SegmentPosition sixteenB(Size size, double padding) =>
      sevenB(size, padding);

  /// Returns [SegmentPosition] for bottom right vertical segment in 14-segment display
  static SegmentPosition sixteenC(Size size, double padding) =>
      sevenC(size, padding);

  /// Returns [SegmentPosition] for bottom left horizontal segment in 16-segment display
  static SegmentPosition sixteenD1(Size size, double padding) =>
      SegmentPosition(
        2 * size.width + (size.height / 2.0 - size.width / 2.0) + padding,
        2 * size.width + 2 * size.height,
      );

  /// Returns [SegmentPosition] for bottom right horizontal segment in 16-segment display
  static SegmentPosition sixteenD2(Size size, double padding) =>
      SegmentPosition(
        size.width + padding,
        2 * size.width + 2 * size.height,
      );

  /// Returns [SegmentPosition] for bottom left vertical segment in 16-segment display
  static SegmentPosition sixteenE(Size size, double padding) =>
      sevenE(size, padding);

  /// Returns [SegmentPosition] for top left vertical segment in 16-segment display
  static SegmentPosition sixteenF(Size size, double padding) =>
      sevenF(size, padding);

  /// Returns [SegmentPosition] for middle left segment in 16-segment display
  static SegmentPosition sixteenG1(Size size, double padding) =>
      fourteenG1(size, padding);

  /// Returns [SegmentPosition] for middle right segment in 16-segment display
  static SegmentPosition sixteenG2(Size size, double padding) =>
      fourteenG2(size, padding);

  /// Returns [SegmentPosition] for top left diagonal segment in 16-segment display
  static SegmentPosition sixteenH(Size size, double padding) =>
      fourteenH(size, padding);

  /// Returns [SegmentPosition] for top center vertical segment in 16-segment display
  static SegmentPosition sixteenI(Size size, double padding) =>
      fourteenI(size, padding);

  /// Returns [SegmentPosition] for top right diagonal segment in 16-segment display
  static SegmentPosition sixteenJ(Size size, double padding) =>
      fourteenJ(size, padding);

  /// Returns [SegmentPosition] for bottom left diagonal segment in 16-segment display
  static SegmentPosition sixteenK(Size size, double padding) =>
      fourteenK(size, padding);

  /// Returns [SegmentPosition] for bottom center vertical segment in 16-segment display
  static SegmentPosition sixteenL(Size size, double padding) =>
      fourteenL(size, padding);

  /// Returns [SegmentPosition] for bottom right diagonal segment in 16-segment display
  static SegmentPosition sixteenM(Size size, double padding) =>
      fourteenM(size, padding);
}
