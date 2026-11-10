import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de botón de detención.
class StopControlIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const StopControlIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFE53935));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _StopControlPainter(color: primary),
      ),
    );
  }
}

class _StopControlPainter extends CustomPainter {
  final Color color;

  const _StopControlPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final stopPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final stopRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(5, 5, 14, 14),
      const Radius.circular(2.5),
    );
    canvas.drawRRect(stopRect, stopPaint);
  }

  @override
  bool shouldRepaint(covariant _StopControlPainter oldDelegate) =>
      oldDelegate.color != color;
}
