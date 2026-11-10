import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de código de barras y QR.
class BarcodeQrIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const BarcodeQrIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : theme.colorScheme.secondary);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BarcodeQrPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _BarcodeQrPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _BarcodeQrPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final mainBar = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final accentBar = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    // Barcode vertical lines
    canvas.drawLine(const Offset(4, 5), const Offset(4, 19), mainBar..strokeWidth = 2.0);
    canvas.drawLine(const Offset(8, 5), const Offset(8, 19), accentBar..strokeWidth = 1.2);
    canvas.drawLine(const Offset(11, 5), const Offset(11, 19), mainBar..strokeWidth = 2.5);
    canvas.drawLine(const Offset(15, 5), const Offset(15, 19), accentBar..strokeWidth = 1.2);
    canvas.drawLine(const Offset(19, 5), const Offset(19, 19), mainBar..strokeWidth = 2.0);
  }

  @override
  bool shouldRepaint(covariant _BarcodeQrPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
