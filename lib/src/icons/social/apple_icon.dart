import 'package:flutter/material.dart';

/// Icono vectorial de Apple.
class AppleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const AppleIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _AppleIconPainter(color: iconColor),
      ),
    );
  }
}

class _AppleIconPainter extends CustomPainter {
  final Color color;

  const _AppleIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(18.71, 19.5)
      ..cubicTo(17.88, 20.74, 17.0, 21.97, 15.66, 21.97)
      ..cubicTo(14.32, 21.97, 13.89, 21.18, 12.37, 21.18)
      ..cubicTo(10.84, 21.18, 10.37, 21.95, 9.1, 21.97)
      ..cubicTo(7.77, 22.0, 6.84, 20.65, 5.99, 19.43)
      ..cubicTo(4.26, 16.94, 2.94, 12.4, 4.73, 9.29)
      ..cubicTo(5.62, 7.74, 7.22, 6.76, 8.96, 6.74)
      ..cubicTo(10.25, 6.72, 11.49, 7.6, 12.28, 7.6)
      ..cubicTo(13.07, 7.6, 14.57, 6.54, 16.1, 6.71)
      ..cubicTo(16.74, 6.74, 18.55, 6.97, 19.68, 8.63)
      ..cubicTo(19.59, 8.69, 17.44, 9.94, 17.46, 12.55)
      ..cubicTo(17.49, 15.68, 20.2, 16.72, 20.24, 16.74)
      ..cubicTo(20.21, 16.83, 19.8, 18.26, 18.71, 19.5)
      ..close()
      ..moveTo(15.97, 4.54)
      ..cubicTo(16.64, 3.72, 17.09, 2.58, 16.96, 1.44)
      ..cubicTo(15.97, 1.48, 14.73, 2.1, 14.02, 2.93)
      ..cubicTo(13.39, 3.66, 12.85, 4.82, 13.0, 5.94)
      ..cubicTo(14.12, 6.03, 15.3, 5.37, 15.97, 4.54)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _AppleIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
