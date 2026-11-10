import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de birrete de graduación.
class GraduationCapIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const GraduationCapIcon({
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
    final goldTassel = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB703));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _GraduationCapPainter(
          primaryColor: primary,
          accentColor: goldTassel,
        ),
      ),
    );
  }
}

class _GraduationCapPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _GraduationCapPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final capPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final strokePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final tasselPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Diamond Cap Top
    final topPath = Path()
      ..moveTo(12, 3)
      ..lineTo(22, 8)
      ..lineTo(12, 13)
      ..lineTo(2, 8)
      ..close();
    canvas.drawPath(topPath, capPaint);

    // Skull Cap Bottom Base
    final bottomPath = Path()
      ..moveTo(6, 10.5)
      ..lineTo(6, 15)
      ..cubicTo(6, 18, 18, 18, 18, 15)
      ..lineTo(18, 10.5);
    canvas.drawPath(bottomPath, strokePaint);

    // Tassel Ribbon Line (Vibrant Gold Accent)
    final tasselPath = Path()
      ..moveTo(20, 9)
      ..lineTo(20, 17);
    canvas.drawPath(tasselPath, tasselPaint);
    canvas.drawCircle(const Offset(20, 18), 1.2, Paint()..color = accentColor);
  }

  @override
  bool shouldRepaint(covariant _GraduationCapPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
