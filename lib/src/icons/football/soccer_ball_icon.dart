import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Icono vectorial de balón de fútbol tradicional.
class SoccerBallIcon extends StatelessWidget {
  final double size;
  final Color ballColor;
  final Color patchColor;

  const SoccerBallIcon({
    super.key,
    this.size = 24.0,
    this.ballColor = const Color(0xFFECEFF1),
    this.patchColor = const Color(0xFF263238),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SoccerBallPainter(
          ballColor: ballColor,
          patchColor: patchColor,
        ),
      ),
    );
  }
}

class _SoccerBallPainter extends CustomPainter {
  final Color ballColor;
  final Color patchColor;

  const _SoccerBallPainter({
    required this.ballColor,
    required this.patchColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final ballPaint = Paint()
      ..color = ballColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final patchPaint = Paint()
      ..color = patchColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = patchColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    // Main ball circle
    canvas.drawCircle(const Offset(12, 12), 10, ballPaint);
    canvas.drawCircle(const Offset(12, 12), 10, borderPaint);

    // Center Pentagon
    Path createPentagon(double cx, double cy, double radius) {
      final path = Path();
      for (int i = 0; i < 5; i++) {
        final angle = (i * 72 - 90) * math.pi / 180;
        final x = cx + radius * math.cos(angle);
        final y = cy + radius * math.sin(angle);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      return path;
    }

    // Center patch
    canvas.drawPath(createPentagon(12, 12, 3.8), patchPaint);

    // Outer connecting lines
    final linePaint = Paint()
      ..color = patchColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8
      ..isAntiAlias = true;

    for (int i = 0; i < 5; i++) {
      final angle = (i * 72 - 90) * math.pi / 180;
      final x1 = 12 + 3.8 * math.cos(angle);
      final y1 = 12 + 3.8 * math.sin(angle);
      final x2 = 12 + 9.8 * math.cos(angle);
      final y2 = 12 + 9.8 * math.sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SoccerBallPainter oldDelegate) =>
      oldDelegate.ballColor != ballColor || oldDelegate.patchColor != patchColor;
}
