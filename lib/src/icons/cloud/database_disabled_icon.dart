import 'package:flutter/material.dart';

/// Icono vectorial moderno de Base de Datos Desactivada / Desconectada (Material 3).
class DatabaseDisabledIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? disabledColor;

  const DatabaseDisabledIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.disabledColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = color ?? theme.colorScheme.onSurfaceVariant;
    final alertColor = disabledColor ?? theme.colorScheme.error;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _DatabaseDisabledIconPainter(
          color: primaryColor,
          disabledColor: alertColor,
        ),
      ),
    );
  }
}

class _DatabaseDisabledIconPainter extends CustomPainter {
  final Color color;
  final Color disabledColor;

  const _DatabaseDisabledIconPainter({
    required this.color,
    required this.disabledColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final dbPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final alertPaint = Paint()
      ..color = disabledColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Top Cylinder Cap
    final topCap = Path()
      ..moveTo(4.0, 6.0)
      ..cubicTo(4.0, 3.8, 7.6, 2.5, 12.0, 2.5)
      ..cubicTo(16.4, 2.5, 20.0, 3.8, 20.0, 6.0)
      ..cubicTo(20.0, 8.2, 16.4, 9.5, 12.0, 9.5)
      ..cubicTo(7.6, 9.5, 4.0, 8.2, 4.0, 6.0);
    canvas.drawPath(topCap, dbPaint);

    // Middle Layer
    final midLayer = Path()
      ..moveTo(4.0, 6.0)
      ..lineTo(4.0, 12.0)
      ..cubicTo(4.0, 14.2, 7.6, 15.5, 12.0, 15.5)
      ..cubicTo(16.4, 15.5, 20.0, 14.2, 20.0, 12.0)
      ..lineTo(20.0, 6.0);
    canvas.drawPath(midLayer, dbPaint);

    // Bottom Layer
    final botLayer = Path()
      ..moveTo(4.0, 12.0)
      ..lineTo(4.0, 18.0)
      ..cubicTo(4.0, 20.2, 7.6, 21.5, 12.0, 21.5)
      ..cubicTo(16.4, 21.5, 20.0, 20.2, 20.0, 18.0)
      ..lineTo(20.0, 12.0);
    canvas.drawPath(botLayer, dbPaint);

    // Status Dot (OFF alert indicator)
    canvas.drawCircle(const Offset(16.5, 17.5), 1.2, Paint()..color = disabledColor);

    // Modern Diagonal Slash Line
    canvas.drawLine(const Offset(3.0, 3.0), const Offset(21.0, 21.0), alertPaint);
  }

  @override
  bool shouldRepaint(covariant _DatabaseDisabledIconPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.disabledColor != disabledColor;
}
