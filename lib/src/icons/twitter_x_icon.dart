import 'package:flutter/material.dart';

/// Icono vectorial de X / Twitter.
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
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TwitterXIconPainter(color: iconColor),
      ),
    );
  }
}

class _TwitterXIconPainter extends CustomPainter {
  final Color color;

  const _TwitterXIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(18.244, 2.25)
      ..lineTo(21.552, 2.25)
      ..lineTo(14.325, 10.51)
      ..lineTo(22.827, 21.75)
      ..lineTo(16.17, 21.75)
      ..lineTo(10.956, 14.933)
      ..lineTo(4.99, 21.75)
      ..lineTo(1.68, 21.75)
      ..lineTo(9.41, 12.915)
      ..lineTo(1.254, 2.25)
      ..lineTo(8.08, 2.25)
      ..lineTo(12.797, 8.486)
      ..close()
      ..moveTo(17.087, 19.77)
      ..lineTo(18.92, 19.77)
      ..lineTo(7.084, 4.13)
      ..lineTo(5.117, 4.13)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TwitterXIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
