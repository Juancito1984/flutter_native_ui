import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de surtidor de combustible / gasolina.
class FuelGasIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const FuelGasIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFE53935));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _FuelGasPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _FuelGasPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _FuelGasPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bodyStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final hoseStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final displayFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Pump Body RRect
    final bodyRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(4, 5, 10, 15),
      const Radius.circular(2),
    );
    canvas.drawRRect(bodyRRect, bodyStroke);

    // Hose & Nozzle (Vibrant Accent)
    final hose = Path()
      ..moveTo(14, 10)
      ..lineTo(17, 10)
      ..lineTo(17, 17)
      ..lineTo(19, 17);
    canvas.drawPath(hose, hoseStroke);

    // Screen display (Vibrant Accent Fill)
    canvas.drawRect(const Rect.fromLTWH(6, 7, 6, 4), displayFill);
  }

  @override
  bool shouldRepaint(covariant _FuelGasPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
