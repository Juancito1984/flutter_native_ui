import 'package:flutter/material.dart';

/// Icono vectorial de maquinaria pesada / excavadora de ingeniería.
class ExcavatorIcon extends StatelessWidget {
  final double size;
  final Color bodyColor;
  final Color trackColor;

  const ExcavatorIcon({
    super.key,
    this.size = 24.0,
    this.bodyColor = const Color(0xFFFFB300),
    this.trackColor = const Color(0xFF37474F),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ExcavatorPainter(
          bodyColor: bodyColor,
          trackColor: trackColor,
        ),
      ),
    );
  }
}

class _ExcavatorPainter extends CustomPainter {
  final Color bodyColor;
  final Color trackColor;

  const _ExcavatorPainter({
    required this.bodyColor,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bodyPaint = Paint()
      ..color = bodyColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final armPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final windowPaint = Paint()
      ..color = const Color(0xFF81D4FA)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Track (Base)
    final trackRRect = RRect.fromLTRBR(2, 17, 14, 21, const Radius.circular(2.5));
    canvas.drawRRect(trackRRect, trackPaint);

    // Track wheels
    final wheelPaint = Paint()..color = const Color(0xFFCFD8DC);
    canvas.drawCircle(const Offset(4.5, 19), 1.2, wheelPaint);
    canvas.drawCircle(const Offset(8, 19), 1.2, wheelPaint);
    canvas.drawCircle(const Offset(11.5, 19), 1.2, wheelPaint);

    // Cabin Body
    final cabinPath = Path()
      ..moveTo(3, 17)
      ..lineTo(3, 10)
      ..lineTo(11, 10)
      ..lineTo(13, 13)
      ..lineTo(13, 17)
      ..close();
    canvas.drawPath(cabinPath, bodyPaint);

    // Cabin Window
    final windowRect = RRect.fromLTRBR(7, 11, 11.5, 14.5, const Radius.circular(1));
    canvas.drawRRect(windowRect, windowPaint);

    // Boom Arm & Dipper
    final armPath = Path()
      ..moveTo(11, 13)
      ..lineTo(16, 7)
      ..lineTo(21, 12);
    canvas.drawPath(armPath, armPaint);

    // Bucket
    final bucketPath = Path()
      ..moveTo(20, 11)
      ..lineTo(23, 14)
      ..lineTo(21, 17)
      ..lineTo(19, 15)
      ..close();
    canvas.drawPath(bucketPath, bodyPaint);
  }

  @override
  bool shouldRepaint(covariant _ExcavatorPainter oldDelegate) =>
      oldDelegate.bodyColor != bodyColor || oldDelegate.trackColor != trackColor;
}
