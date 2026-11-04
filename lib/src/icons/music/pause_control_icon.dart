// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Icono vectorial de botón Pause/Pausar para música.
class PauseControlIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PauseControlIcon({
    super.key,
    this.size = 24.0,
    this.color = const Color(0xFFFF9800),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _PauseControlPainter(color: color),
      ),
    );
  }
}

class _PauseControlPainter extends CustomPainter {
  final Color color;

  const _PauseControlPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = color.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(12, 12), 11, bgPaint);

    final pausePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bar1 = RRect.fromLTRBR(8, 7.5, 10.5, 16.5, const Radius.circular(1));
    final bar2 = RRect.fromLTRBR(13.5, 7.5, 16, 16.5, const Radius.circular(1));

    canvas.drawRRect(bar1, pausePaint);
    canvas.drawRRect(bar2, pausePaint);
  }

  @override
  bool shouldRepaint(covariant _PauseControlPainter oldDelegate) =>
      oldDelegate.color != color;
}
