import 'package:flutter/material.dart';

/// Icono vectorial de jeringa/inyección para salud y farmacia.
class SyringeIcon extends StatelessWidget {
  final double size;
  final Color fluidColor;
  final Color bodyColor;

  const SyringeIcon({
    super.key,
    this.size = 24.0,
    this.fluidColor = const Color(0xFF00BCD4),
    this.bodyColor = const Color(0xFF78909C),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SyringePainter(
          fluidColor: fluidColor,
          bodyColor: bodyColor,
        ),
      ),
    );
  }
}

class _SyringePainter extends CustomPainter {
  final Color fluidColor;
  final Color bodyColor;

  const _SyringePainter({
    required this.fluidColor,
    required this.bodyColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final mainPaint = Paint()
      ..color = bodyColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..isAntiAlias = true;

    final fluidPaint = Paint()
      ..color = fluidColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(-0.785398); // -45 deg

    // Needle
    canvas.drawLine(const Offset(-10, 0), const Offset(-5, 0), mainPaint);

    // Barrel Body
    final barrelRect = RRect.fromLTRBR(-5, -3, 5, 3, const Radius.circular(1));
    canvas.drawRRect(barrelRect, mainPaint);

    // Fluid inside barrel
    final fluidRect = RRect.fromLTRBR(-5, -2, 1, 2, const Radius.circular(0.5));
    canvas.drawRRect(fluidRect, fluidPaint);

    // Plunger Rod & Push Top
    canvas.drawLine(const Offset(5, 0), const Offset(9, 0), mainPaint);
    canvas.drawLine(const Offset(9, -2.5), const Offset(9, 2.5), mainPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _SyringePainter oldDelegate) =>
      oldDelegate.fluidColor != fluidColor || oldDelegate.bodyColor != bodyColor;
}
