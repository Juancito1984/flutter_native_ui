import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de gorro de chef / gastronomía.
class ChefHatIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const ChefHatIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);
    final redAccent = secondaryColor ?? const Color(0xFFD32F2F);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ChefHatPainter(
          primaryColor: primary,
          accentColor: redAccent,
        ),
      ),
    );
  }
}

class _ChefHatPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _ChefHatPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final hatStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final bandFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Puff Dome
    final hatPath = Path()
      ..moveTo(6, 14)
      ..cubicTo(3, 12, 3, 7, 7, 6)
      ..cubicTo(8, 3, 16, 3, 17, 6)
      ..cubicTo(21, 7, 21, 12, 18, 14)
      ..close();
    canvas.drawPath(hatPath, hatStroke);

    // Band (Vibrant Crimson Accent Fill)
    canvas.drawRect(const Rect.fromLTWH(6, 14, 12, 5), bandFill);
  }

  @override
  bool shouldRepaint(covariant _ChefHatPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
