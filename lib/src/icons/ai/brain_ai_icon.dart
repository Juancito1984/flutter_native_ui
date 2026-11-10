import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Cerebro / IA / Redes Neuronales.
class BrainAiIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const BrainAiIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : theme.colorScheme.secondary);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BrainAiIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _BrainAiIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _BrainAiIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final mainPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final accentStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final accentFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Left hemisphere
    final leftPath = Path()
      ..moveTo(12.0, 5.0)
      ..cubicTo(9.0, 3.0, 5.0, 4.0, 4.0, 7.5)
      ..cubicTo(2.5, 9.0, 2.5, 12.0, 4.0, 13.5)
      ..cubicTo(3.0, 15.5, 4.0, 18.5, 6.5, 19.5)
      ..cubicTo(9.0, 20.5, 11.0, 19.0, 12.0, 17.5);
    canvas.drawPath(leftPath, mainPaint);

    // Right hemisphere
    final rightPath = Path()
      ..moveTo(12.0, 5.0)
      ..cubicTo(15.0, 3.0, 19.0, 4.0, 20.0, 7.5)
      ..cubicTo(21.5, 9.0, 21.5, 12.0, 20.0, 13.5)
      ..cubicTo(21.0, 15.5, 20.0, 18.5, 17.5, 19.5)
      ..cubicTo(15.0, 20.5, 13.0, 19.0, 12.0, 17.5);
    canvas.drawPath(rightPath, mainPaint);

    // Neural nodes
    canvas.drawCircle(const Offset(12.0, 7.0), 1.3, accentFill);
    canvas.drawCircle(const Offset(8.0, 11.0), 1.3, accentFill);
    canvas.drawCircle(const Offset(16.0, 11.0), 1.3, accentFill);
    canvas.drawCircle(const Offset(12.0, 15.0), 1.3, accentFill);

    // Neural connections
    canvas.drawLine(const Offset(12.0, 7.0), const Offset(8.0, 11.0), accentStroke);
    canvas.drawLine(const Offset(12.0, 7.0), const Offset(16.0, 11.0), accentStroke);
    canvas.drawLine(const Offset(8.0, 11.0), const Offset(12.0, 15.0), accentStroke);
    canvas.drawLine(const Offset(16.0, 11.0), const Offset(12.0, 15.0), accentStroke);
  }

  @override
  bool shouldRepaint(covariant _BrainAiIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
