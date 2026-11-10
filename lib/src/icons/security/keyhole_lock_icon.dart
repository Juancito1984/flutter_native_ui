import 'package:flutter/material.dart';

/// Icono vectorial de Candado con Ojo de Cerradura.
class KeyholeLockIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const KeyholeLockIcon({
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
        painter: _KeyholeLockIconPainter(color: iconColor),
      ),
    );
  }
}

class _KeyholeLockIconPainter extends CustomPainter {
  final Color color;

  const _KeyholeLockIconPainter({required this.color});

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

    // Shackle Arc
    final shackle = Path()
      ..moveTo(7.0, 10.0)
      ..lineTo(7.0, 7.0)
      ..cubicTo(7.0, 3.5, 17.0, 3.5, 17.0, 7.0)
      ..lineTo(17.0, 10.0);
    canvas.drawPath(shackle, strokePaint);

    // Lock Body RRect
    final bodyRect = RRect.fromRectAndRadius(
      const Rect.fromLTRB(4.0, 10.0, 20.0, 21.0),
      const Radius.circular(3.0),
    );
    canvas.drawRRect(bodyRect, strokePaint);

    // Keyhole Circle + Trapezoid
    canvas.drawCircle(const Offset(12.0, 14.0), 1.5, fillPaint);
    final holePath = Path()
      ..moveTo(11.0, 14.5)
      ..lineTo(13.0, 14.5)
      ..lineTo(13.5, 17.5)
      ..lineTo(10.5, 17.5)
      ..close();
    canvas.drawPath(holePath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _KeyholeLockIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
