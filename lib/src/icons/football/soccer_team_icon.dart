import 'package:flutter/material.dart';

/// Icono vectorial de equipo/plantilla de jugadores de fútbol.
class SoccerTeamIcon extends StatelessWidget {
  final double size;
  final Color teamColor;

  const SoccerTeamIcon({
    super.key,
    this.size = 24.0,
    this.teamColor = const Color(0xFF388E3C),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SoccerTeamPainter(teamColor: teamColor),
      ),
    );
  }
}

class _SoccerTeamPainter extends CustomPainter {
  final Color teamColor;

  const _SoccerTeamPainter({required this.teamColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final skinPaint = Paint()
      ..color = const Color(0xFFFFCC80)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final jerseyPaint = Paint()
      ..color = teamColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Background Player Left
    canvas.drawCircle(const Offset(6.5, 8.5), 2.2, skinPaint);
    final leftBody = Path()
      ..moveTo(2.5, 18)
      ..cubicTo(2.5, 13.5, 4.5, 12, 6.5, 12)
      ..cubicTo(8.5, 12, 10.5, 13.5, 10.5, 18)
      ..close();
    canvas.drawPath(leftBody, jerseyPaint);

    // Background Player Right
    canvas.drawCircle(const Offset(17.5, 8.5), 2.2, skinPaint);
    final rightBody = Path()
      ..moveTo(13.5, 18)
      ..cubicTo(13.5, 13.5, 15.5, 12, 17.5, 12)
      ..cubicTo(19.5, 12, 21.5, 13.5, 21.5, 18)
      ..close();
    canvas.drawPath(rightBody, jerseyPaint);

    // Foreground Captain Center
    canvas.drawCircle(const Offset(12, 6.5), 2.8, skinPaint);
    final centerBody = Path()
      ..moveTo(7, 21)
      ..cubicTo(7, 14.5, 9.5, 10.5, 12, 10.5)
      ..cubicTo(14.5, 10.5, 17, 14.5, 17, 21)
      ..close();
    canvas.drawPath(centerBody, jerseyPaint);

    // Mini soccer ball in front
    final ballPaint = Paint()..color = const Color(0xFF263238);
    canvas.drawCircle(const Offset(12, 19.5), 1.8, ballPaint);
  }

  @override
  bool shouldRepaint(covariant _SoccerTeamPainter oldDelegate) =>
      oldDelegate.teamColor != teamColor;
}
