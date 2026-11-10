import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de bombilla de idea o conocimiento.
class IdeaBulbIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const IdeaBulbIcon({
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
        painter: _IdeaBulbPainter(
          primaryColor: primary,
          accentColor: goldAccent,
        ),
      ),
    );
  }
}

class _IdeaBulbPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _IdeaBulbPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final filamentStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Bulb Contour
    final bulbPath = Path()
      ..moveTo(9, 18)
      ..lineTo(15, 18)
      ..lineTo(15, 16)
      ..cubicTo(18, 14, 19, 10, 17, 6.5)
      ..cubicTo(15, 3, 9, 3, 7, 6.5)
      ..cubicTo(5, 10, 6, 14, 9, 16)
      ..close();
    canvas.drawPath(bulbPath, strokePaint);

    // Socket lines
    canvas.drawLine(const Offset(10, 20), const Offset(14, 20), strokePaint);

    // Inner filament (Vibrant Gold Accent)
    final fil = Path()..moveTo(10, 12)..lineTo(12, 9)..lineTo(14, 12);
    canvas.drawPath(fil, filamentStroke);
  }

  @override
  bool shouldRepaint(covariant _IdeaBulbPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
