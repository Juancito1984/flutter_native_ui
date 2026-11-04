import 'package:flutter/material.dart';

/// Icono vectorial de Instagram.
class InstagramIcon extends StatelessWidget {
  final double size;

  const InstagramIcon({
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
        painter: const _InstagramIconPainter(),
      ),
    );
  }
}

class _InstagramIconPainter extends CustomPainter {
  const _InstagramIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final rect = const Rect.fromLTWH(2, 2, 20, 20);
    final gradientPaint = Paint()
      ..shader = const RadialGradient(
        center: Alignment(-0.8, 0.9),
        radius: 1.2,
        colors: [
          Color(0xFFFFE500),
          Color(0xFFF75274),
          Color(0xFFB425A6),
        ],
      ).createShader(rect)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Fondo redondeado con degradado de Instagram
    final bgRRect = RRect.fromRectAndRadius(rect, const Radius.circular(5.5));
    canvas.drawRRect(bgRRect, gradientPaint);

    // Cámara interior blanca
    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    final camRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(5.5, 5.5, 13, 13),
      const Radius.circular(3.5),
    );
    canvas.drawRRect(camRRect, whitePaint);

    // Círculo del lente
    canvas.drawCircle(const Offset(12, 12), 3.2, whitePaint);

    // Punto del flash
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    canvas.drawCircle(const Offset(15.5, 8.5), 0.9, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
