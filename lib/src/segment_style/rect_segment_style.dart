import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:segment_display/src/segment/segment_position.dart';
import 'package:segment_display/src/segment_style/segment_style.dart';

/// Simple rectangular [SegmentStyle].
///
/// Horizontal and vertical segments have rectangular shape,
/// diagonal segments have 'skewed' rectangular shape.
class RectSegmentStyle extends SegmentStyle {
  /// Creates rectangular [SegmentStyle].
  const RectSegmentStyle({
    Size segmentBaseSize,
    Color enabledColor,
    Color disabledColor,
  }) : super(
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
        position.left + segmentSize.height,
        position.top + segmentSize.width,
      )
      ..lineTo(position.left, position.top + segmentSize.width)
      ..close();
  }

  @override
  Path createVerticalPath(SegmentPosition position, Size segmentSize) {
    return Path()
      ..moveTo(position.left, position.top)
      ..lineTo(position.left + segmentSize.width, position.top)
      ..lineTo(
        position.left + segmentSize.width,
        position.top + segmentSize.height,
      )
      ..lineTo(position.left, position.top + segmentSize.height)
      ..close();
  }

  @override
  Path createDiagonalBackwardPath(SegmentPosition position, Size segmentSize) {
    final w = 1.6 * segmentSize.width;
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(position.left, position.top)
      ..lineTo(
        position.left + halfHeight,
        position.top + segmentSize.height - w,
      )
      ..lineTo(position.left + halfHeight, position.top + segmentSize.height)
      ..lineTo(position.left, position.top + w)
      ..close();
  }

  @override
  Path createDiagonalForwardPath(SegmentPosition position, Size segmentSize) {
    final w = 1.6 * segmentSize.width;
    final halfHeight = (segmentSize.height / 2.0) - (segmentSize.width / 2.0);

    return Path()
      ..moveTo(position.left + halfHeight, position.top)
      ..lineTo(position.left + halfHeight, position.top + w)
      ..lineTo(position.left, position.top + segmentSize.height)
      ..lineTo(position.left, position.top + segmentSize.height - w)
      ..close();
  }
}
