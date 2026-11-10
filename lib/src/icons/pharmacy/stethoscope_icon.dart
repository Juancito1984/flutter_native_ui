import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de estetoscopio médico.
class StethoscopeIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const StethoscopeIcon({
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
    final cyanAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF0288D1));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _StethoscopePainter(
          primaryColor: primary,
          accentColor: cyanAccent,
        ),
      ),
    );
  }
}

class _StethoscopePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _StethoscopePainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final tubeStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final discFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Ear Tubes Arc
    final tubes = Path()
      ..moveTo(6, 4)
      ..lineTo(6, 10)
      ..cubicTo(6, 16, 18, 16, 18, 10)
      ..lineTo(18, 4);
    canvas.drawPath(tubes, tubeStroke);

    // Earpieces
    canvas.drawCircle(const Offset(6, 4), 1.2, discFill);
    canvas.drawCircle(const Offset(18, 4), 1.2, discFill);

    // Chest Piece Disc (Vibrant Cyan Accent)
    canvas.drawCircle(const Offset(12, 19), 2.5, discFill);
  }

  @override
  bool shouldRepaint(covariant _StethoscopePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
