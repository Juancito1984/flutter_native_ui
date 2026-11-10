import 'package:flutter/material.dart';

/// Icono vectorial de Escaneo de Huella Dactilar (Fingerprint).
class FingerprintScanIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const FingerprintScanIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _FingerprintScanIconPainter(color: iconColor),
      ),
    );
  }
}

class _FingerprintScanIconPainter extends CustomPainter {
  final Color color;

  const _FingerprintScanIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Outer Arc
    canvas.drawArc(const Rect.fromLTRB(4.0, 4.0, 20.0, 20.0), -2.8, 4.2, false, strokePaint);

    // Middle Arc
    canvas.drawArc(const Rect.fromLTRB(7.0, 7.0, 17.0, 17.0), -2.8, 3.8, false, strokePaint);

    // Inner Arc
    canvas.drawArc(const Rect.fromLTRB(10.0, 10.0, 14.0, 14.0), -2.8, 3.2, false, strokePaint);

    // Center Core Trace
    final centerPath = Path()
      ..moveTo(12.0, 11.0)
      ..lineTo(12.0, 15.0)
      ..cubicTo(12.0, 17.5, 10.0, 19.0, 8.0, 19.0);
    canvas.drawPath(centerPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _FingerprintScanIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
