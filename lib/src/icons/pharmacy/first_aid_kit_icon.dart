import 'package:flutter/material.dart';

/// Icono vectorial de botiquín de primeros auxilios.
class FirstAidKitIcon extends StatelessWidget {
  final double size;
  final Color kitColor;
  final Color crossColor;

  const FirstAidKitIcon({
    super.key,
    this.size = 24.0,
    this.kitColor = const Color(0xFFE53935),
    this.crossColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _FirstAidKitPainter(
          kitColor: kitColor,
          crossColor: crossColor,
        ),
      ),
    );
  }
}

class _FirstAidKitPainter extends CustomPainter {
  final Color kitColor;
  final Color crossColor;

  const _FirstAidKitPainter({
    required this.kitColor,
    required this.crossColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final kitPaint = Paint()
      ..color = kitColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final crossPaint = Paint()
      ..color = crossColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final handlePaint = Paint()
      ..color = const Color(0xFFB71C1C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    // Handle Top
    final handlePath = Path()
      ..moveTo(9, 7)
      ..lineTo(9, 4)
      ..lineTo(15, 4)
      ..lineTo(15, 7);
    canvas.drawPath(handlePath, handlePaint);

    // Box Body
    final boxRect = RRect.fromLTRBR(3, 7, 21, 20, const Radius.circular(3.0));
    canvas.drawRRect(boxRect, kitPaint);

    // Medical Cross
    canvas.drawRRect(
      RRect.fromLTRBR(10.5, 9.5, 13.5, 17.5, const Radius.circular(0.8)),
      crossColor == Colors.white ? crossPaint : crossPaint,
    );
    canvas.drawRRect(
      RRect.fromLTRBR(6.5, 12, 17.5, 15, const Radius.circular(0.8)),
      crossColor == Colors.white ? crossPaint : crossPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _FirstAidKitPainter oldDelegate) =>
      oldDelegate.kitColor != kitColor || oldDelegate.crossColor != crossColor;
}
