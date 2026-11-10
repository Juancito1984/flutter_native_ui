import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de silueta de jugador de fútbol.
class SoccerPlayerIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SoccerPlayerIcon({
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
    final ballAccent = secondaryColor ?? const Color(0xFFFFB703);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SoccerPlayerPainter(
          primaryColor: primary,
          accentColor: ballAccent,
        ),
      ),
    );
  }
}

class _SoccerPlayerPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SoccerPlayerPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final playerFill = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final playerStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final ballFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Head
    canvas.drawCircle(const Offset(10, 4), 2.0, playerFill);

    // Body Running
    final body = Path()
      ..moveTo(10, 7)
      ..lineTo(14, 12)
      ..lineTo(11, 16)
      ..lineTo(7, 21);
    canvas.drawPath(body, playerStroke);

    // Kicking Leg
    final leg2 = Path()..moveTo(11, 16)..lineTo(17, 19);
    canvas.drawPath(leg2, playerStroke);

    // Ball (Vibrant Gold Accent)
    canvas.drawCircle(const Offset(20, 20), 2.0, ballFill);
  }

  @override
  bool shouldRepaint(covariant _SoccerPlayerPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
