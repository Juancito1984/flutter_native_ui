import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Reconocimiento Facial / Face ID.
class FaceIdIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const FaceIdIcon({
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
        painter: _FaceIdIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _FaceIdIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _FaceIdIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bracketPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final facePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Top Left Corner
    final tl = Path()..moveTo(3.0, 7.0)..lineTo(3.0, 4.0)..lineTo(7.0, 4.0);
    canvas.drawPath(tl, bracketPaint);

    // Top Right Corner
    final tr = Path()..moveTo(17.0, 4.0)..lineTo(21.0, 4.0)..lineTo(21.0, 7.0);
    canvas.drawPath(tr, bracketPaint);

    // Bottom Left Corner
    final bl = Path()..moveTo(3.0, 17.0)..lineTo(3.0, 20.0)..lineTo(7.0, 20.0);
    canvas.drawPath(bl, bracketPaint);

    // Bottom Right Corner
    final br = Path()..moveTo(17.0, 20.0)..lineTo(21.0, 20.0)..lineTo(21.0, 17.0);
    canvas.drawPath(br, bracketPaint);

    // Eyes
    canvas.drawLine(const Offset(8.0, 9.0), const Offset(8.0, 11.0), facePaint);
    canvas.drawLine(const Offset(16.0, 9.0), const Offset(16.0, 11.0), facePaint);

    // Nose
    final nose = Path()..moveTo(12.0, 10.0)..lineTo(12.0, 13.0)..lineTo(10.5, 13.0);
    canvas.drawPath(nose, facePaint);

    // Smile
    final smile = Path()
      ..moveTo(8.5, 16.0)
      ..cubicTo(10.0, 17.5, 14.0, 17.5, 15.5, 16.0);
    canvas.drawPath(smile, facePaint);
  }

  @override
  bool shouldRepaint(covariant _FaceIdIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
