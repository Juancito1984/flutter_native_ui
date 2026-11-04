import 'package:flutter/material.dart';

/// Icono vectorial de calendario de partidos / fixture de fútbol.
class MatchCalendarIcon extends StatelessWidget {
  final double size;
  final Color headerColor;

  const MatchCalendarIcon({
    super.key,
    this.size = 24.0,
    this.headerColor = const Color(0xFF1976D2),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _MatchCalendarPainter(headerColor: headerColor),
      ),
    );
  }
}

class _MatchCalendarPainter extends CustomPainter {
  final Color headerColor;

  const _MatchCalendarPainter({required this.headerColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = const Color(0xFFFAFAFA)
      ..style = PaintingStyle.fill;

    final headerPaint = Paint()
      ..color = headerColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = const Color(0xFFCFD8DC)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final ringPaint = Paint()
      ..color = const Color(0xFF37474F)
      ..style = PaintingStyle.fill;

    final ballPaint = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.fill;

    // Calendar Card Body
    final cardRect = RRect.fromLTRBR(3, 5, 21, 21, const Radius.circular(2.5));
    canvas.drawRRect(cardRect, bgPaint);
    canvas.drawRRect(cardRect, borderPaint);

    // Header Clip
    final headerPath = Path()
      ..addRRect(RRect.fromRectAndCorners(
        const Rect.fromLTRB(3, 5, 21, 10),
        topLeft: const Radius.circular(2.5),
        topRight: const Radius.circular(2.5),
      ));
    canvas.drawPath(headerPath, headerPaint);

    // Top Binder Rings
    canvas.drawRRect(RRect.fromLTRBR(7, 3, 9, 7, const Radius.circular(1)), ringPaint);
    canvas.drawRRect(RRect.fromLTRBR(15, 3, 17, 7, const Radius.circular(1)), ringPaint);

    // Soccer Ball Icon in center of calendar
    canvas.drawCircle(const Offset(12, 15.5), 3.2, ballPaint);
    final innerDot = Paint()..color = const Color(0xFFECEFF1);
    canvas.drawCircle(const Offset(12, 15.5), 1.2, innerDot);
  }

  @override
  bool shouldRepaint(covariant _MatchCalendarPainter oldDelegate) =>
      oldDelegate.headerColor != headerColor;
}
