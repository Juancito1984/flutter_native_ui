import 'package:flutter/material.dart';

/// Icono vectorial de maleta de viaje.
class SuitcaseIcon extends StatelessWidget {
  final double size;
  final Color caseColor;

  const SuitcaseIcon({
    super.key,
    this.size = 24.0,
    this.caseColor = const Color(0xFFF57C00),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SuitcasePainter(caseColor: caseColor),
      ),
    );
  }
}

class _SuitcasePainter extends CustomPainter {
  final Color caseColor;

  const _SuitcasePainter({required this.caseColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final casePaint = Paint()
      ..color = caseColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final handlePaint = Paint()
      ..color = const Color(0xFF37474F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    // Handle
    final handlePath = Path()
      ..moveTo(9, 7)
      ..lineTo(9, 3)
      ..lineTo(15, 3)
      ..lineTo(15, 7);
    canvas.drawPath(handlePath, handlePaint);

    // Case Body
    final caseRect = RRect.fromLTRBR(4, 7, 20, 20, const Radius.circular(2.5));
    canvas.drawRRect(caseRect, casePaint);

    // Wheels
    final wheelPaint = Paint()..color = const Color(0xFF37474F);
    canvas.drawCircle(const Offset(7, 20.5), 1.2, wheelPaint);
    canvas.drawCircle(const Offset(17, 20.5), 1.2, wheelPaint);
  }

  @override
  bool shouldRepaint(covariant _SuitcasePainter oldDelegate) =>
      oldDelegate.caseColor != caseColor;
}
