import 'package:flutter/material.dart';

/// Icono vectorial de jugador de fútbol pateando un balón.
class SoccerPlayerIcon extends StatelessWidget {
  final double size;
  final Color jerseyColor;
  final Color ballColor;

  const SoccerPlayerIcon({
    super.key,
    this.size = 24.0,
    this.jerseyColor = const Color(0xFF1976D2),
    this.ballColor = const Color(0xFF263238),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SoccerPlayerPainter(
          jerseyColor: jerseyColor,
          ballColor: ballColor,
        ),
      ),
    );
  }
}

class _SoccerPlayerPainter extends CustomPainter {
  final Color jerseyColor;
  final Color ballColor;

  const _SoccerPlayerPainter({
    required this.jerseyColor,
    required this.ballColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final jerseyPaint = Paint()
      ..color = jerseyColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final skinPaint = Paint()
      ..color = const Color(0xFFFFCC80)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final limbPaint = Paint()
      ..color = const Color(0xFF37474F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final ballPaint = Paint()
      ..color = ballColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Head
    canvas.drawCircle(const Offset(10, 4.5), 2.5, skinPaint);

    // Torso (Jersey)
    final torsoPath = Path()
      ..moveTo(8, 7)
      ..lineTo(12, 7)
      ..lineTo(11, 13)
      ..lineTo(7, 13)
      ..close();
    canvas.drawPath(torsoPath, jerseyPaint);

    // Arms
    canvas.drawLine(const Offset(8, 8), const Offset(5, 11), limbPaint);
    canvas.drawLine(const Offset(12, 8), const Offset(15, 10), limbPaint);

    // Standing Leg
    canvas.drawLine(const Offset(8.5, 13), const Offset(6.5, 20), limbPaint);

    // Kicking Leg
    canvas.drawLine(const Offset(10, 13), const Offset(16, 17), limbPaint);

    // Ball
    canvas.drawCircle(const Offset(19.5, 18), 2.2, ballPaint);
  }

  @override
  bool shouldRepaint(covariant _SoccerPlayerPainter oldDelegate) =>
      oldDelegate.jerseyColor != jerseyColor || oldDelegate.ballColor != ballColor;
}
