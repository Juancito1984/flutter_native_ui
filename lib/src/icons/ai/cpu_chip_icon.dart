import 'package:flutter/material.dart';

/// Icono vectorial de Microchip CPU / Procesador de IA.
class CpuChipIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const CpuChipIcon({
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
        painter: _CpuChipIconPainter(color: iconColor),
      ),
    );
  }
}

class _CpuChipIconPainter extends CustomPainter {
  final Color color;

  const _CpuChipIconPainter({required this.color});

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



    // Main Outer Body RRect
    final bodyRect = RRect.fromRectAndRadius(
      const Rect.fromLTRB(5.0, 5.0, 19.0, 19.0),
      const Radius.circular(3.0),
    );
    canvas.drawRRect(bodyRect, strokePaint);

    // Center Core Rect
    canvas.drawRect(const Rect.fromLTRB(9.0, 9.0, 15.0, 15.0), strokePaint);

    // Top Pins
    canvas.drawLine(const Offset(8.0, 2.0), const Offset(8.0, 5.0), strokePaint);
    canvas.drawLine(const Offset(12.0, 2.0), const Offset(12.0, 5.0), strokePaint);
    canvas.drawLine(const Offset(16.0, 2.0), const Offset(16.0, 5.0), strokePaint);

    // Bottom Pins
    canvas.drawLine(const Offset(8.0, 19.0), const Offset(8.0, 22.0), strokePaint);
    canvas.drawLine(const Offset(12.0, 19.0), const Offset(12.0, 22.0), strokePaint);
    canvas.drawLine(const Offset(16.0, 19.0), const Offset(16.0, 22.0), strokePaint);

    // Left Pins
    canvas.drawLine(const Offset(2.0, 8.0), const Offset(5.0, 8.0), strokePaint);
    canvas.drawLine(const Offset(2.0, 12.0), const Offset(5.0, 12.0), strokePaint);
    canvas.drawLine(const Offset(2.0, 16.0), const Offset(5.0, 16.0), strokePaint);

    // Right Pins
    canvas.drawLine(const Offset(19.0, 8.0), const Offset(22.0, 8.0), strokePaint);
    canvas.drawLine(const Offset(19.0, 12.0), const Offset(22.0, 12.0), strokePaint);
    canvas.drawLine(const Offset(19.0, 16.0), const Offset(22.0, 16.0), strokePaint);
  }

  @override
  bool shouldRepaint(covariant _CpuChipIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
