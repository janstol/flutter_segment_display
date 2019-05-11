import 'dart:ui';

import 'package:segment_display/src/segment/segment_position.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';

/// Hexagonal [SegmentStyle]
class HexSegmentStyle extends SegmentStyle {
  /// Space between segments
  final double segmentSpacing;

  final double _halfSpace;

  /// Creates hexagonal [SegmentStyle]
  const HexSegmentStyle({
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
    final halfWidth = segmentSize.width / 2.0;

    return Path()
      ..moveTo(position.left + _halfSpace, position.top)
      ..lineTo(position.left + segmentSize.height - _halfSpace, position.top)
      ..lineTo(
        position.left + segmentSize.height + halfWidth - _halfSpace,
        position.top + halfWidth,
      )
      ..lineTo(
        position.left + segmentSize.height - _halfSpace,
        position.top + segmentSize.width,
      )
      ..lineTo(position.left + _halfSpace, position.top + segmentSize.width)
      ..lineTo(position.left - halfWidth + _halfSpace, position.top + halfWidth)
      ..close();
  }

  @override
  Path createVerticalPath(SegmentPosition position, Size segmentSize) {
    final halfWidth = segmentSize.width / 2.0;

    return Path()
      ..moveTo(position.left, position.top + _halfSpace)
      ..lineTo(position.left + halfWidth, position.top - halfWidth + _halfSpace)
      ..lineTo(position.left + segmentSize.width, position.top + _halfSpace)
      ..lineTo(
        position.left + segmentSize.width,
        position.top + segmentSize.height - _halfSpace,
      )
      ..lineTo(
        position.left + halfWidth,
        position.top + segmentSize.height + halfWidth - _halfSpace,
      )
      ..lineTo(position.left, position.top + segmentSize.height - _halfSpace)
      ..close();
  }

  @override
  Path createDiagonalBackwardPath(SegmentPosition position, Size segmentSize) {
    final w = 1.8 * segmentSize.width;
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(position.left + _halfSpace, position.top + _halfSpace)
      ..lineTo(
        position.left + halfHeight - _halfSpace,
        position.top + segmentSize.height - w,
      )
      ..lineTo(
        position.left + halfHeight - _halfSpace,
        position.top + segmentSize.height,
      )
      ..lineTo(position.left + _halfSpace, position.top + w + _halfSpace)
      ..close();
  }

  @override
  Path createDiagonalForwardPath(SegmentPosition position, Size segmentSize) {
    final w = 1.8 * segmentSize.width;
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(
        position.left + halfHeight - _halfSpace,
        position.top + _halfSpace,
      )
      ..lineTo(
        position.left + halfHeight - _halfSpace,
        position.top + w + _halfSpace,
      )
      ..lineTo(
        position.left + _halfSpace,
        position.top + segmentSize.height - _halfSpace,
      )
      ..lineTo(
        position.left + _halfSpace,
        position.top + segmentSize.height - w - _halfSpace,
      )
      ..close();
  }

  ///
  /// 14-segment overrides
  ///

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
}
