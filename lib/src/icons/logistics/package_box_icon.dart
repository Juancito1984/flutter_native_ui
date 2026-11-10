import 'package:flutter/material.dart';

/// Icono vectorial de Paquete / Caja de Envío.
class PackageBoxIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const PackageBoxIcon({
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
        painter: _PackageBoxIconPainter(color: iconColor),
      ),
    );
  }
}

class _PackageBoxIconPainter extends CustomPainter {
  final Color color;

  const _PackageBoxIconPainter({required this.color});

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

    // Cube Outer Outline
    final outerPath = Path()
      ..moveTo(12.0, 3.0)
      ..lineTo(21.0, 7.5)
      ..lineTo(21.0, 16.5)
      ..lineTo(12.0, 21.0)
      ..lineTo(3.0, 16.5)
      ..lineTo(3.0, 7.5)
      ..close();
    canvas.drawPath(outerPath, strokePaint);

    // Inner Cube Seams
    canvas.drawLine(const Offset(12.0, 3.0), const Offset(12.0, 12.0), strokePaint);
    canvas.drawLine(const Offset(12.0, 12.0), const Offset(21.0, 7.5), strokePaint);
    canvas.drawLine(const Offset(12.0, 12.0), const Offset(3.0, 7.5), strokePaint);
    canvas.drawLine(const Offset(12.0, 12.0), const Offset(12.0, 21.0), strokePaint);
  }

  @override
  bool shouldRepaint(covariant _PackageBoxIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
