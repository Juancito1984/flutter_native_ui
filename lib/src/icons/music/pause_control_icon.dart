import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de botón de pausa.
class PauseControlIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const PauseControlIcon({
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
        painter: _PauseControlPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _PauseControlPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _PauseControlPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bar1Paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bar2Paint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bar1 = RRect.fromRectAndRadius(const Rect.fromLTWH(5, 4, 4, 16), const Radius.circular(1.5));
    final bar2 = RRect.fromRectAndRadius(const Rect.fromLTWH(15, 4, 4, 16), const Radius.circular(1.5));

    canvas.drawRRect(bar1, bar1Paint);
    canvas.drawRRect(bar2, bar2Paint);
  }

  @override
  bool shouldRepaint(covariant _PauseControlPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
