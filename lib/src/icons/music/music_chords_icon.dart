import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de acordes y notas musicales.
class MusicChordsIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const MusicChordsIcon({
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
    final magentaAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFE91E63));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _MusicChordsPainter(
          primaryColor: primary,
          accentColor: magentaAccent,
        ),
      ),
    );
  }
}

class _MusicChordsPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _MusicChordsPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final notePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final stemPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    final beamPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..isAntiAlias = true;

    // Double Eighth Note
    canvas.drawCircle(const Offset(6, 17), 2.5, notePaint);
    canvas.drawCircle(const Offset(17, 14), 2.5, notePaint);

    canvas.drawLine(const Offset(8.5, 17), const Offset(8.5, 7), stemPaint);
    canvas.drawLine(const Offset(19.5, 14), const Offset(19.5, 4), stemPaint);

    // Beam connecting the 2 notes (Vibrant Magenta Accent)
    canvas.drawLine(const Offset(8.5, 7), const Offset(19.5, 4), beamPaint);
  }

  @override
  bool shouldRepaint(covariant _MusicChordsPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
