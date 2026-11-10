import 'package:flutter/material.dart';

/// Icono vectorial de Trofeo / Copa de Victoria.
class TrophyAwardIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const TrophyAwardIcon({
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
        painter: _TrophyAwardIconPainter(color: iconColor),
      ),
    );
  }
}

class _TrophyAwardIconPainter extends CustomPainter {
  final Color color;

  const _TrophyAwardIconPainter({required this.color});

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

    // Trophy Cup
    final cupPath = Path()
      ..moveTo(6.0, 4.0)
      ..lineTo(18.0, 4.0)
      ..lineTo(17.0, 11.0)
      ..cubicTo(16.0, 14.0, 14.0, 15.5, 12.0, 15.5)
      ..cubicTo(10.0, 15.5, 8.0, 14.0, 7.0, 11.0)
      ..close();
    canvas.drawPath(cupPath, strokePaint);

    // Left Handle
    final leftHandle = Path()..moveTo(6.0, 6.0)..cubicTo(3.0, 6.0, 3.0, 11.0, 7.0, 11.0);
    canvas.drawPath(leftHandle, strokePaint);

    // Right Handle
    final rightHandle = Path()..moveTo(18.0, 6.0)..cubicTo(21.0, 6.0, 21.0, 11.0, 17.0, 11.0);
    canvas.drawPath(rightHandle, strokePaint);

    // Stem & Base
    canvas.drawLine(const Offset(12.0, 15.5), const Offset(12.0, 19.0), strokePaint);
    canvas.drawLine(const Offset(8.0, 19.0), const Offset(16.0, 19.0), strokePaint);
    canvas.drawRect(const Rect.fromLTRB(7.0, 19.0, 17.0, 21.0), strokePaint);
  }

  @override
  bool shouldRepaint(covariant _TrophyAwardIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
