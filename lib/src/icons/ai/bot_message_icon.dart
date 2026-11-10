import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Cabeza de Bot / Chatbot IA.
class BotMessageIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const BotMessageIcon({
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
        painter: _BotMessageIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _BotMessageIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _BotMessageIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final mainStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final accentFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final accentStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Antenna
    canvas.drawLine(const Offset(12.0, 2.0), const Offset(12.0, 5.0), mainStroke);
    canvas.drawCircle(const Offset(12.0, 2.0), 1.5, accentFill);

    // Head RRect Body
    final headRect = RRect.fromRectAndRadius(
      const Rect.fromLTRB(4.0, 5.0, 20.0, 17.0),
      const Radius.circular(5.0),
    );
    canvas.drawRRect(headRect, mainStroke);

    // Eyes
    canvas.drawCircle(const Offset(8.5, 10.5), 1.6, accentFill);
    canvas.drawCircle(const Offset(15.5, 10.5), 1.6, accentFill);

    // Mouth / Line
    final mouthPath = Path()
      ..moveTo(9.0, 14.0)
      ..lineTo(15.0, 14.0);
    canvas.drawPath(mouthPath, accentStroke);

    // Ears / Side Knobs
    canvas.drawRect(const Rect.fromLTRB(2.0, 9.0, 4.0, 13.0), accentFill);
    canvas.drawRect(const Rect.fromLTRB(20.0, 9.0, 22.0, 13.0), accentFill);
  }

  @override
  bool shouldRepaint(covariant _BotMessageIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
