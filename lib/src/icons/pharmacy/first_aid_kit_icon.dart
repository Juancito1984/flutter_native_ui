import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de botiquín de primeros auxilios.
class FirstAidKitIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const FirstAidKitIcon({
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
    final redAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFE53935));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _FirstAidKitPainter(
          primaryColor: primary,
          accentColor: redAccent,
        ),
      ),
    );
  }
}

class _FirstAidKitPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _FirstAidKitPainter({
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

    final crossFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Handle
    final handlePath = Path()
      ..moveTo(9, 6)
      ..lineTo(9, 3)
      ..lineTo(15, 3)
      ..lineTo(15, 6);
    canvas.drawPath(handlePath, strokePaint);

    // Box Body
    final kitRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(3, 6, 18, 14),
      const Radius.circular(3),
    );
    canvas.drawRRect(kitRect, strokePaint);

    // Red Cross Inside (Vibrant Crimson Accent)
    canvas.drawRect(const Rect.fromLTWH(10.5, 10, 3, 6), crossFill);
    canvas.drawRect(const Rect.fromLTWH(9, 11.5, 6, 3), crossFill);
  }

  @override
  bool shouldRepaint(covariant _FirstAidKitPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
