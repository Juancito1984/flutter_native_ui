import 'package:flutter/material.dart';

/// Icono vectorial oficial de Firebase (Llama de 3 colores).
class FirebaseIcon extends StatelessWidget {
  final double size;

  const FirebaseIcon({
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
        painter: const _FirebaseIconPainter(),
      ),
    );
  }
}

class _FirebaseIconPainter extends CustomPainter {
  const _FirebaseIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final yellowPaint = Paint()
      ..color = const Color(0xFFFFCA28)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final orangePaint = Paint()
      ..color = const Color(0xFFFFA000)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final redPaint = Paint()
      ..color = const Color(0xFFDD2C00)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Outer Yellow Flame
    final path1 = Path()
      ..moveTo(3.9, 17.1)
      ..lineTo(10.2, 5.0)
      ..lineTo(13.2, 10.6)
      ..close();
    canvas.drawPath(path1, yellowPaint);

    // Orange Flame
    final path2 = Path()
      ..moveTo(3.9, 17.1)
      ..lineTo(7.8, 2.5)
      ..lineTo(11.8, 10.1)
      ..close();
    canvas.drawPath(path2, orangePaint);

    // Red Flame Center
    final path3 = Path()
      ..moveTo(12.0, 21.5)
      ..lineTo(20.1, 17.1)
      ..lineTo(15.2, 2.0)
      ..lineTo(11.8, 10.1)
      ..close();
    canvas.drawPath(path3, redPaint);

    // Base flame connect
    final path4 = Path()
      ..moveTo(3.9, 17.1)
      ..lineTo(12.0, 21.5)
      ..lineTo(20.1, 17.1)
      ..lineTo(13.2, 10.6)
      ..close();
    canvas.drawPath(path4, yellowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
