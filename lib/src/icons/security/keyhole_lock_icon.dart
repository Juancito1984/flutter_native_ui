import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Candado con Ojo de Cerradura.
class KeyholeLockIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const KeyholeLockIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB703));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _KeyholeLockIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _KeyholeLockIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _KeyholeLockIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final shacklePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final bodyPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    final holeFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Shackle Arc
    final shackle = Path()
      ..moveTo(7.0, 10.0)
      ..lineTo(7.0, 7.0)
      ..cubicTo(7.0, 3.5, 17.0, 3.5, 17.0, 7.0)
      ..lineTo(17.0, 10.0);
    canvas.drawPath(shackle, shacklePaint);

    // Lock Body RRect
    final bodyRect = RRect.fromRectAndRadius(
      const Rect.fromLTRB(4.0, 10.0, 20.0, 21.0),
      const Radius.circular(3.0),
    );
    canvas.drawRRect(bodyRect, bodyPaint);

    // Keyhole Circle + Trapezoid (Vibrant Amber/Gold Accent)
    canvas.drawCircle(const Offset(12.0, 14.0), 1.6, holeFill);
    final holePath = Path()
      ..moveTo(11.0, 14.5)
      ..lineTo(13.0, 14.5)
      ..lineTo(13.5, 17.5)
      ..lineTo(10.5, 17.5)
      ..close();
    canvas.drawPath(holePath, holeFill);
  }

  @override
  bool shouldRepaint(covariant _KeyholeLockIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
