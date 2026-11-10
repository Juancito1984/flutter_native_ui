import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Candado Inteligente / Smart Lock.
class SmartLockIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SmartLockIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SmartLockIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _SmartLockIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SmartLockIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bodyPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final signalPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Lock Body RRect
    final bodyRect = RRect.fromRectAndRadius(
      const Rect.fromLTRB(5.0, 10.0, 19.0, 21.0),
      const Radius.circular(3.0),
    );
    canvas.drawRRect(bodyRect, bodyPaint);

    // Shackle Arc
    final shackle = Path()
      ..moveTo(8.0, 10.0)
      ..lineTo(8.0, 7.0)
      ..cubicTo(8.0, 4.0, 16.0, 4.0, 16.0, 7.0)
      ..lineTo(16.0, 10.0);
    canvas.drawPath(shackle, bodyPaint);

    // Wireless Signal Waves (Vibrant Accent)
    canvas.drawArc(const Rect.fromLTRB(9.0, 1.5, 15.0, 7.5), -2.6, 2.0, false, signalPaint..strokeWidth = 1.4);
    canvas.drawArc(const Rect.fromLTRB(6.0, -1.0, 18.0, 11.0), -2.6, 2.0, false, signalPaint);
  }

  @override
  bool shouldRepaint(covariant _SmartLockIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
