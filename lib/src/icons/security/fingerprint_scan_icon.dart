import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Escaneo de Huella Dactilar (Fingerprint).
class FingerprintScanIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const FingerprintScanIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _FingerprintScanIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _FingerprintScanIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _FingerprintScanIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final fpPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final accentPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Outer Arc
    canvas.drawArc(const Rect.fromLTRB(4.0, 4.0, 20.0, 20.0), -2.8, 4.2, false, fpPaint);

    // Middle Arc
    canvas.drawArc(const Rect.fromLTRB(7.0, 7.0, 17.0, 17.0), -2.8, 3.8, false, fpPaint);

    // Inner Arc (Vibrant Accent)
    canvas.drawArc(const Rect.fromLTRB(10.0, 10.0, 14.0, 14.0), -2.8, 3.2, false, accentPaint);

    // Center Core Trace
    final centerPath = Path()
      ..moveTo(12.0, 11.0)
      ..lineTo(12.0, 15.0)
      ..cubicTo(12.0, 17.5, 10.0, 19.0, 8.0, 19.0);
    canvas.drawPath(centerPath, accentPaint);
  }

  @override
  bool shouldRepaint(covariant _FingerprintScanIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
