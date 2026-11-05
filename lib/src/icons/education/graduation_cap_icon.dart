import 'package:flutter/material.dart';

/// Icono vectorial de birrete de graduación para educación.
class GraduationCapIcon extends StatelessWidget {
  final double size;
  final Color capColor;

  const GraduationCapIcon({
    super.key,
    this.size = 24.0,
    this.capColor = const Color(0xFF1565C0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _GraduationCapPainter(capColor: capColor),
      ),
    );
  }
}

class _GraduationCapPainter extends CustomPainter {
  final Color capColor;

  const _GraduationCapPainter({required this.capColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final capPaint = Paint()
      ..color = capColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final tasselPaint = Paint()
      ..color = const Color(0xFFFFB300)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    // Diamond Top
    final topPath = Path()
      ..moveTo(12, 4)
      ..lineTo(22, 9)
      ..lineTo(12, 14)
      ..lineTo(2, 9)
      ..close();
    canvas.drawPath(topPath, capPaint);

    // Skull Cap Underneath
    final skullPath = Path()
      ..moveTo(6, 11.5)
      ..lineTo(6, 16)
      ..cubicTo(6, 19, 18, 19, 18, 16)
      ..lineTo(18, 11.5)
      ..cubicTo(18, 14, 6, 14, 6, 11.5)
      ..close();
    canvas.drawPath(skullPath, capPaint);

    // Tassel (Cinta colgante)
    canvas.drawLine(const Offset(12, 9), const Offset(20, 13), tasselPaint);
    canvas.drawCircle(const Offset(20, 14.5), 1.0, Paint()..color = const Color(0xFFFFB300));
  }

  @override
  bool shouldRepaint(covariant _GraduationCapPainter oldDelegate) =>
      oldDelegate.capColor != capColor;
}
