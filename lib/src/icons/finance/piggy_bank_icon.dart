import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de alcancía de ahorro.
class PiggyBankIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const PiggyBankIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFEC407A));
    final goldAccent = secondaryColor ?? const Color(0xFFFFCA28);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _PiggyBankPainter(
          primaryColor: primary,
          accentColor: goldAccent,
        ),
      ),
    );
  }
}

class _PiggyBankPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _PiggyBankPainter({
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
      ..isAntiAlias = true;

    final eyeFill = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final coinSlotPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;

    // Body Oval
    canvas.drawOval(const Rect.fromLTWH(4, 7, 16, 12), strokePaint);

    // Eye
    canvas.drawCircle(const Offset(16, 11), 1.0, eyeFill);

    // Coin slot line (Vibrant Gold Accent)
    canvas.drawLine(const Offset(10, 7), const Offset(14, 7), coinSlotPaint);

    // Legs
    canvas.drawLine(const Offset(7, 18), const Offset(7, 21), strokePaint);
    canvas.drawLine(const Offset(17, 18), const Offset(17, 21), strokePaint);
  }

  @override
  bool shouldRepaint(covariant _PiggyBankPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
