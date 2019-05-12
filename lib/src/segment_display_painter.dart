import 'package:flutter/widgets.dart';
import 'package:segment_display/src/segment/segment.dart';

/// [CustomPainter] used for painting display segments
class SegmentDisplayPainter extends CustomPainter {
  /// [Paint] style for enabled segments
  Paint _enabledPaint;

  /// [Paint] style for disabled segments
  Paint _disabledPaint;

  /// All segments that should be drawn
  List<Segment> segments;

  Path _enabledPath = Path();
  Path _disabledPath = Path();

  /// Creates [SegmentDisplayPainter], sets paint styles and splits [segments]
  /// (paths) into enabled and disabled.
  SegmentDisplayPainter({
    @required this.segments,
    Color enabledColor,
    Color disabledColor,
  }) {
    _enabledPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = enabledColor;

    _disabledPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = disabledColor;

    for (var segment in segments) {
      if (segment.isEnabled) {
        _enabledPath.addPath(segment.path, Offset.zero);
      } else {
        _disabledPath.addPath(segment.path, Offset.zero);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    canvas.drawPath(_enabledPath, _enabledPaint);
    canvas.drawPath(_disabledPath, _disabledPaint);
  }

  @override
  bool shouldRepaint(SegmentDisplayPainter oldDelegate) {
    return segments != oldDelegate.segments;
  }
}
