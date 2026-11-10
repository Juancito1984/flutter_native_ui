import 'package:flutter/material.dart';

/// Icono vectorial de Mancuerna / Pesas de Gimnasio.
class DumbbellIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const DumbbellIcon({
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
        painter: _DumbbellIconPainter(color: iconColor),
      ),
    );
  }
}

class _DumbbellIconPainter extends CustomPainter {
  final Color color;

  const _DumbbellIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Handle Line
    canvas.drawLine(const Offset(7.0, 12.0), const Offset(17.0, 12.0), strokePaint..strokeWidth = 2.5);

    // Left Weights
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTRB(2.0, 7.0, 5.0, 17.0), const Radius.circular(1.5)), fillPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTRB(5.0, 9.0, 7.0, 15.0), const Radius.circular(1.0)), fillPaint);

    // Right Weights
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTRB(19.0, 7.0, 22.0, 17.0), const Radius.circular(1.5)), fillPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTRB(17.0, 9.0, 19.0, 15.0), const Radius.circular(1.0)), fillPaint);
  }

  @override
  bool shouldRepaint(covariant _DumbbellIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
