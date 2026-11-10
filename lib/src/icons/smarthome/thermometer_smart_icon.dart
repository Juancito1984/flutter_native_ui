import 'package:flutter/material.dart';

/// Icono vectorial de Termostato Digital / Inteligente.
class ThermometerSmartIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ThermometerSmartIcon({
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
        painter: _ThermometerSmartIconPainter(color: iconColor),
      ),
    );
  }
}

class _ThermometerSmartIconPainter extends CustomPainter {
  final Color color;

  const _ThermometerSmartIconPainter({required this.color});

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

    // Thermometer Body
    final thermoPath = Path()
      ..moveTo(10.0, 14.2)
      ..cubicTo(8.5, 15.2, 8.0, 17.5, 9.0, 19.2)
      ..cubicTo(10.0, 21.0, 12.5, 21.5, 14.2, 20.2)
      ..cubicTo(15.5, 19.2, 15.5, 17.0, 14.0, 14.2)
      ..lineTo(14.0, 5.0)
      ..cubicTo(14.0, 3.3, 10.0, 3.3, 10.0, 5.0)
      ..close();
    canvas.drawPath(thermoPath, strokePaint);

    // Liquid bulb
    canvas.drawCircle(const Offset(12.0, 17.5), 2.0, fillPaint);
    canvas.drawLine(const Offset(12.0, 17.5), const Offset(12.0, 9.0), strokePaint..strokeWidth = 2.0);
  }

  @override
  bool shouldRepaint(covariant _ThermometerSmartIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
