import 'package:flutter/material.dart';

/// Icono vectorial de brújula de orientación para viajes.
class CompassIcon extends StatelessWidget {
  final double size;
  final Color needleNorthColor;

  const CompassIcon({
    super.key,
    this.size = 24.0,
    this.needleNorthColor = const Color(0xFFE53935),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CompassPainter(needleNorthColor: needleNorthColor),
      ),
    );
  }
}

class _CompassPainter extends CustomPainter {
  final Color needleNorthColor;

  const _CompassPainter({required this.needleNorthColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final rimPaint = Paint()
      ..color = const Color(0xFF546E7A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    final northPaint = Paint()
      ..color = needleNorthColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final southPaint = Paint()
      ..color = const Color(0xFFB0BEC5)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Outer Compass Ring
    canvas.drawCircle(const Offset(12, 12), 9.5, rimPaint);

    // North Needle (Red Triangle)
    final northPath = Path()
      ..moveTo(12, 4)
      ..lineTo(14.5, 12)
      ..lineTo(12, 12)
      ..close();
    canvas.drawPath(northPath, northPaint);

    // South Needle (Grey Triangle)
    final southPath = Path()
      ..moveTo(12, 20)
      ..lineTo(9.5, 12)
      ..lineTo(12, 12)
      ..close();
    canvas.drawPath(southPath, southPaint);

    // Center Pivot Dot
    canvas.drawCircle(const Offset(12, 12), 1.5, rimPaint);
  }

  @override
  bool shouldRepaint(covariant _CompassPainter oldDelegate) =>
      oldDelegate.needleNorthColor != needleNorthColor;
}
