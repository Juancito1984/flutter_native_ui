import 'package:flutter/material.dart';

/// Icono vectorial de Varita Mágica / Prompt de IA.
class WandMagicIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const WandMagicIcon({
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
        painter: _WandMagicIconPainter(color: iconColor),
      ),
    );
  }
}

class _WandMagicIconPainter extends CustomPainter {
  final Color color;

  const _WandMagicIconPainter({required this.color});

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

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Wand Stick
    canvas.drawLine(const Offset(4.0, 20.0), const Offset(15.0, 9.0), strokePaint);

    // Sparkle 1 (Top Right Star)
    final p1 = Path()
      ..moveTo(19.0, 3.0)
      ..cubicTo(19.0, 5.0, 20.0, 6.0, 22.0, 6.0)
      ..cubicTo(20.0, 6.0, 19.0, 7.0, 19.0, 9.0)
      ..cubicTo(19.0, 7.0, 18.0, 6.0, 16.0, 6.0)
      ..cubicTo(18.0, 6.0, 19.0, 5.0, 19.0, 3.0)
      ..close();
    canvas.drawPath(p1, fillPaint);

    // Sparkle 2 (Small Sparkle)
    final p2 = Path()
      ..moveTo(9.0, 3.0)
      ..cubicTo(9.0, 4.0, 10.0, 5.0, 11.0, 5.0)
      ..cubicTo(10.0, 5.0, 9.0, 6.0, 9.0, 7.0)
      ..cubicTo(9.0, 6.0, 8.0, 5.0, 7.0, 5.0)
      ..cubicTo(8.0, 5.0, 9.0, 4.0, 9.0, 3.0)
      ..close();
    canvas.drawPath(p2, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _WandMagicIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
