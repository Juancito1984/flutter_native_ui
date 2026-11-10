import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de diploma o certificado de logros.
class CertificateAwardIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const CertificateAwardIcon({
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
    final medalAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB703));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CertificateAwardPainter(
          primaryColor: primary,
          accentColor: medalAccent,
        ),
      ),
    );
  }
}

class _CertificateAwardPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _CertificateAwardPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final medalFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Document Body
    final docRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(3, 3, 18, 14),
      const Radius.circular(2),
    );
    canvas.drawRRect(docRRect, strokePaint);

    // Lines inside
    canvas.drawLine(const Offset(6, 6), const Offset(14, 6), strokePaint..strokeWidth = 1.2);
    canvas.drawLine(const Offset(6, 9), const Offset(12, 9), strokePaint..strokeWidth = 1.2);

    // Ribbon / Medal at bottom right (Vibrant Golden Accent)
    canvas.drawCircle(const Offset(16, 14), 2.5, medalFill);
    final r1 = Path()..moveTo(15, 16)..lineTo(14, 21)..lineTo(16, 19.5)..lineTo(18, 21)..lineTo(17, 16);
    canvas.drawPath(r1, medalFill);
  }

  @override
  bool shouldRepaint(covariant _CertificateAwardPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
