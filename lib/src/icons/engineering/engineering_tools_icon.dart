import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de herramientas cruzadas (llave y martillo).
class EngineeringToolsIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const EngineeringToolsIcon({
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
    final toolAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB300));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _EngineeringToolsPainter(
          primaryColor: primary,
          accentColor: toolAccent,
        ),
      ),
    );
  }
}

class _EngineeringToolsPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _EngineeringToolsPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final hammerStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final wrenchStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Hammer Line
    canvas.drawLine(const Offset(4, 20), const Offset(18, 6), hammerStroke);

    // Wrench Line (Vibrant Amber/Gold Accent)
    canvas.drawLine(const Offset(20, 20), const Offset(6, 6), wrenchStroke);
  }

  @override
  bool shouldRepaint(covariant _EngineeringToolsPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
