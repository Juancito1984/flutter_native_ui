import 'package:flutter/material.dart';

/// Icono vectorial de diploma / certificado de logro.
class CertificateAwardIcon extends StatelessWidget {
  final double size;
  final Color ribbonColor;

  const CertificateAwardIcon({
    super.key,
    this.size = 24.0,
    this.ribbonColor = const Color(0xFFFFB300),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CertificateAwardPainter(ribbonColor: ribbonColor),
      ),
    );
  }
}

class _CertificateAwardPainter extends CustomPainter {
  final Color ribbonColor;

  const _CertificateAwardPainter({required this.ribbonColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final borderPaint = Paint()
      ..color = const Color(0xFF546E7A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..isAntiAlias = true;

    final bgPaint = Paint()..color = const Color(0xFFFAFAFA);

    final ribbonPaint = Paint()
      ..color = ribbonColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Certificate Sheet
    final sheetRect = RRect.fromLTRBR(3, 3, 21, 18, const Radius.circular(2));
    canvas.drawRRect(sheetRect, bgPaint);
    canvas.drawRRect(sheetRect, borderPaint);

    // Inner Lines
    final linePaint = Paint()
      ..color = const Color(0xFFB0BEC5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawLine(const Offset(6, 6), const Offset(15, 6), linePaint);
    canvas.drawLine(const Offset(6, 9), const Offset(14, 9), linePaint);
    canvas.drawLine(const Offset(6, 12), const Offset(12, 12), linePaint);

    // Award Seal & Ribbon (Bottom Right)
    canvas.drawCircle(const Offset(16.5, 14), 2.8, ribbonPaint);
    final ribbonTail = Path()
      ..moveTo(15, 16)
      ..lineTo(14, 21)
      ..lineTo(16.5, 19.5)
      ..lineTo(19, 21)
      ..lineTo(18, 16)
      ..close();
    canvas.drawPath(ribbonTail, ribbonPaint);
  }

  @override
  bool shouldRepaint(covariant _CertificateAwardPainter oldDelegate) =>
      oldDelegate.ribbonColor != ribbonColor;
}
