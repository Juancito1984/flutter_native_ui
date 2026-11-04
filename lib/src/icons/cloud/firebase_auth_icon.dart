import 'package:flutter/material.dart';

/// Icono vectorial de Firebase Authentication (Escudo de Llave).
class FirebaseAuthIcon extends StatelessWidget {
  final double size;

  const FirebaseAuthIcon({
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
        painter: const _FirebaseAuthIconPainter(),
      ),
    );
  }
}

class _FirebaseAuthIconPainter extends CustomPainter {
  const _FirebaseAuthIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = const Color(0xFF1976D2)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final shieldPath = Path()
      ..moveTo(12.0, 2.0)
      ..lineTo(20.0, 5.0)
      ..cubicTo(20.0, 12.5, 16.5, 18.5, 12.0, 22.0)
      ..cubicTo(7.5, 18.5, 4.0, 12.5, 4.0, 5.0)
      ..close();
    canvas.drawPath(shieldPath, bgPaint);

    final keyPaint = Paint()
      ..color = const Color(0xFFFFCA28)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawCircle(const Offset(12, 10), 3.0, keyPaint);
    canvas.drawRect(const Rect.fromLTWH(11.0, 10.0, 2.0, 6.0), keyPaint);
    canvas.drawRect(const Rect.fromLTWH(12.0, 14.0, 2.5, 1.5), keyPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
