import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de jeringa de inyección.
class SyringeIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SyringeIcon({
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
    final redAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFE53935));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SyringePainter(
          primaryColor: primary,
          accentColor: redAccent,
        ),
      ),
    );
  }
}

class _SyringePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SyringePainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final barrelStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final needleStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(-0.785398); // -45 deg

    // Barrel RRect
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(-3, -7, 6, 12), const Radius.circular(1)),
      barrelStroke,
    );

    // Needle Tip Line (Vibrant Crimson Accent)
    canvas.drawLine(const Offset(0, 5), const Offset(0, 10), needleStroke);

    // Plunger
    canvas.drawLine(const Offset(0, -7), const Offset(0, -11), barrelStroke);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _SyringePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
