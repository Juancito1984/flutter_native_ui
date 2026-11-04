import 'package:flutter/material.dart';

/// Icono vectorial de cuadrilla/equipo de personal de ingeniería.
class WorkCrewIcon extends StatelessWidget {
  final double size;
  final Color primaryHardhatColor;
  final Color secondaryHardhatColor;

  const WorkCrewIcon({
    super.key,
    this.size = 24.0,
    this.primaryHardhatColor = const Color(0xFFFFB300),
    this.secondaryHardhatColor = const Color(0xFF0288D1),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _WorkCrewPainter(
          primaryHardhatColor: primaryHardhatColor,
          secondaryHardhatColor: secondaryHardhatColor,
        ),
      ),
    );
  }
}

class _WorkCrewPainter extends CustomPainter {
  final Color primaryHardhatColor;
  final Color secondaryHardhatColor;

  const _WorkCrewPainter({
    required this.primaryHardhatColor,
    required this.secondaryHardhatColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final skinPaint = Paint()
      ..color = const Color(0xFFFFCC80)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final primaryHatPaint = Paint()
      ..color = primaryHardhatColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final secondaryHatPaint = Paint()
      ..color = secondaryHardhatColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bodyPaint = Paint()
      ..color = const Color(0xFF546E7A)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Left worker (Background)
    canvas.drawCircle(const Offset(7, 11), 3.0, skinPaint);
    final leftHat = Path()
      ..moveTo(3, 10)
      ..cubicTo(3, 6.5, 5, 5, 7, 5)
      ..cubicTo(9, 5, 11, 6.5, 11, 10)
      ..close();
    canvas.drawPath(leftHat, secondaryHatPaint);
    final leftBody = Path()
      ..moveTo(2, 20)
      ..cubicTo(2, 16, 4.5, 14.5, 7, 14.5)
      ..cubicTo(9.5, 14.5, 12, 16, 12, 20)
      ..close();
    canvas.drawPath(leftBody, bodyPaint);

    // Right worker (Background)
    canvas.drawCircle(const Offset(17, 11), 3.0, skinPaint);
    final rightHat = Path()
      ..moveTo(13, 10)
      ..cubicTo(13, 6.5, 15, 5, 17, 5)
      ..cubicTo(19, 5, 21, 6.5, 21, 10)
      ..close();
    canvas.drawPath(rightHat, secondaryHatPaint);
    final rightBody = Path()
      ..moveTo(12, 20)
      ..cubicTo(12, 16, 14.5, 14.5, 17, 14.5)
      ..cubicTo(19.5, 14.5, 22, 16, 22, 20)
      ..close();
    canvas.drawPath(rightBody, bodyPaint);

    // Center worker (Foreground / Lead)
    final centerVest = Paint()
      ..color = const Color(0xFFFF5722)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawCircle(const Offset(12, 9.5), 3.5, skinPaint);
    final centerHat = Path()
      ..moveTo(7.5, 8.5)
      ..cubicTo(7.5, 4.5, 9.5, 3, 12, 3)
      ..cubicTo(14.5, 3, 16.5, 4.5, 16.5, 8.5)
      ..close();
    canvas.drawPath(centerHat, primaryHatPaint);

    final centerHatBrim = Path()
      ..moveTo(6, 8.5)
      ..lineTo(18, 8.5)
      ..lineTo(17, 9.5)
      ..lineTo(7, 9.5)
      ..close();
    canvas.drawPath(centerHatBrim, primaryHatPaint);

    final centerBody = Path()
      ..moveTo(5.5, 21)
      ..cubicTo(5.5, 15.5, 8.5, 13.5, 12, 13.5)
      ..cubicTo(15.5, 13.5, 18.5, 15.5, 18.5, 21)
      ..close();
    canvas.drawPath(centerBody, centerVest);
  }

  @override
  bool shouldRepaint(covariant _WorkCrewPainter oldDelegate) =>
      oldDelegate.primaryHardhatColor != primaryHardhatColor ||
      oldDelegate.secondaryHardhatColor != secondaryHardhatColor;
}
