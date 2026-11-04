import 'package:flutter/material.dart';

/// Icono vectorial de tractor para ingeniería agrícola o de construcción.
class TractorIcon extends StatelessWidget {
  final double size;
  final Color bodyColor;
  final Color wheelColor;

  const TractorIcon({
    super.key,
    this.size = 24.0,
    this.bodyColor = const Color(0xFF43A047),
    this.wheelColor = const Color(0xFF263238),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TractorPainter(
          bodyColor: bodyColor,
          wheelColor: wheelColor,
        ),
      ),
    );
  }
}

class _TractorPainter extends CustomPainter {
  final Color bodyColor;
  final Color wheelColor;

  const _TractorPainter({
    required this.bodyColor,
    required this.wheelColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bodyPaint = Paint()
      ..color = bodyColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = wheelColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final rimPaint = Paint()..color = const Color(0xFFFFB300);
    final windowPaint = Paint()..color = const Color(0xFF81D4FA);

    // Exhaust Pipe
    final exhaustPaint = Paint()
      ..color = const Color(0xFF37474F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawLine(const Offset(19, 10), const Offset(19, 5), exhaustPaint);

    // Engine Hood
    final hoodPath = Path()
      ..moveTo(12, 16)
      ..lineTo(12, 10)
      ..lineTo(21, 10)
      ..lineTo(21, 16)
      ..close();
    canvas.drawPath(hoodPath, bodyPaint);

    // Cabin
    final cabinPath = Path()
      ..moveTo(4, 16)
      ..lineTo(4, 8)
      ..lineTo(11, 8)
      ..lineTo(12, 16)
      ..close();
    canvas.drawPath(cabinPath, bodyPaint);

    // Cabin Window
    final windowPath = Path()
      ..moveTo(5.5, 9.5)
      ..lineTo(10, 9.5)
      ..lineTo(10.5, 13)
      ..lineTo(5.5, 13)
      ..close();
    canvas.drawPath(windowPath, windowPaint);

    // Front Wheel (Small)
    canvas.drawCircle(const Offset(18.5, 16.5), 2.5, wheelPaint);
    canvas.drawCircle(const Offset(18.5, 16.5), 1.0, rimPaint);

    // Rear Wheel (Large)
    canvas.drawCircle(const Offset(7, 15.5), 4.5, wheelPaint);
    canvas.drawCircle(const Offset(7, 15.5), 2.0, rimPaint);
  }

  @override
  bool shouldRepaint(covariant _TractorPainter oldDelegate) =>
      oldDelegate.bodyColor != bodyColor || oldDelegate.wheelColor != wheelColor;
}
