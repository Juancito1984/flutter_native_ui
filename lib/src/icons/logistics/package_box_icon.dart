import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Paquete / Caja de Envío.
class PackageBoxIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const PackageBoxIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB703));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _PackageBoxIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _PackageBoxIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _PackageBoxIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final boxStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final seamStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Cube Outer Outline
    final outerPath = Path()
      ..moveTo(12.0, 3.0)
      ..lineTo(21.0, 7.5)
      ..lineTo(21.0, 16.5)
      ..lineTo(12.0, 21.0)
      ..lineTo(3.0, 16.5)
      ..lineTo(3.0, 7.5)
      ..close();
    canvas.drawPath(outerPath, boxStroke);

    // Inner Cube Seams (Vibrant Amber Accent)
    canvas.drawLine(const Offset(12.0, 3.0), const Offset(12.0, 12.0), seamStroke);
    canvas.drawLine(const Offset(12.0, 12.0), const Offset(21.0, 7.5), seamStroke);
    canvas.drawLine(const Offset(12.0, 12.0), const Offset(3.0, 7.5), seamStroke);
    canvas.drawLine(const Offset(12.0, 12.0), const Offset(12.0, 21.0), seamStroke);
  }

  @override
  bool shouldRepaint(covariant _PackageBoxIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
