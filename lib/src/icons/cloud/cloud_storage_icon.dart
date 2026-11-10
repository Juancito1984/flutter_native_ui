import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de nube de almacenamiento de datos.
class CloudStorageIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const CloudStorageIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF0288D1));
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CloudStoragePainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _CloudStoragePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _CloudStoragePainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cloudPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final cloudPath = Path()
      ..moveTo(19.35, 10.04)
      ..cubicTo(18.67, 6.59, 15.64, 4.0, 12.0, 4.0)
      ..cubicTo(9.11, 4.0, 6.6, 5.64, 5.35, 8.04)
      ..cubicTo(2.34, 8.36, 0.0, 10.91, 0.0, 14.0)
      ..cubicTo(0.0, 17.31, 2.69, 20.0, 6.0, 20.0)
      ..lineTo(19.0, 20.0)
      ..cubicTo(21.76, 20.0, 24.0, 17.76, 24.0, 15.0)
      ..cubicTo(24.0, 12.36, 21.95, 10.22, 19.35, 10.04)
      ..close();

    canvas.drawPath(cloudPath, cloudPaint);

    // Storage Accent Dot
    canvas.drawCircle(const Offset(12, 14), 2.2, Paint()..color = accentColor);
  }

  @override
  bool shouldRepaint(covariant _CloudStoragePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
