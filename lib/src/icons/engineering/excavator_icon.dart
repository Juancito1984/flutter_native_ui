import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de excavadora para construcción e ingeniería.
class ExcavatorIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const ExcavatorIcon({
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
    final yellowAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB300));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ExcavatorPainter(
          primaryColor: primary,
          accentColor: yellowAccent,
        ),
      ),
    );
  }
}

class _ExcavatorPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _ExcavatorPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final armStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final cabinFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Track Base
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(2, 16, 14, 5), const Radius.circular(2.5)),
      Paint()..color = primaryColor..style = PaintingStyle.stroke..strokeWidth = 1.8,
    );

    // Cabin (Vibrant Yellow Industrial Accent)
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(5, 10, 8, 6), const Radius.circular(1.5)),
      cabinFill,
    );

    // Mechanical Arm Lines
    final armPath = Path()
      ..moveTo(11, 11)
      ..lineTo(16, 4)
      ..lineTo(21, 9)
      ..lineTo(22, 14);
    canvas.drawPath(armPath, armStroke);
  }

  @override
  bool shouldRepaint(covariant _ExcavatorPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
