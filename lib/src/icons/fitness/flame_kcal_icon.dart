import 'package:flutter/material.dart';

/// Icono vectorial de Llama de Calorías / Fuego Fitness.
class FlameKcalIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const FlameKcalIcon({
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
        painter: _FlameKcalIconPainter(color: iconColor),
      ),
    );
  }
}

class _FlameKcalIconPainter extends CustomPainter {
  final Color color;

  const _FlameKcalIconPainter({required this.color});

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

    // Flame Path
    final flamePath = Path()
      ..moveTo(12.0, 3.0)
      ..cubicTo(14.0, 7.0, 18.0, 8.5, 18.0, 13.5)
      ..cubicTo(18.0, 17.5, 15.5, 20.5, 12.0, 20.5)
      ..cubicTo(8.5, 20.5, 6.0, 17.5, 6.0, 13.5)
      ..cubicTo(6.0, 10.0, 9.0, 7.5, 10.0, 5.0)
      ..cubicTo(10.5, 8.0, 13.0, 9.5, 13.0, 11.5);
    canvas.drawPath(flamePath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _FlameKcalIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
