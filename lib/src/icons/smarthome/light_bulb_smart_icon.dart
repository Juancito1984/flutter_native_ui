import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Foco Domótico Inteligente.
class LightBulbSmartIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const LightBulbSmartIcon({
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
    final goldAccent = secondaryColor ?? const Color(0xFFFFCA28);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _LightBulbSmartIconPainter(
          primaryColor: primary,
          accentColor: goldAccent,
        ),
      ),
    );
  }
}

class _LightBulbSmartIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _LightBulbSmartIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final mainStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final accentStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Bulb Contour
    final bulbPath = Path()
      ..moveTo(9.0, 18.0)
      ..lineTo(15.0, 18.0)
      ..lineTo(15.0, 16.0)
      ..cubicTo(18.0, 14.0, 19.5, 10.0, 17.5, 6.5)
      ..cubicTo(15.5, 3.0, 10.5, 3.0, 8.5, 6.5)
      ..cubicTo(6.5, 10.0, 8.0, 14.0, 9.0, 16.0)
      ..close();
    canvas.drawPath(bulbPath, mainStroke);

    // Base Lines
    canvas.drawLine(const Offset(10.0, 20.0), const Offset(14.0, 20.0), mainStroke);

    // Glowing Wi-Fi Waves Inside Filament (Golden Accent)
    canvas.drawArc(const Rect.fromLTRB(10.0, 9.0, 14.0, 13.0), -2.8, 2.4, false, accentStroke);
  }

  @override
  bool shouldRepaint(covariant _LightBulbSmartIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
