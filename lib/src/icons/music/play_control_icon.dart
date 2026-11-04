// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Icono vectorial de botón Play/Reproducir para música.
class PlayControlIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PlayControlIcon({
    super.key,
    this.size = 24.0,
    this.color = const Color(0xFF4CAF50),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _PlayControlPainter(color: color),
      ),
    );
  }
}

class _PlayControlPainter extends CustomPainter {
  final Color color;

  const _PlayControlPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = color.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(12, 12), 11, bgPaint);

    final playPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final playPath = Path()
      ..moveTo(9.5, 7.5)
      ..lineTo(17.5, 12)
      ..lineTo(9.5, 16.5)
      ..close();
    canvas.drawPath(playPath, playPaint);
  }

  @override
  bool shouldRepaint(covariant _PlayControlPainter oldDelegate) =>
      oldDelegate.color != color;
}
