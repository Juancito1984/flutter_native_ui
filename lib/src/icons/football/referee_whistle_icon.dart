import 'package:flutter/material.dart';

/// Icono vectorial de silbato de árbitro de fútbol.
class RefereeWhistleIcon extends StatelessWidget {
  final double size;
  final Color whistleColor;

  const RefereeWhistleIcon({
    super.key,
    this.size = 24.0,
    this.whistleColor = const Color(0xFF78909C),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _RefereeWhistlePainter(whistleColor: whistleColor),
      ),
    );
  }
}

class _RefereeWhistlePainter extends CustomPainter {
  final Color whistleColor;

  const _RefereeWhistlePainter({required this.whistleColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final mainPaint = Paint()
      ..color = whistleColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final holePaint = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.fill;

    // Lanyard Ring
    final ringPaint = Paint()
      ..color = whistleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(const Offset(4, 12), 2.2, ringPaint);

    // Whistle Chamber (Bulb)
    canvas.drawCircle(const Offset(10, 13), 5, mainPaint);

    // Mouthpiece Barrel
    final barrelPath = Path()
      ..moveTo(10, 8)
      ..lineTo(21, 8)
      ..lineTo(21, 13)
      ..lineTo(10, 15)
      ..close();
    canvas.drawPath(barrelPath, mainPaint);

    // Whistle Hole Cutout
    canvas.drawRect(const Rect.fromLTRB(13, 8.5, 16, 11), holePaint);
  }

  @override
  bool shouldRepaint(covariant _RefereeWhistlePainter oldDelegate) =>
      oldDelegate.whistleColor != whistleColor;
}
