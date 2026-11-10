import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de escudo de seguridad verificado.
class ShieldCheckIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const ShieldCheckIcon({
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
    final checkAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ShieldCheckIconPainter(
          primaryColor: primary,
          accentColor: checkAccent,
        ),
      ),
    );
  }
}

class _ShieldCheckIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _ShieldCheckIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final shieldStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final checkStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // Shield Contour
    final shieldPath = Path()
      ..moveTo(12.0, 3.0)
      ..lineTo(19.0, 5.5)
      ..cubicTo(19.0, 13.0, 15.0, 18.5, 12.0, 21.0)
      ..cubicTo(9.0, 18.5, 5.0, 13.0, 5.0, 5.5)
      ..close();
    canvas.drawPath(shieldPath, shieldStroke);

    // Checkmark inside (Vibrant Emerald Accent)
    final checkPath = Path()
      ..moveTo(9.0, 11.5)
      ..lineTo(11.0, 13.5)
      ..lineTo(15.5, 9.0);
    canvas.drawPath(checkPath, checkStroke);
  }

  @override
  bool shouldRepaint(covariant _ShieldCheckIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
