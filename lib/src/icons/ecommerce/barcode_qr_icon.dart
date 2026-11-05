import 'package:flutter/material.dart';

/// Icono vectorial de escáner de código de barras / QR.
class BarcodeQrIcon extends StatelessWidget {
  final double size;
  final Color color;

  const BarcodeQrIcon({
    super.key,
    this.size = 24.0,
    this.color = const Color(0xFF37474F),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BarcodeQrPainter(color: color),
      ),
    );
  }
}

class _BarcodeQrPainter extends CustomPainter {
  final Color color;

  const _BarcodeQrPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Barcode vertical lines
    canvas.drawRect(const Rect.fromLTRB(3, 5, 5, 19), linePaint);
    canvas.drawRect(const Rect.fromLTRB(6, 5, 7, 19), linePaint);
    canvas.drawRect(const Rect.fromLTRB(9, 5, 11, 19), linePaint);
    canvas.drawRect(const Rect.fromLTRB(13, 5, 14, 19), linePaint);
    canvas.drawRect(const Rect.fromLTRB(16, 5, 18, 19), linePaint);
    canvas.drawRect(const Rect.fromLTRB(19, 5, 21, 19), linePaint);
  }

  @override
  bool shouldRepaint(covariant _BarcodeQrPainter oldDelegate) =>
      oldDelegate.color != color;
}
