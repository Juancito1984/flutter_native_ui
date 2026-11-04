import 'package:flutter/material.dart';

/// Icono vectorial de herramientas de ingeniería (Llave y Martillo cruzados).
class EngineeringToolsIcon extends StatelessWidget {
  final double size;
  final Color metalColor;
  final Color handleColor;

  const EngineeringToolsIcon({
    super.key,
    this.size = 24.0,
    this.metalColor = const Color(0xFF78909C),
    this.handleColor = const Color(0xFFD84315),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _EngineeringToolsPainter(
          metalColor: metalColor,
          handleColor: handleColor,
        ),
      ),
    );
  }
}

class _EngineeringToolsPainter extends CustomPainter {
  final Color metalColor;
  final Color handleColor;

  const _EngineeringToolsPainter({
    required this.metalColor,
    required this.handleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final metalPaint = Paint()
      ..color = metalColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final handlePaint = Paint()
      ..color = handleColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Hammer (Diagonal 1)
    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(0.785398); // 45 degrees

    // Hammer handle
    canvas.drawRRect(
      RRect.fromLTRBR(-1.2, -8, 1.2, 8, const Radius.circular(1)),
      handlePaint,
    );
    // Hammer head
    canvas.drawRRect(
      RRect.fromLTRBR(-4, -9.5, 4, -6.5, const Radius.circular(1)),
      metalPaint,
    );
    canvas.restore();

    // Wrench (Diagonal 2)
    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(-0.785398); // -45 degrees

    // Wrench handle
    canvas.drawRRect(
      RRect.fromLTRBR(-1.2, -8, 1.2, 8, const Radius.circular(1)),
      metalPaint,
    );
    // Wrench top head
    canvas.drawCircle(const Offset(0, -7.5), 3.2, metalPaint);
    final cutoutPaint = Paint()
      ..color = const Color(0x00000000)
      ..blendMode = BlendMode.clear;
    canvas.drawRect(const Rect.fromLTRB(-1.2, -10, 1.2, -7), cutoutPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _EngineeringToolsPainter oldDelegate) =>
      oldDelegate.metalColor != metalColor || oldDelegate.handleColor != handleColor;
}
