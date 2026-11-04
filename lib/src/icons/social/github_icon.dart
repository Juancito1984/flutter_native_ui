import 'package:flutter/material.dart';

/// Icono vectorial de GitHub.
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
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _GitHubIconPainter(color: iconColor),
      ),
    );
  }
}

class _GitHubIconPainter extends CustomPainter {
  final Color color;

  const _GitHubIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(12.0, 2.0)
      ..cubicTo(6.48, 2.0, 2.0, 6.48, 2.0, 12.0)
      ..cubicTo(2.0, 16.42, 4.87, 20.17, 8.84, 21.5)
      ..cubicTo(9.34, 21.58, 9.52, 21.27, 9.52, 21.0)
      ..cubicTo(9.52, 20.77, 9.51, 20.14, 9.51, 19.31)
      ..cubicTo(6.73, 19.91, 6.14, 17.97, 6.14, 17.97)
      ..cubicTo(5.68, 16.81, 5.03, 16.5, 5.03, 16.5)
      ..cubicTo(4.12, 15.88, 5.1, 15.9, 5.1, 15.9)
      ..cubicTo(6.1, 15.97, 6.63, 16.93, 6.63, 16.93)
      ..cubicTo(7.52, 18.45, 8.97, 18.0, 9.54, 17.75)
      ..cubicTo(9.63, 17.11, 9.89, 16.67, 10.17, 16.42)
      ..cubicTo(7.95, 16.17, 5.62, 15.31, 5.62, 11.5)
      ..cubicTo(5.62, 10.39, 6.0, 9.5, 6.65, 8.79)
      ..cubicTo(6.55, 8.54, 6.2, 7.5, 6.75, 6.15)
      ..cubicTo(6.75, 6.15, 7.59, 5.88, 9.5, 7.17)
      ..cubicTo(10.29, 6.95, 11.15, 6.84, 12.0, 6.84)
      ..cubicTo(12.85, 6.84, 13.71, 6.95, 14.5, 7.17)
      ..cubicTo(16.41, 5.88, 17.25, 6.15, 17.25, 6.15)
      ..cubicTo(17.8, 7.5, 17.45, 8.54, 17.35, 8.79)
      ..cubicTo(18.0, 9.5, 18.38, 10.39, 18.38, 11.5)
      ..cubicTo(18.38, 15.32, 16.04, 16.16, 13.81, 16.41)
      ..cubicTo(14.17, 16.72, 14.49, 17.33, 14.49, 18.26)
      ..cubicTo(14.49, 19.6, 14.48, 20.68, 14.48, 21.0)
      ..cubicTo(14.48, 21.27, 14.66, 21.59, 15.17, 21.5)
      ..cubicTo(19.14, 20.16, 22.0, 16.42, 22.0, 12.0)
      ..cubicTo(22.0, 6.48, 17.52, 2.0, 12.0, 2.0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _GitHubIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
