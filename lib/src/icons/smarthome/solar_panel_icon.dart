import 'package:flutter/material.dart';

/// Icono vectorial de Panel Solar / Energía Renovable.
class SolarPanelIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const SolarPanelIcon({
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
        painter: _SolarPanelIconPainter(color: iconColor),
      ),
    );
  }
}

class _SolarPanelIconPainter extends CustomPainter {
  final Color color;

  const _SolarPanelIconPainter({required this.color});

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

    // Panel Outer Polygon
    final panelPath = Path()
      ..moveTo(6.0, 7.0)
      ..lineTo(18.0, 7.0)
      ..lineTo(21.0, 18.0)
      ..lineTo(3.0, 18.0)
      ..close();
    canvas.drawPath(panelPath, strokePaint);

    // Grid lines
    canvas.drawLine(const Offset(12.0, 7.0), const Offset(12.0, 18.0), strokePaint);
    canvas.drawLine(const Offset(4.5, 12.5), const Offset(19.5, 12.5), strokePaint);

    // Support Stand
    canvas.drawLine(const Offset(12.0, 18.0), const Offset(12.0, 22.0), strokePaint);
    canvas.drawLine(const Offset(8.0, 22.0), const Offset(16.0, 22.0), strokePaint);
  }

  @override
  bool shouldRepaint(covariant _SolarPanelIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
