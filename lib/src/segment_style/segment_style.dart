import 'dart:ui';

import 'package:segment_display/src/segment/segment_position.dart';

/// Style describes how to draw segments ([Path]) and how they should look like ([Color] etc.).
///
/// To create your own segment style, extend this [SegmentStyle] class and implement
/// [createHorizontalPath], [createVerticalPath], [createDiagonalForwardPath] and
/// [createDiagonalBackwardPath] methods.
///
/// To customize each segment separately, you can override `createPath*` methods:
///   * createPath7*   for 7-segment display
///   * createPath14*  for 14-segment display
///
/// For example: if you want to change the shape of the top segment in 7-segment
/// display, you can override [createPath7A] method.
/// You don't have to override all `createPath*` methods.
abstract class SegmentStyle {
  /// Base size of every segment used as size ratio for each segment
  ///
  /// * [Size.width] represents 'thickness' of segment
  /// * [Size.height] represents 'length' of segment
  ///
  /// example: Size(1.0, 4.0) means that segment will be 1 unit wide/thick and 4 units long
  final Size segmentBaseSize;

  /// [Color] of every enabled segment
  final Color enabledColor;

  /// [Color] of every disabled segment
  final Color disabledColor;

  const SegmentStyle({
    Size segmentBaseSize,
    Color enabledColor,
    Color disabledColor,
  })  : this.segmentBaseSize = segmentBaseSize ?? const Size(1.0, 4.0),
        this.enabledColor = enabledColor ?? const Color(0xffff0000),
        this.disabledColor = disabledColor ?? const Color(0x2fff0000);

  ///
  /// Base methods for creating path for segments
  ///
  /// You can customize each segment path separately by overriding createPath*
  /// methods (see below)
  ///

  /// Default method to create path for horizontal segments
  Path createHorizontalPath(SegmentPosition position, Size segmentSize);

  /// Default method to create path for vertical segments
  Path createVerticalPath(SegmentPosition position, Size segmentSize);

  /// Default method to create path for diagonal 'forward' segments
  Path createDiagonalForwardPath(SegmentPosition position, Size segmentSize);

  /// Default method to create path for diagonal 'backward' segments
  Path createDiagonalBackwardPath(SegmentPosition position, Size segmentSize);

  ///
  /// 7-Segment
  ///

  ///
  /// Creates path for top segment in 7-segment display
  Path createPath7A(Size segmentSize, double padding) => createHorizontalPath(
        SegmentPosition.sevenA(segmentSize, padding),
        segmentSize,
      );

  /// Creates path for top right segment in 7-segment display
  Path createPath7B(Size segmentSize, double padding) => createVerticalPath(
        SegmentPosition.sevenB(segmentSize, padding),
        segmentSize,
      );

  /// Creates path for bottom right segment in 7-segment display
  Path createPath7C(Size segmentSize, double padding) => createVerticalPath(
        SegmentPosition.sevenC(segmentSize, padding),
        segmentSize,
      );

  /// Creates path for bottom segment in 7-segment display
  Path createPath7D(Size segmentSize, double padding) => createHorizontalPath(
        SegmentPosition.sevenD(segmentSize, padding),
        segmentSize,
      );

  /// Creates path for bottom left segment in 7-segment display
  Path createPath7E(Size segmentSize, double padding) => createVerticalPath(
        SegmentPosition.sevenE(segmentSize, padding),
        segmentSize,
      );

  /// Creates path for top left segment in 7-segment display
  Path createPath7F(Size segmentSize, double padding) => createVerticalPath(
        SegmentPosition.sevenF(segmentSize, padding),
        segmentSize,
      );

  /// Creates path for middle segment in 7-segment display
  Path createPath7G(Size segmentSize, double padding) => createHorizontalPath(
        SegmentPosition.sevenG(segmentSize, padding),
        segmentSize,
      );

  ///
  /// 14-Segment
  ///

  /// Creates path for top segment in 14-segment display
  Path createPath14A(Size segmentSize, double padding) =>
      createPath7A(segmentSize, padding);

  /// Creates path for top right segment in 14-segment display
  Path createPath14B(Size segmentSize, double padding) =>
      createPath7B(segmentSize, padding);

  /// Creates path for bottom right segment in 14-segment display
  Path createPath14C(Size segmentSize, double padding) =>
      createPath7C(segmentSize, padding);

  /// Creates path for bottom segment in 14-segment display
  Path createPath14D(Size segmentSize, double padding) =>
      createPath7D(segmentSize, padding);

  /// Creates path for bottom left segment in 14-segment display
  Path createPath14E(Size segmentSize, double padding) =>
      createPath7E(segmentSize, padding);

  /// Creates path for top left segment in 14-segment display
  Path createPath14F(Size segmentSize, double padding) =>
      createPath7F(segmentSize, padding);

  /// Creates path for middle left segment in 14-segment display
  Path createPath14G1(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenG1(segmentSize, padding);
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);
    return createHorizontalPath(pos, Size(segmentSize.width, halfHeight));
  }

  /// Creates path for middle right segment in 14-segment display
  Path createPath14G2(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenG2(segmentSize, padding);
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);
    return createHorizontalPath(pos, Size(segmentSize.width, halfHeight));
  }

  /// Creates path for top left diagonal segment in 14-segment display
  Path createPath14H(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenH(segmentSize, padding);
    return createDiagonalBackwardPath(pos, segmentSize);
  }

  /// Creates path for top center segment in 14-segment display
  Path createPath14I(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenI(segmentSize, padding);
    return createVerticalPath(pos, segmentSize);
  }

  /// Creates path for top right diagonal segment in 14-segment display
  Path createPath14J(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenJ(segmentSize, padding);
    return createDiagonalForwardPath(pos, segmentSize);
  }

  /// Creates path for bottom left diagonal segment in 14-segment display
  Path createPath14K(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenK(segmentSize, padding);
    return createDiagonalForwardPath(pos, segmentSize);
  }

  /// Creates path for bottom center segment in 14-segment display
  Path createPath14L(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenL(segmentSize, padding);
    return createVerticalPath(pos, segmentSize);
  }

  /// Creates path for bottom right diagonal segment in 14-segment display
  Path createPath14M(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenM(segmentSize, padding);
    return createDiagonalBackwardPath(pos, segmentSize);
  }
}
