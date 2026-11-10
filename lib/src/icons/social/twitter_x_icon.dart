import 'package:flutter/material.dart';

/// Icono vectorial oficial de X / Twitter.
class TwitterXIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const TwitterXIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = color ?? Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TwitterXPainter(color: activeColor),
      ),
    );
  }
}

class _TwitterXPainter extends CustomPainter {
  final Color color;

  const _TwitterXPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final xPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(18.24, 2.25)
      ..lineTo(21.55, 2.25)
      ..lineTo(14.32, 10.51)
      ..lineTo(22.82, 21.75)
      ..lineTo(16.16, 21.75)
      ..lineTo(10.94, 14.93)
      ..lineTo(4.97, 21.75)
      ..lineTo(1.66, 21.75)
      ..lineTo(9.39, 12.91)
      ..lineTo(1.23, 2.25)
      ..lineTo(8.06, 2.25)
      ..lineTo(12.78, 8.49)
      ..close();

    canvas.drawPath(path, xPaint);
  }

  @override
  bool shouldRepaint(covariant _TwitterXPainter oldDelegate) =>
      oldDelegate.color != color;
}
