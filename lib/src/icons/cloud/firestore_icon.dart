import 'package:flutter/material.dart';

/// Icono vectorial de Cloud Firestore.
class FirestoreIcon extends StatelessWidget {
  final double size;

  const FirestoreIcon({
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
        painter: const _FirestoreIconPainter(),
      ),
    );
  }
}

class _FirestoreIconPainter extends CustomPainter {
  const _FirestoreIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final orangePaint = Paint()
      ..color = const Color(0xFFFF9100)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final yellowPaint = Paint()
      ..color = const Color(0xFFFFC400)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Database Layer 1 (Top)
    final p1 = Path()
      ..moveTo(12, 3)
      ..lineTo(21, 7.5)
      ..lineTo(12, 12)
      ..lineTo(3, 7.5)
      ..close();
    canvas.drawPath(p1, orangePaint);

    // Database Layer 2 (Middle)
    final p2 = Path()
      ..moveTo(3, 11)
      ..lineTo(12, 15.5)
      ..lineTo(21, 11)
      ..lineTo(21, 13)
      ..lineTo(12, 17.5)
      ..lineTo(3, 13)
      ..close();
    canvas.drawPath(p2, yellowPaint);

    // Database Layer 3 (Bottom)
    final p3 = Path()
      ..moveTo(3, 16.5)
      ..lineTo(12, 21)
      ..lineTo(21, 16.5)
      ..lineTo(21, 18.5)
      ..lineTo(12, 23)
      ..lineTo(3, 18.5)
      ..close();
    canvas.drawPath(p3, orangePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
