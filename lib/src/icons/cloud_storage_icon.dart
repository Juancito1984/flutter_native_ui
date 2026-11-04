import 'package:flutter/material.dart';

/// Icono vectorial de Cloud Storage / Nube de datos.
class CloudStorageIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const CloudStorageIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cloudColor = color ?? const Color(0xFF0288D1);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CloudStorageIconPainter(color: cloudColor),
      ),
    );
  }
}

class _CloudStorageIconPainter extends CustomPainter {
  final Color color;

  const _CloudStorageIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(19.35, 10.04)
      ..cubicTo(18.67, 6.59, 15.64, 4.0, 12.0, 4.0)
      ..cubicTo(9.11, 4.0, 6.6, 5.64, 5.35, 8.04)
      ..cubicTo(2.34, 8.36, 0.0, 10.91, 0.0, 14.0)
      ..cubicTo(0.0, 17.31, 2.69, 20.0, 6.0, 20.0)
      ..lineTo(19.0, 20.0)
      ..cubicTo(21.76, 20.0, 24.0, 17.76, 24.0, 15.0)
      ..cubicTo(24.0, 12.36, 21.95, 10.22, 19.35, 10.04)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CloudStorageIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
