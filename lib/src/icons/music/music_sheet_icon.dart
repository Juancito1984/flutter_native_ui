import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de partitura y notas musicales.
class MusicSheetIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const MusicSheetIcon({
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
        painter: _MusicSheetPainter(
          primaryColor: primary,
          accentColor: magentaAccent,
        ),
      ),
    );
  }
}

class _MusicSheetPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _MusicSheetPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final linePaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final notePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final stemPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..isAntiAlias = true;

    // Staff lines (Partitura 5 líneas)
    canvas.drawLine(const Offset(3, 6), const Offset(21, 6), linePaint);
    canvas.drawLine(const Offset(3, 9), const Offset(21, 9), linePaint);
    canvas.drawLine(const Offset(3, 12), const Offset(21, 12), linePaint);
    canvas.drawLine(const Offset(3, 15), const Offset(21, 15), linePaint);
    canvas.drawLine(const Offset(3, 18), const Offset(21, 18), linePaint);

    // Eighth Note 1 (Vibrant Magenta Accent)
    canvas.drawCircle(const Offset(8, 16.5), 2.2, notePaint);
    canvas.drawLine(const Offset(10, 16.5), const Offset(10, 8), stemPaint);

    // Eighth Note 2
    canvas.drawCircle(const Offset(16, 13.5), 2.2, notePaint);
    canvas.drawLine(const Offset(18, 13.5), const Offset(18, 5), stemPaint);

    // Beam connecting the 2 notes
    final beamPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..isAntiAlias = true;
    canvas.drawLine(const Offset(10, 8), const Offset(18, 5), beamPaint);
  }

  @override
  bool shouldRepaint(covariant _MusicSheetPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
