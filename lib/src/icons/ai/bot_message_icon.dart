import 'package:flutter/material.dart';

/// Icono vectorial de Cabeza de Bot / Chatbot IA.
class BotMessageIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const BotMessageIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BotMessageIconPainter(color: iconColor),
      ),
    );
  }
}

class _BotMessageIconPainter extends CustomPainter {
  final Color color;

  const _BotMessageIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Antenna
    canvas.drawLine(const Offset(12.0, 2.0), const Offset(12.0, 5.0), strokePaint);
    canvas.drawCircle(const Offset(12.0, 2.0), 1.2, fillPaint);

    // Head RRect
    final headRect = RRect.fromRectAndRadius(
      const Rect.fromLTRB(4.0, 5.0, 20.0, 17.0),
      const Radius.circular(5.0),
    );
    canvas.drawRRect(headRect, strokePaint);

    // Eyes
    canvas.drawCircle(const Offset(8.5, 10.5), 1.6, fillPaint);
    canvas.drawCircle(const Offset(15.5, 10.5), 1.6, fillPaint);

    // Mouth / Line
    final mouthPath = Path()
      ..moveTo(9.0, 14.0)
      ..lineTo(15.0, 14.0);
    canvas.drawPath(mouthPath, strokePaint);

    // Ears / Side Knobs
    canvas.drawRect(const Rect.fromLTRB(2.0, 9.0, 4.0, 13.0), fillPaint);
    canvas.drawRect(const Rect.fromLTRB(20.0, 9.0, 22.0, 13.0), fillPaint);
  }

  @override
  bool shouldRepaint(covariant _BotMessageIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
