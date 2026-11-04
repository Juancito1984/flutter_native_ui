import 'package:flutter/material.dart';

/// Icono vectorial de Escudo Verificado / Seguridad.
class ShieldCheckIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ShieldCheckIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? const Color(0xFF2E7D32);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ShieldCheckIconPainter(color: iconColor),
      ),
    );
  }
}

class _ShieldCheckIconPainter extends CustomPainter {
  final Color color;

  const _ShieldCheckIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final shieldPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final shieldPath = Path()
      ..moveTo(12.0, 2.0)
      ..lineTo(20.0, 5.0)
      ..cubicTo(20.0, 12.5, 16.5, 18.5, 12.0, 22.0)
      ..cubicTo(7.5, 18.5, 4.0, 12.5, 4.0, 5.0)
      ..close();
    canvas.drawPath(shieldPath, shieldPaint);

    final checkPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final checkPath = Path()
      ..moveTo(8.5, 11.5)
      ..lineTo(11.0, 14.0)
      ..lineTo(15.5, 9.5);
    canvas.drawPath(checkPath, checkPaint);
  }

  @override
  bool shouldRepaint(covariant _ShieldCheckIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
