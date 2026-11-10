import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de equipo de trabajo / cuadrilla de ingeniería.
class WorkCrewIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const WorkCrewIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB300));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _WorkCrewPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _WorkCrewPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _WorkCrewPainter({
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

    final centerHeadFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    final sideHeadFill = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    // Center Figure Head (Vibrant Golden Accent)
    canvas.drawCircle(const Offset(12, 7), 2.5, centerHeadFill);

    // Left Figure Head
    canvas.drawCircle(const Offset(6, 9), 2.0, sideHeadFill);

    // Right Figure Head
    canvas.drawCircle(const Offset(18, 9), 2.0, sideHeadFill);

    // Bodies
    final bCenter = Path()..moveTo(8, 18)..cubicTo(8, 13, 16, 13, 16, 18);
    final bLeft = Path()..moveTo(3, 20)..cubicTo(3, 15, 9, 15, 9, 20);
    final bRight = Path()..moveTo(15, 20)..cubicTo(15, 15, 21, 15, 21, 20);

    canvas.drawPath(bLeft, strokePaint);
    canvas.drawPath(bRight, strokePaint);
    canvas.drawPath(bCenter, strokePaint..strokeWidth = 2.2);
  }

  @override
  bool shouldRepaint(covariant _WorkCrewPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
