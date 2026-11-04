import 'package:flutter/material.dart';

/// Icono vectorial de estetoscopio médico para salud y farmacia.
class StethoscopeIcon extends StatelessWidget {
  final double size;
  final Color tubeColor;
  final Color bellColor;

  const StethoscopeIcon({
    super.key,
    this.size = 24.0,
    this.tubeColor = const Color(0xFF1E88E5),
    this.bellColor = const Color(0xFF78909C),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _StethoscopePainter(
          tubeColor: tubeColor,
          bellColor: bellColor,
        ),
      ),
    );
  }
}

class _StethoscopePainter extends CustomPainter {
  final Color tubeColor;
  final Color bellColor;

  const _StethoscopePainter({
    required this.tubeColor,
    required this.bellColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final tubePaint = Paint()
      ..color = tubeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final bellPaint = Paint()
      ..color = bellColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Earpieces & U-Tube
    final uPath = Path()
      ..moveTo(6, 3)
      ..lineTo(6, 9)
      ..cubicTo(6, 15, 18, 15, 18, 9)
      ..lineTo(18, 3);
    canvas.drawPath(uPath, tubePaint);

    // Flexible Tube & Chestpiece extension
    final flexPath = Path()
      ..moveTo(12, 12)
      ..cubicTo(12, 18, 17, 21, 17, 16);
    canvas.drawPath(flexPath, tubePaint);

    // Earpiece Tips
    canvas.drawCircle(const Offset(6, 3), 1.2, bellPaint);
    canvas.drawCircle(const Offset(18, 3), 1.2, bellPaint);

    // Chestpiece Bell
    canvas.drawCircle(const Offset(17, 16), 2.8, bellPaint);
    final inner = Paint()..color = const Color(0xFFECEFF1);
    canvas.drawCircle(const Offset(17, 16), 1.2, inner);
  }

  @override
  bool shouldRepaint(covariant _StethoscopePainter oldDelegate) =>
      oldDelegate.tubeColor != tubeColor || oldDelegate.bellColor != bellColor;
}
