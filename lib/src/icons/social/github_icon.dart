import 'package:flutter/material.dart';

/// Icono vectorial oficial de GitHub (Octocat).
class GitHubIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const GitHubIcon({
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
        painter: _GitHubPainter(color: activeColor),
      ),
    );
  }
}

class _GitHubPainter extends CustomPainter {
  final Color color;

  const _GitHubPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final catPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(12, 2)
      ..cubicTo(6.48, 2, 2, 6.48, 2, 12)
      ..cubicTo(2, 16.42, 4.87, 20.17, 8.84, 21.5)
      ..cubicTo(9.34, 21.58, 9.5, 21.27, 9.5, 21.0)
      ..cubicTo(9.5, 20.77, 9.5, 20.0, 9.5, 19.14)
      ..cubicTo(6.73, 19.74, 6.14, 17.81, 6.14, 17.81)
      ..cubicTo(5.68, 16.66, 5.03, 16.36, 5.03, 16.36)
      ..cubicTo(4.13, 15.74, 5.1, 15.76, 5.1, 15.76)
      ..cubicTo(6.1, 15.83, 6.62, 16.78, 6.62, 16.78)
      ..cubicTo(7.5, 18.3, 8.94, 17.86, 9.5, 17.61)
      ..cubicTo(9.59, 16.97, 9.84, 16.54, 10.12, 16.29)
      ..cubicTo(7.91, 16.04, 5.58, 15.19, 5.58, 11.37)
      ..cubicTo(5.58, 10.28, 5.97, 9.39, 6.61, 8.69)
      ..cubicTo(6.5, 8.44, 6.16, 7.42, 6.71, 6.06)
      ..cubicTo(6.71, 6.06, 7.55, 5.79, 9.46, 7.08)
      ..cubicTo(10.26, 6.86, 11.11, 6.75, 11.96, 6.75)
      ..cubicTo(12.81, 6.75, 13.66, 6.86, 14.46, 7.08)
      ..cubicTo(16.37, 5.79, 17.21, 6.06, 17.21, 6.06)
      ..cubicTo(17.76, 7.42, 17.42, 8.44, 17.31, 8.69)
      ..cubicTo(17.95, 9.39, 18.34, 10.28, 18.34, 11.37)
      ..cubicTo(18.34, 15.2, 16.01, 16.04, 13.79, 16.28)
      ..cubicTo(14.15, 16.59, 14.47, 17.2, 14.47, 18.13)
      ..cubicTo(14.47, 19.47, 14.46, 20.55, 14.46, 20.89)
      ..cubicTo(14.46, 21.16, 14.62, 21.48, 15.13, 21.38)
      ..cubicTo(19.1, 20.05, 22, 16.36, 22, 11.96)
      ..cubicTo(22, 6.48, 17.52, 2, 12, 2)
      ..close();

    canvas.drawPath(path, catPaint);
  }

  @override
  bool shouldRepaint(covariant _GitHubPainter oldDelegate) =>
      oldDelegate.color != color;
}
