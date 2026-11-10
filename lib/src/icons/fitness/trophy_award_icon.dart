import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Trofeo / Copa de Victoria.
class TrophyAwardIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const TrophyAwardIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFFB703));
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : theme.colorScheme.secondary);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TrophyAwardIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _TrophyAwardIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _TrophyAwardIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cupStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final basePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Trophy Cup
    final cupPath = Path()
      ..moveTo(6.0, 4.0)
      ..lineTo(18.0, 4.0)
      ..lineTo(17.0, 11.0)
      ..cubicTo(16.0, 14.0, 14.0, 15.5, 12.0, 15.5)
      ..cubicTo(10.0, 15.5, 8.0, 14.0, 7.0, 11.0)
      ..close();
    canvas.drawPath(cupPath, cupStroke);

    // Left & Right Handles
    final leftHandle = Path()..moveTo(6.0, 6.0)..cubicTo(3.0, 6.0, 3.0, 11.0, 7.0, 11.0);
    final rightHandle = Path()..moveTo(18.0, 6.0)..cubicTo(21.0, 6.0, 21.0, 11.0, 17.0, 11.0);
    canvas.drawPath(leftHandle, cupStroke);
    canvas.drawPath(rightHandle, cupStroke);

    // Stem & Base (Vibrant Accent Base)
    canvas.drawLine(const Offset(12.0, 15.5), const Offset(12.0, 19.0), cupStroke);
    canvas.drawRect(const Rect.fromLTRB(7.0, 19.0, 17.0, 21.0), basePaint);
  }

  @override
  bool shouldRepaint(covariant _TrophyAwardIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
