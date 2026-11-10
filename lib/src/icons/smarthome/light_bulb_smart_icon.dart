import 'package:flutter/material.dart';

/// Icono vectorial de Ampolleta / Foco Domótico Inteligente.
class LightBulbSmartIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const LightBulbSmartIcon({
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
        painter: _LightBulbSmartIconPainter(color: iconColor),
      ),
    );
  }
}

class _LightBulbSmartIconPainter extends CustomPainter {
  final Color color;

  const _LightBulbSmartIconPainter({required this.color});

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

    // Bulb Outline
    final bulbPath = Path()
      ..moveTo(9.0, 18.0)
      ..lineTo(15.0, 18.0)
      ..lineTo(15.0, 16.0)
      ..cubicTo(18.0, 14.0, 19.5, 10.0, 17.5, 6.5)
      ..cubicTo(15.5, 3.0, 10.5, 3.0, 8.5, 6.5)
      ..cubicTo(6.5, 10.0, 8.0, 14.0, 9.0, 16.0)
      ..close();
    canvas.drawPath(bulbPath, strokePaint);

    // Base Lines
    canvas.drawLine(const Offset(10.0, 20.0), const Offset(14.0, 20.0), strokePaint);

    // Wi-Fi Waves Inside Filament
    canvas.drawArc(const Rect.fromLTRB(10.0, 9.0, 14.0, 13.0), -2.8, 2.4, false, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _LightBulbSmartIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
