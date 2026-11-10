import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Termostato Digital / Inteligente.
class ThermometerSmartIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const ThermometerSmartIcon({
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
    final coralAccent = secondaryColor ?? const Color(0xFFE53935);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ThermometerSmartIconPainter(
          primaryColor: primary,
          accentColor: coralAccent,
        ),
      ),
    );
  }
}

class _ThermometerSmartIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _ThermometerSmartIconPainter({
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
      ..isAntiAlias = true;

    final liquidPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Thermometer Outer Body
    final thermoPath = Path()
      ..moveTo(10.0, 14.2)
      ..cubicTo(8.5, 15.2, 8.0, 17.5, 9.0, 19.2)
      ..cubicTo(10.0, 21.0, 12.5, 21.5, 14.2, 20.2)
      ..cubicTo(15.5, 19.2, 15.5, 17.0, 14.0, 14.2)
      ..lineTo(14.0, 5.0)
      ..cubicTo(14.0, 3.3, 10.0, 3.3, 10.0, 5.0)
      ..close();
    canvas.drawPath(thermoPath, mainStroke);

    // Liquid bulb & column (Vibrant Coral Red Accent)
    canvas.drawCircle(const Offset(12.0, 17.5), 2.2, liquidPaint);
    canvas.drawLine(const Offset(12.0, 17.5), const Offset(12.0, 9.0), Paint()..color = accentColor..strokeWidth = 2.0..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(covariant _ThermometerSmartIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
