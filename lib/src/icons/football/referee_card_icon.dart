import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de tarjetas de árbitro (amarilla y roja cruzadas).
class RefereeCardIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const RefereeCardIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final yellowColor = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFFCA28));
    final redColor = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFD32F2F));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _RefereeCardPainter(
          yellowColor: yellowColor,
          redColor: redColor,
        ),
      ),
    );
  }
}

class _RefereeCardPainter extends CustomPainter {
  final Color yellowColor;
  final Color redColor;

  const _RefereeCardPainter({
    required this.yellowColor,
    required this.redColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final yellowPaint = Paint()
      ..color = yellowColor
      ..style = PaintingStyle.fill;

    final redPaint = Paint()
      ..color = redColor
      ..style = PaintingStyle.fill;

    // Yellow Card Behind
    canvas.save();
    canvas.translate(8, 12);
    canvas.rotate(-0.25);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(-5, -8, 10, 16), const Radius.circular(2)), yellowPaint);
    canvas.restore();

    // Red Card Front
    canvas.save();
    canvas.translate(15, 12);
    canvas.rotate(0.25);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(-5, -8, 10, 16), const Radius.circular(2)), redPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _RefereeCardPainter oldDelegate) =>
      oldDelegate.yellowColor != yellowColor || oldDelegate.redColor != redColor;
}
