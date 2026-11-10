import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Varita Mágica / Prompt de IA.
class WandMagicIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const WandMagicIcon({
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
    final goldAccent = secondaryColor ?? const Color(0xFFFFB703);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _WandMagicIconPainter(
          primaryColor: primary,
          accentColor: goldAccent,
        ),
      ),
    );
  }
}

class _WandMagicIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _WandMagicIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final wandPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final sparklePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Wand Stick
    canvas.drawLine(const Offset(4.0, 20.0), const Offset(15.0, 9.0), wandPaint);

    // Sparkle 1 (Top Right Star)
    final p1 = Path()
      ..moveTo(19.0, 3.0)
      ..cubicTo(19.0, 5.0, 20.0, 6.0, 22.0, 6.0)
      ..cubicTo(20.0, 6.0, 19.0, 7.0, 19.0, 9.0)
      ..cubicTo(19.0, 7.0, 18.0, 6.0, 16.0, 6.0)
      ..cubicTo(18.0, 6.0, 19.0, 5.0, 19.0, 3.0)
      ..close();
    canvas.drawPath(p1, sparklePaint);

    // Sparkle 2 (Small Sparkle)
    final p2 = Path()
      ..moveTo(9.0, 3.0)
      ..cubicTo(9.0, 4.0, 10.0, 5.0, 11.0, 5.0)
      ..cubicTo(10.0, 5.0, 9.0, 6.0, 9.0, 7.0)
      ..cubicTo(9.0, 6.0, 8.0, 5.0, 7.0, 5.0)
      ..cubicTo(8.0, 5.0, 9.0, 4.0, 9.0, 3.0)
      ..close();
    canvas.drawPath(p2, sparklePaint);
  }

  @override
  bool shouldRepaint(covariant _WandMagicIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
