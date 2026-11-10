import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de silbato de árbitro.
class RefereeWhistleIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const RefereeWhistleIcon({
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
    final goldAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB703));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _RefereeWhistlePainter(
          primaryColor: primary,
          accentColor: goldAccent,
        ),
      ),
    );
  }
}

class _RefereeWhistlePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _RefereeWhistlePainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bodyFill = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final ringStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    // Whistle Chamber Body
    canvas.drawCircle(const Offset(8, 13), 5.0, bodyFill);

    // Mouthpiece Barrel
    canvas.drawRect(const Rect.fromLTWH(8, 8, 13, 5), bodyFill);

    // Ring Loop (Vibrant Gold Accent)
    canvas.drawCircle(const Offset(4, 9), 2.0, ringStroke);
  }

  @override
  bool shouldRepaint(covariant _RefereeWhistlePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
