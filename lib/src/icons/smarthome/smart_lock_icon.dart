import 'package:flutter/material.dart';

/// Icono vectorial de Candado Inteligente / Smart Lock.
class SmartLockIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const SmartLockIcon({
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
        painter: _SmartLockIconPainter(color: iconColor),
      ),
    );
  }
}

class _SmartLockIconPainter extends CustomPainter {
  final Color color;

  const _SmartLockIconPainter({required this.color});

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

    // Lock Body RRect
    final bodyRect = RRect.fromRectAndRadius(
      const Rect.fromLTRB(5.0, 10.0, 19.0, 21.0),
      const Radius.circular(3.0),
    );
    canvas.drawRRect(bodyRect, strokePaint);

    // Shackle Arc
    final shackle = Path()
      ..moveTo(8.0, 10.0)
      ..lineTo(8.0, 7.0)
      ..cubicTo(8.0, 4.0, 16.0, 4.0, 16.0, 7.0)
      ..lineTo(16.0, 10.0);
    canvas.drawPath(shackle, strokePaint);

    // Wireless Signal Waves above
    canvas.drawArc(const Rect.fromLTRB(9.0, 1.5, 15.0, 7.5), -2.6, 2.0, false, strokePaint..strokeWidth = 1.4);
    canvas.drawArc(const Rect.fromLTRB(6.0, -1.0, 18.0, 11.0), -2.6, 2.0, false, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _SmartLockIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
