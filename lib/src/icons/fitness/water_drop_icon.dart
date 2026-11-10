import 'package:flutter/material.dart';

/// Icono vectorial de Gota de Agua / Hidratación.
class WaterDropIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const WaterDropIcon({
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
        painter: _WaterDropIconPainter(color: iconColor),
      ),
    );
  }
}

class _WaterDropIconPainter extends CustomPainter {
  final Color color;

  const _WaterDropIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // Drop Path
    final dropPath = Path()
      ..moveTo(12.0, 3.0)
      ..cubicTo(12.0, 3.0, 5.0, 11.0, 5.0, 15.0)
      ..cubicTo(5.0, 19.0, 8.0, 21.0, 12.0, 21.0)
      ..cubicTo(16.0, 21.0, 19.0, 19.0, 19.0, 15.0)
      ..cubicTo(19.0, 11.0, 12.0, 3.0, 12.0, 3.0)
      ..close();
    canvas.drawPath(dropPath, strokePaint);

    // Reflection accent
    canvas.drawArc(const Rect.fromLTRB(8.0, 12.0, 14.0, 18.0), -2.6, 1.4, false, strokePaint..strokeWidth = 1.4);
  }

  @override
  bool shouldRepaint(covariant _WaterDropIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
