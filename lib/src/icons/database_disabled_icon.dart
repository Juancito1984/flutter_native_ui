import 'package:flutter/material.dart';

/// Icono vectorial de Base de Datos Desactivada / Desconectada.
class DatabaseDisabledIcon extends StatelessWidget {
  final double size;

  const DatabaseDisabledIcon({
    super.key,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: const _DatabaseDisabledIconPainter(),
      ),
    );
  }
}

class _DatabaseDisabledIconPainter extends CustomPainter {
  const _DatabaseDisabledIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final dbPaint = Paint()
      ..color = const Color(0xFF757575)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;

    // Cylinder 1 (Top)
    canvas.drawOval(const Rect.fromLTWH(4, 3, 16, 6), dbPaint);

    // Cylinder 2 (Middle)
    final p2 = Path()
      ..moveTo(4, 6)
      ..lineTo(4, 12)
      ..cubicTo(4, 15, 20, 15, 20, 12)
      ..lineTo(20, 6);
    canvas.drawPath(p2, dbPaint);

    // Cylinder 3 (Bottom)
    final p3 = Path()
      ..moveTo(4, 12)
      ..lineTo(4, 18)
      ..cubicTo(4, 21, 20, 21, 20, 18)
      ..lineTo(20, 12);
    canvas.drawPath(p3, dbPaint);

    // Red Slash Off Line
    final alertPaint = Paint()
      ..color = const Color(0xFFD32F2F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawLine(const Offset(3, 3), const Offset(21, 21), alertPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
