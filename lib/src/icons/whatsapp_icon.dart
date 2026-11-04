import 'package:flutter/material.dart';

/// Icono vectorial oficial de WhatsApp.
class WhatsAppIcon extends StatelessWidget {
  final double size;

  const WhatsAppIcon({
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
        painter: const _WhatsAppIconPainter(),
      ),
    );
  }
}

class _WhatsAppIconPainter extends CustomPainter {
  const _WhatsAppIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = const Color(0xFF25D366)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawCircle(const Offset(12, 12), 11.5, bgPaint);

    final phonePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(17.47, 14.38)
      ..cubicTo(17.17, 14.23, 15.7, 13.5, 15.42, 13.4)
      ..cubicTo(15.15, 13.3, 14.95, 13.3, 14.75, 13.6)
      ..cubicTo(14.55, 13.9, 13.98, 14.57, 13.8, 14.77)
      ..cubicTo(13.63, 14.97, 13.45, 15.0, 13.15, 14.85)
      ..cubicTo(12.85, 14.7, 11.89, 14.39, 10.75, 13.37)
      ..cubicTo(9.86, 12.58, 9.26, 11.6, 9.09, 11.3)
      ..cubicTo(8.91, 11.0, 9.07, 10.84, 9.22, 10.69)
      ..cubicTo(9.35, 10.56, 9.51, 10.35, 9.66, 10.18)
      ..cubicTo(9.81, 10.0, 9.86, 9.88, 9.96, 9.68)
      ..cubicTo(10.06, 9.48, 10.01, 9.3, 9.94, 9.15)
      ..cubicTo(9.86, 9.0, 9.26, 7.53, 9.01, 6.93)
      ..cubicTo(8.77, 6.35, 8.52, 6.43, 8.35, 6.42)
      ..cubicTo(8.19, 6.41, 8.01, 6.41, 7.83, 6.41)
      ..cubicTo(7.65, 6.41, 7.36, 6.48, 7.11, 6.75)
      ..cubicTo(6.86, 7.02, 6.15, 7.68, 6.15, 9.03)
      ..cubicTo(6.15, 10.38, 7.13, 11.68, 7.27, 11.87)
      ..cubicTo(7.41, 12.06, 9.2, 14.8, 11.93, 15.98)
      ..cubicTo(12.58, 16.26, 13.08, 16.43, 13.48, 16.55)
      ..cubicTo(14.13, 16.76, 14.73, 16.73, 15.2, 16.66)
      ..cubicTo(15.72, 16.58, 16.8, 16.0, 17.02, 15.38)
      ..cubicTo(17.25, 14.76, 17.25, 14.23, 17.18, 14.12)
      ..cubicTo(17.11, 14.01, 16.93, 13.95, 16.63, 13.8)
      ..close();

    canvas.drawPath(path, phonePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
