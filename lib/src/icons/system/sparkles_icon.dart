import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Destellos / IA / Magia (Sparkles).
class SparklesIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SparklesIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFFB703));
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFF8F00));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SparklesIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _SparklesIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SparklesIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final mainSparkle = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final smallSparkle = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Main Sparkle (Vibrant Golden Sparkle)
    final p1 = Path()
      ..moveTo(12.0, 2.0)
      ..cubicTo(12.0, 7.5, 16.5, 12.0, 22.0, 12.0)
      ..cubicTo(16.5, 12.0, 12.0, 16.5, 12.0, 22.0)
      ..cubicTo(12.0, 16.5, 7.5, 12.0, 2.0, 12.0)
      ..cubicTo(7.5, 12.0, 12.0, 7.5, 12.0, 2.0)
      ..close();
    canvas.drawPath(p1, mainSparkle);

    // Small Top Left Sparkle (Accent Amber)
    final p2 = Path()
      ..moveTo(5.0, 2.0)
      ..cubicTo(5.0, 4.0, 7.0, 6.0, 9.0, 6.0)
      ..cubicTo(7.0, 6.0, 5.0, 8.0, 5.0, 10.0)
      ..cubicTo(5.0, 8.0, 3.0, 6.0, 1.0, 6.0)
      ..cubicTo(3.0, 6.0, 5.0, 4.0, 5.0, 2.0)
      ..close();
    canvas.drawPath(p2, smallSparkle);
  }

  @override
  bool shouldRepaint(covariant _SparklesIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
