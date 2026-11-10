import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de maleta de equipaje para viajes.
class SuitcaseIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SuitcaseIcon({
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
        painter: _SuitcasePainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _SuitcasePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SuitcasePainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final casePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final handlePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    // Handle (Vibrant Gold Accent)
    final handlePath = Path()
      ..moveTo(9, 6)
      ..lineTo(9, 3)
      ..lineTo(15, 3)
      ..lineTo(15, 6);
    canvas.drawPath(handlePath, handlePaint);

    // Body
    final bodyRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(3, 6, 18, 14),
      const Radius.circular(3),
    );
    canvas.drawRRect(bodyRRect, casePaint);

    // Belts/Straps
    canvas.drawLine(const Offset(8, 6), const Offset(8, 20), Paint()..color = accentColor..strokeWidth = 1.4);
    canvas.drawLine(const Offset(16, 6), const Offset(16, 20), Paint()..color = accentColor..strokeWidth = 1.4);
  }

  @override
  bool shouldRepaint(covariant _SuitcasePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
