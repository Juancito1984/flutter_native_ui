import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de botón de reproducción.
class PlayControlIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const PlayControlIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _PlayControlPainter(color: primary),
      ),
    );
  }
}

class _PlayControlPainter extends CustomPainter {
  final Color color;

  const _PlayControlPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final playPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final playPath = Path()
      ..moveTo(6, 4)
      ..lineTo(19, 12)
      ..lineTo(6, 20)
      ..close();
    canvas.drawPath(playPath, playPaint);
  }

  @override
  bool shouldRepaint(covariant _PlayControlPainter oldDelegate) =>
      oldDelegate.color != color;
}
