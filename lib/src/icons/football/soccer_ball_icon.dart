import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de balón de fútbol clásico.
class SoccerBallIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SoccerBallIcon({
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
    final pentaAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SoccerBallPainter(
          primaryColor: primary,
          accentColor: pentaAccent,
        ),
      ),
    );
  }
}

class _SoccerBallPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SoccerBallPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final circleStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    final pentaFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Outer Circle
    canvas.drawCircle(const Offset(12, 12), 9, circleStroke);

    // Center Pentagon (Vibrant Emerald Accent)
    final penta = Path()
      ..moveTo(12, 8)
      ..lineTo(15, 10.5)
      ..lineTo(14, 14.5)
      ..lineTo(10, 14.5)
      ..lineTo(9, 10.5)
      ..close();
    canvas.drawPath(penta, pentaFill);
  }

  @override
  bool shouldRepaint(covariant _SoccerBallPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
