import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de casco de obrero / ingeniero.
class HardhatWorkerIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const HardhatWorkerIcon({
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
    final hatAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB300));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _HardhatWorkerPainter(
          primaryColor: primary,
          accentColor: hatAccent,
        ),
      ),
    );
  }
}

class _HardhatWorkerPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _HardhatWorkerPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final hatPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final rimPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Hardhat Dome (Vibrant Golden Yellow Accent Fill)
    final domePath = Path()
      ..moveTo(6, 12)
      ..cubicTo(6, 6, 18, 6, 18, 12)
      ..close();
    canvas.drawPath(domePath, hatPaint);

    // Hardhat Rim/Brim
    canvas.drawLine(const Offset(3, 13), const Offset(21, 13), rimPaint);
  }

  @override
  bool shouldRepaint(covariant _HardhatWorkerPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
