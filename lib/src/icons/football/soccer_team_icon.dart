import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de alineación de equipo de fútbol.
class SoccerTeamIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SoccerTeamIcon({
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
    final lineAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SoccerTeamPainter(
          primaryColor: primary,
          accentColor: lineAccent,
        ),
      ),
    );
  }
}

class _SoccerTeamPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SoccerTeamPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final dotFill = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final formationStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;

    // Players dots
    canvas.drawCircle(const Offset(12, 5), 2.0, dotFill);
    canvas.drawCircle(const Offset(6, 12), 2.0, dotFill);
    canvas.drawCircle(const Offset(18, 12), 2.0, dotFill);
    canvas.drawCircle(const Offset(12, 19), 2.0, dotFill);

    // Connecting Tactical Formation Lines (Vibrant Emerald Accent)
    final formation = Path()
      ..moveTo(12, 5)
      ..lineTo(6, 12)
      ..lineTo(12, 19)
      ..lineTo(18, 12)
      ..close();
    canvas.drawPath(formation, formationStroke);
  }

  @override
  bool shouldRepaint(covariant _SoccerTeamPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
