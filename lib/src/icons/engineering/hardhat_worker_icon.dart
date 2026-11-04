import 'package:flutter/material.dart';

/// Icono vectorial de trabajador/ingeniero con casco de seguridad.
class HardhatWorkerIcon extends StatelessWidget {
  final double size;
  final Color hardhatColor;
  final Color skinColor;
  final Color vestColor;

  const HardhatWorkerIcon({
    super.key,
    this.size = 24.0,
    this.hardhatColor = const Color(0xFFFFB300),
    this.skinColor = const Color(0xFFFFCC80),
    this.vestColor = const Color(0xFFFF5722),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _HardhatWorkerPainter(
          hardhatColor: hardhatColor,
          skinColor: skinColor,
          vestColor: vestColor,
        ),
      ),
    );
  }
}

class _HardhatWorkerPainter extends CustomPainter {
  final Color hardhatColor;
  final Color skinColor;
  final Color vestColor;

  const _HardhatWorkerPainter({
    required this.hardhatColor,
    required this.skinColor,
    required this.vestColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final vestPaint = Paint()
      ..color = vestColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final skinPaint = Paint()
      ..color = skinColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final hardhatPaint = Paint()
      ..color = hardhatColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Vest / Shoulders
    final shouldersPath = Path()
      ..moveTo(4, 21)
      ..cubicTo(4, 16.5, 7.5, 14.5, 12, 14.5)
      ..cubicTo(16.5, 14.5, 20, 16.5, 20, 21)
      ..close();
    canvas.drawPath(shouldersPath, vestPaint);

    // Reflective vest stripes
    final stripePaint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..isAntiAlias = true;
    canvas.drawLine(const Offset(8, 16), const Offset(8, 21), stripePaint);
    canvas.drawLine(const Offset(16, 16), const Offset(16, 21), stripePaint);

    // Head / Face
    canvas.drawCircle(const Offset(12, 11), 3.8, skinPaint);

    // Hardhat Dome
    final hardhatPath = Path()
      ..moveTo(6, 9)
      ..cubicTo(6, 4.5, 9, 3, 12, 3)
      ..cubicTo(15, 3, 18, 4.5, 18, 9)
      ..close();
    canvas.drawPath(hardhatPath, hardhatPaint);

    // Hardhat Brim / Visor
    final brimPath = Path()
      ..moveTo(4.5, 9)
      ..lineTo(19.5, 9)
      ..cubicTo(19.5, 10.2, 18, 10.2, 18, 10.2)
      ..lineTo(6, 10.2)
      ..cubicTo(4.5, 10.2, 4.5, 9, 4.5, 9)
      ..close();
    canvas.drawPath(brimPath, hardhatPaint);
  }

  @override
  bool shouldRepaint(covariant _HardhatWorkerPainter oldDelegate) =>
      oldDelegate.hardhatColor != hardhatColor ||
      oldDelegate.skinColor != skinColor ||
      oldDelegate.vestColor != vestColor;
}
