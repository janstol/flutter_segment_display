import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:segment_display/src/segment/segment_position.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';

/// Default (trapezoid) [SegmentStyle].
class DefaultSegmentStyle extends SegmentStyle {
  /// Space between segments
  final double segmentSpacing;

  final double _halfSpace;

  /// Creates default [SegmentStyle]
  const DefaultSegmentStyle({
    Size segmentBaseSize,
    Color enabledColor,
    Color disabledColor,
    this.segmentSpacing = 4.0,
  })  : _halfSpace = segmentSpacing / 2,
        super(
          segmentBaseSize: segmentBaseSize,
          enabledColor: enabledColor,
          disabledColor: disabledColor,
        );

  @override
  Path createHorizontalPath(SegmentPosition position, Size segmentSize) {
    return Path()
      ..moveTo(position.left, position.top)
      ..lineTo(position.left + segmentSize.height, position.top)
      ..lineTo(
          position.left + segmentSize.height, position.top + segmentSize.width)
      ..lineTo(position.left, position.top + segmentSize.width)
      ..close();
  }

  @override
  Path createVerticalPath(SegmentPosition position, Size segmentSize) {
    return Path()
      ..moveTo(position.left, position.top)
      ..lineTo(position.left + segmentSize.width, position.top)
      ..lineTo(
          position.left + segmentSize.width, position.top + segmentSize.height)
      ..lineTo(position.left, position.top + segmentSize.height)
      ..close();
  }

  @override
  Path createDiagonalForwardPath(SegmentPosition position, Size segmentSize) {
    final w = 1.6 * segmentSize.width;
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(
          position.left + halfHeight - _halfSpace, position.top + _halfSpace)
      ..lineTo(position.left + halfHeight - _halfSpace,
          position.top + w + _halfSpace)
      ..lineTo(position.left + _halfSpace,
          position.top + segmentSize.height - _halfSpace)
      ..lineTo(position.left + _halfSpace,
          position.top + segmentSize.height - w - _halfSpace)
      ..close();
  }

  @override
  Path createDiagonalBackwardPath(SegmentPosition position, Size segmentSize) {
    final w = 1.6 * segmentSize.width;
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(position.left + _halfSpace, position.top + _halfSpace)
      ..lineTo(position.left + halfHeight - _halfSpace,
          position.top + segmentSize.height - w - _halfSpace)
      ..lineTo(position.left + halfHeight - _halfSpace,
          position.top + segmentSize.height - _halfSpace)
      ..lineTo(position.left + _halfSpace, position.top + w + _halfSpace)
      ..close();
  }

  //
  // 7-segment overrides
  //

  @override
  Path createPath7A(Size segmentSize, double padding) {
    final pos = SegmentPosition.sevenA(segmentSize, padding);
    return Path()
      ..moveTo(pos.left - segmentSize.width + _halfSpace, pos.top)
      ..lineTo(pos.left + segmentSize.height + segmentSize.width - _halfSpace,
          pos.top)
      ..lineTo(pos.left + segmentSize.height - _halfSpace,
          pos.top + segmentSize.width)
      ..lineTo(pos.left + _halfSpace, pos.top + segmentSize.width)
      ..close();
  }

  @override
  Path createPath7B(Size segmentSize, double padding) {
    final pos = SegmentPosition.sevenB(segmentSize, padding);
    return Path()
      ..moveTo(pos.left, pos.top + _halfSpace)
      ..lineTo(pos.left + segmentSize.width,
          pos.top - segmentSize.width + _halfSpace)
      ..lineTo(pos.left + segmentSize.width,
          pos.top + segmentSize.height + segmentSize.width / 2 - _halfSpace)
      ..lineTo(pos.left, pos.top + segmentSize.height - _halfSpace)
      ..close();
  }

  @override
  Path createPath7C(Size segmentSize, double padding) {
    final pos = SegmentPosition.sevenC(segmentSize, padding);
    return Path()
      ..moveTo(pos.left, pos.top + _halfSpace)
      ..lineTo(pos.left + segmentSize.width,
          pos.top - segmentSize.width / 2 + _halfSpace)
      ..lineTo(pos.left + segmentSize.width,
          pos.top + segmentSize.height + segmentSize.width - _halfSpace)
      ..lineTo(pos.left, pos.top + segmentSize.height - _halfSpace)
      ..close();
  }

  @override
  Path createPath7D(Size segmentSize, double padding) {
    final pos = SegmentPosition.sevenD(segmentSize, padding);
    return Path()
      ..moveTo(pos.left + _halfSpace, pos.top)
      ..lineTo(pos.left + segmentSize.height - _halfSpace, pos.top)
      ..lineTo(pos.left + segmentSize.height + segmentSize.width - _halfSpace,
          pos.top + segmentSize.width)
      ..lineTo(pos.left - segmentSize.width + _halfSpace,
          pos.top + segmentSize.width)
      ..close();
  }

  @override
  Path createPath7E(Size segmentSize, double padding) {
    final pos = SegmentPosition.sevenE(segmentSize, padding);

    return Path()
      ..moveTo(pos.left, pos.top - segmentSize.width / 2 + _halfSpace)
      ..lineTo(pos.left + segmentSize.width, pos.top + _halfSpace)
      ..lineTo(pos.left + segmentSize.width,
          pos.top + segmentSize.height - _halfSpace)
      ..lineTo(pos.left,
          pos.top + segmentSize.width + segmentSize.height - _halfSpace)
      ..close();
  }

  @override
  Path createPath7F(Size segmentSize, double padding) {
    final pos = SegmentPosition.sevenF(segmentSize, padding);
    return Path()
      ..moveTo(pos.left, pos.top - segmentSize.width + _halfSpace)
      ..lineTo(pos.left + segmentSize.width, pos.top + _halfSpace)
      ..lineTo(pos.left + segmentSize.width,
          pos.top + segmentSize.height - _halfSpace)
      ..lineTo(pos.left,
          pos.top + segmentSize.width / 2 + segmentSize.height - _halfSpace)
      ..close();
  }

  @override
  Path createPath7G(Size segmentSize, double padding) {
    final pos = SegmentPosition.sevenG(segmentSize, padding);
    return Path()
      ..moveTo(pos.left + _halfSpace, pos.top)
      ..lineTo(pos.left + segmentSize.height - _halfSpace, pos.top)
      ..lineTo(
        pos.left + segmentSize.height + segmentSize.width - _halfSpace,
        pos.top + segmentSize.width / 2,
      )
      ..lineTo(pos.left + segmentSize.height - _halfSpace,
          pos.top + segmentSize.width)
      ..lineTo(pos.left + _halfSpace, pos.top + segmentSize.width)
      ..lineTo(
        pos.left - segmentSize.width + _halfSpace,
        pos.top + segmentSize.width / 2,
      )
      ..close();
  }

  //
  // 14-segment overrides
  //

  @override
  Path createPath14A(Size segmentSize, double padding) =>
      createPath7A(segmentSize, padding);

  @override
  Path createPath14B(Size segmentSize, double padding) =>
      createPath7B(segmentSize, padding);

  @override
  Path createPath14C(Size segmentSize, double padding) =>
      createPath7C(segmentSize, padding);

  @override
  Path createPath14D(Size segmentSize, double padding) =>
      createPath7D(segmentSize, padding);

  @override
  Path createPath14E(Size segmentSize, double padding) =>
      createPath7E(segmentSize, padding);

  @override
  Path createPath14F(Size segmentSize, double padding) =>
      createPath7F(segmentSize, padding);

  @override
  Path createPath14G1(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenG1(segmentSize, padding);
    final halfWidth = segmentSize.width / 2.0;
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(pos.left + _halfSpace, pos.top)
      ..lineTo(pos.left + halfHeight - _halfSpace, pos.top)
      ..lineTo(
        pos.left + halfHeight + halfWidth - _halfSpace,
        pos.top + halfWidth,
      )
      ..lineTo(pos.left + halfHeight - _halfSpace, pos.top + segmentSize.width)
      ..lineTo(pos.left + _halfSpace, pos.top + segmentSize.width)
      ..lineTo(pos.left - segmentSize.width + _halfSpace, pos.top + halfWidth)
      ..close();
  }

  @override
  Path createPath14G2(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenG2(segmentSize, padding);
    final halfWidth = segmentSize.width / 2.0;
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(pos.left + _halfSpace, pos.top)
      ..lineTo(pos.left + halfHeight - _halfSpace, pos.top)
      ..lineTo(
        pos.left + halfHeight + segmentSize.width - _halfSpace,
        pos.top + halfWidth,
      )
      ..lineTo(pos.left + halfHeight - _halfSpace, pos.top + segmentSize.width)
      ..lineTo(pos.left + _halfSpace, pos.top + segmentSize.width)
      ..lineTo(pos.left - halfWidth + _halfSpace, pos.top + halfWidth)
      ..close();
  }

  @override
  Path createPath14I(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenI(segmentSize, padding);
    final halfWidth = segmentSize.width / 2.0;

    return Path()
      ..moveTo(pos.left, pos.top + _halfSpace)
      ..lineTo(pos.left + segmentSize.width, pos.top + _halfSpace)
      ..lineTo(
        pos.left + segmentSize.width,
        pos.top + segmentSize.height - _halfSpace,
      )
      ..lineTo(
        pos.left + halfWidth,
        pos.top + segmentSize.height + halfWidth - _halfSpace,
      )
      ..lineTo(pos.left, pos.top + segmentSize.height - _halfSpace)
      ..close();
  }

  @override
  Path createPath14L(Size segmentSize, double padding) {
    final pos = SegmentPosition.fourteenL(segmentSize, padding);
    final halfWidth = segmentSize.width / 2.0;

    return Path()
      ..moveTo(pos.left, pos.top + _halfSpace)
      ..lineTo(pos.left + halfWidth, pos.top - halfWidth + _halfSpace)
      ..lineTo(pos.left + segmentSize.width, pos.top + _halfSpace)
      ..lineTo(
        pos.left + segmentSize.width,
        pos.top + segmentSize.height - _halfSpace,
      )
      ..lineTo(pos.left, pos.top + segmentSize.height - _halfSpace)
      ..close();
  }

  //
  // 16-segment overrides
  //

  @override
  Path createPath16A1(Size segmentSize, double padding) {
    final pos = SegmentPosition.sixteenA1(segmentSize, padding);
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(pos.left - segmentSize.width + _halfSpace, pos.top)
      ..lineTo(
        pos.left + halfHeight + segmentSize.width / 2.0 - _halfSpace,
        pos.top,
      )
      ..lineTo(pos.left + halfHeight - _halfSpace, pos.top + segmentSize.width)
      ..lineTo(pos.left + _halfSpace, pos.top + segmentSize.width)
      ..close();
  }

  @override
  Path createPath16A2(Size segmentSize, double padding) {
    final pos = SegmentPosition.sixteenA2(segmentSize, padding);
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(pos.left - segmentSize.width / 2.0 + _halfSpace, pos.top)
      ..lineTo(pos.left + halfHeight + segmentSize.width - _halfSpace, pos.top)
      ..lineTo(pos.left + halfHeight - _halfSpace, pos.top + segmentSize.width)
      ..lineTo(pos.left + _halfSpace, pos.top + segmentSize.width)
      ..close();
  }

  @override
  Path createPath16D1(Size segmentSize, double padding) {
    final pos = SegmentPosition.sixteenD1(segmentSize, padding);
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(pos.left + _halfSpace, pos.top)
      ..lineTo(pos.left + halfHeight - _halfSpace, pos.top)
      ..lineTo(
        pos.left + halfHeight + segmentSize.width - _halfSpace,
        pos.top + segmentSize.width,
      )
      ..lineTo(
        pos.left - segmentSize.width / 2.0 + _halfSpace,
        pos.top + segmentSize.width,
      )
      ..close();
  }

  @override
  Path createPath16D2(Size segmentSize, double padding) {
    final pos = SegmentPosition.sixteenD2(segmentSize, padding);
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(pos.left + _halfSpace, pos.top)
      ..lineTo(pos.left + halfHeight - _halfSpace, pos.top)
      ..lineTo(
        pos.left + halfHeight + segmentSize.width / 2.0 - _halfSpace,
        pos.top + segmentSize.width,
      )
      ..lineTo(
        pos.left - segmentSize.width + _halfSpace,
        pos.top + segmentSize.width,
      )
      ..close();
  }

  @override
  Path createPath16I(Size segmentSize, double padding) {
    final pos = SegmentPosition.sixteenI(segmentSize, padding);
    final halfWidth = segmentSize.width / 2.0;

    return Path()
      ..moveTo(pos.left, pos.top + _halfSpace)
      ..lineTo(pos.left + halfWidth, pos.top - segmentSize.width + _halfSpace)
      ..lineTo(pos.left + segmentSize.width, pos.top + _halfSpace)
      ..lineTo(
        pos.left + segmentSize.width,
        pos.top + segmentSize.height - _halfSpace,
      )
      ..lineTo(
        pos.left + halfWidth,
        pos.top + segmentSize.height + halfWidth - _halfSpace,
      )
      ..lineTo(pos.left, pos.top + segmentSize.height - _halfSpace)
      ..close();
  }

  @override
  Path createPath16L(Size segmentSize, double padding) {
    final pos = SegmentPosition.sixteenL(segmentSize, padding);
    final halfWidth = segmentSize.width / 2.0;

    return Path()
      ..moveTo(pos.left, pos.top + _halfSpace)
      ..lineTo(pos.left + halfWidth, pos.top - halfWidth + _halfSpace)
      ..lineTo(pos.left + segmentSize.width, pos.top + _halfSpace)
      ..lineTo(
        pos.left + segmentSize.width,
        pos.top + segmentSize.height - _halfSpace,
      )
      ..lineTo(
        pos.left + halfWidth,
        pos.top + segmentSize.height + segmentSize.width - _halfSpace,
      )
      ..lineTo(pos.left, pos.top + segmentSize.height - _halfSpace)
      ..close();
  }
}
