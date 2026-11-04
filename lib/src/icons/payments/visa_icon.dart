import 'package:flutter/material.dart';

/// Icono vectorial de VISA.
class VisaIcon extends StatelessWidget {
  final double size;

  const VisaIcon({
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
        painter: const _VisaIconPainter(),
      ),
    );
  }
}

class _VisaIconPainter extends CustomPainter {
  const _VisaIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = const Color(0xFF1A1F71)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(0, 4, 24, 16),
        const Radius.circular(3),
      ),
      bgPaint,
    );

    final textPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final yellowPaint = Paint()
      ..color = const Color(0xFFF79E1B)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // V
    final vPath = Path()
      ..moveTo(4.2, 8.0)
      ..lineTo(6.2, 16.0)
      ..lineTo(8.0, 16.0)
      ..lineTo(10.5, 8.0)
      ..lineTo(8.8, 8.0)
      ..lineTo(7.2, 13.8)
      ..lineTo(5.6, 8.0)
      ..close();
    canvas.drawPath(vPath, textPaint);

    // Accent on V
    final accPath = Path()
      ..moveTo(4.2, 8.0)
      ..lineTo(3.0, 8.0)
      ..lineTo(4.8, 11.5)
      ..close();
    canvas.drawPath(accPath, yellowPaint);

    // I
    canvas.drawRect(const Rect.fromLTWH(11.0, 8.0, 1.8, 8.0), textPaint);

    // S
    final sPath = Path()
      ..moveTo(15.8, 9.8)
      ..cubicTo(15.2, 9.4, 14.4, 9.2, 13.8, 9.4)
      ..cubicTo(13.2, 9.6, 13.0, 10.1, 13.2, 10.6)
      ..cubicTo(13.4, 11.2, 14.2, 11.5, 14.8, 11.8)
      ..cubicTo(15.8, 12.3, 16.4, 13.0, 16.2, 14.2)
      ..cubicTo(16.0, 15.4, 14.6, 16.2, 13.2, 16.0)
      ..cubicTo(12.4, 15.8, 11.8, 15.4, 11.2, 14.8)
      ..lineTo(12.0, 13.6)
      ..cubicTo(12.6, 14.2, 13.2, 14.6, 13.8, 14.6)
      ..cubicTo(14.4, 14.6, 14.8, 14.2, 14.8, 13.7)
      ..cubicTo(14.8, 13.2, 14.2, 12.8, 13.5, 12.5)
      ..cubicTo(12.6, 12.0, 12.0, 11.4, 12.0, 10.4)
      ..cubicTo(12.0, 9.2, 13.2, 8.0, 14.8, 8.0)
      ..cubicTo(15.5, 8.0, 16.2, 8.3, 16.8, 8.8)
      ..close();
    canvas.drawPath(sPath, textPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
