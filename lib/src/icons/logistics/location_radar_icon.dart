import 'package:flutter/material.dart';

/// Icono vectorial de Pin de Mapa con Radar de Ubicación.
class LocationRadarIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const LocationRadarIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _LocationRadarIconPainter(color: iconColor),
      ),
    );
  }
}

class _LocationRadarIconPainter extends CustomPainter {
  final Color color;

  const _LocationRadarIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Map Pin
    final pinPath = Path()
      ..moveTo(12.0, 3.0)
      ..cubicTo(8.5, 3.0, 6.0, 5.5, 6.0, 9.0)
      ..cubicTo(6.0, 13.5, 12.0, 19.5, 12.0, 19.5)
      ..cubicTo(12.0, 19.5, 18.0, 13.5, 18.0, 9.0)
      ..cubicTo(18.0, 5.5, 15.5, 3.0, 12.0, 3.0)
      ..close();
    canvas.drawPath(pinPath, strokePaint);

    // Inner Dot
    canvas.drawCircle(const Offset(12.0, 9.0), 2.0, fillPaint);

    // Ground Radar Oval
    canvas.drawOval(const Rect.fromLTRB(4.0, 18.0, 20.0, 22.0), strokePaint..strokeWidth = 1.2);
  }

  @override
  bool shouldRepaint(covariant _LocationRadarIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
