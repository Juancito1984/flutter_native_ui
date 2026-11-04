import 'package:flutter/material.dart';

/// Icono vectorial de Destellos / IA / Magia (Sparkles).
class SparklesIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const SparklesIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? const Color(0xFFFFB703);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SparklesIconPainter(color: iconColor),
      ),
    );
  }
}

class _SparklesIconPainter extends CustomPainter {
  final Color color;

  const _SparklesIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Main Sparkle
    final p1 = Path()
      ..moveTo(12.0, 2.0)
      ..cubicTo(12.0, 7.5, 16.5, 12.0, 22.0, 12.0)
      ..cubicTo(16.5, 12.0, 12.0, 16.5, 12.0, 22.0)
      ..cubicTo(12.0, 16.5, 7.5, 12.0, 2.0, 12.0)
      ..cubicTo(7.5, 12.0, 12.0, 7.5, 12.0, 2.0)
      ..close();
    canvas.drawPath(p1, paint);

    // Small Top Left Sparkle
    final p2 = Path()
      ..moveTo(5.0, 2.0)
      ..cubicTo(5.0, 4.0, 7.0, 6.0, 9.0, 6.0)
      ..cubicTo(7.0, 6.0, 5.0, 8.0, 5.0, 10.0)
      ..cubicTo(5.0, 8.0, 3.0, 6.0, 1.0, 6.0)
      ..cubicTo(3.0, 6.0, 5.0, 4.0, 5.0, 2.0)
      ..close();
    canvas.drawPath(p2, paint);
  }

  @override
  bool shouldRepaint(covariant _SparklesIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
