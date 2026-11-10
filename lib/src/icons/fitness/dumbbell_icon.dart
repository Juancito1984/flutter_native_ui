import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Mancuerna / Pesas de Gimnasio.
class DumbbellIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const DumbbellIcon({
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
        painter: _DumbbellIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _DumbbellIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _DumbbellIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final handlePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final weightFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Handle Line
    canvas.drawLine(const Offset(7.0, 12.0), const Offset(17.0, 12.0), handlePaint);

    // Left Weights (Vibrant Accent Fill)
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTRB(2.0, 7.0, 5.0, 17.0), const Radius.circular(1.5)), weightFill);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTRB(5.0, 9.0, 7.0, 15.0), const Radius.circular(1.0)), weightFill);

    // Right Weights (Vibrant Accent Fill)
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTRB(19.0, 7.0, 22.0, 17.0), const Radius.circular(1.5)), weightFill);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTRB(17.0, 9.0, 19.0, 15.0), const Radius.circular(1.0)), weightFill);
  }

  @override
  bool shouldRepaint(covariant _DumbbellIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
