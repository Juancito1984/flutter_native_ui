// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Icono vectorial de cápsula/pastilla bicolor para medicina y farmacia.
class PillIcon extends StatelessWidget {
  final double size;
  final Color primaryColor;
  final Color secondaryColor;

  const PillIcon({
    super.key,
    this.size = 24.0,
    this.primaryColor = const Color(0xFFE91E63),
    this.secondaryColor = const Color(0xFF00BCD4),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _PillPainter(
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
        ),
      ),
    );
  }
}

class _PillPainter extends CustomPainter {
  final Color primaryColor;
  final Color secondaryColor;

  const _PillPainter({
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final primaryPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final secondaryPaint = Paint()
      ..color = secondaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Tilted Capsule
    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(-0.785398); // -45 deg

    // Left half (Primary)
    final leftCap = Path()
      ..addRRect(RRect.fromRectAndCorners(
        const Rect.fromLTRB(-8, -4, 0, 4),
        topLeft: const Radius.circular(4),
        bottomLeft: const Radius.circular(4),
      ));
    canvas.drawPath(leftCap, primaryPaint);

    // Right half (Secondary)
    final rightCap = Path()
      ..addRRect(RRect.fromRectAndCorners(
        const Rect.fromLTRB(0, -4, 8, 4),
        topRight: const Radius.circular(4),
        bottomRight: const Radius.circular(4),
      ));
    canvas.drawPath(rightCap, secondaryPaint);

    // Shine reflection
    final shinePaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromLTRBR(-6, -2.5, 6, -1, const Radius.circular(1)),
      shinePaint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _PillPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor ||
      oldDelegate.secondaryColor != secondaryColor;
}
