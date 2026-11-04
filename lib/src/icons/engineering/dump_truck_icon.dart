import 'package:flutter/material.dart';

/// Icono vectorial de volqueta / camión de volteo de ingeniería.
class DumpTruckIcon extends StatelessWidget {
  final double size;
  final Color bedColor;
  final Color cabinColor;
  final Color wheelColor;

  const DumpTruckIcon({
    super.key,
    this.size = 24.0,
    this.bedColor = const Color(0xFFF57C00),
    this.cabinColor = const Color(0xFFFFB300),
    this.wheelColor = const Color(0xFF37474F),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _DumpTruckPainter(
          bedColor: bedColor,
          cabinColor: cabinColor,
          wheelColor: wheelColor,
        ),
      ),
    );
  }
}

class _DumpTruckPainter extends CustomPainter {
  final Color bedColor;
  final Color cabinColor;
  final Color wheelColor;

  const _DumpTruckPainter({
    required this.bedColor,
    required this.cabinColor,
    required this.wheelColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bedPaint = Paint()
      ..color = bedColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final cabinPaint = Paint()
      ..color = cabinColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = wheelColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final rimPaint = Paint()..color = const Color(0xFFECEFF1);
    final windowPaint = Paint()..color = const Color(0xFF81D4FA);

    // Chassis frame
    final chassisPaint = Paint()
      ..color = const Color(0xFF455A64)
      ..style = PaintingStyle.fill;
    canvas.drawRect(const Rect.fromLTRB(2, 15, 22, 17), chassisPaint);

    // Dump Bed (Volqueta)
    final bedPath = Path()
      ..moveTo(2, 8)
      ..lineTo(13, 8)
      ..lineTo(14, 15)
      ..lineTo(2, 15)
      ..close();
    canvas.drawPath(bedPath, bedPaint);

    // Cabin
    final cabinPath = Path()
      ..moveTo(15, 15)
      ..lineTo(15, 10)
      ..lineTo(19, 10)
      ..lineTo(22, 13)
      ..lineTo(22, 15)
      ..close();
    canvas.drawPath(cabinPath, cabinPaint);

    // Cabin Window
    final windowPath = Path()
      ..moveTo(17, 11)
      ..lineTo(19, 11)
      ..lineTo(21, 13)
      ..lineTo(17, 13)
      ..close();
    canvas.drawPath(windowPath, windowPaint);

    // Wheels
    canvas.drawCircle(const Offset(6, 17.5), 2.8, wheelPaint);
    canvas.drawCircle(const Offset(6, 17.5), 1.2, rimPaint);

    canvas.drawCircle(const Offset(11, 17.5), 2.8, wheelPaint);
    canvas.drawCircle(const Offset(11, 17.5), 1.2, rimPaint);

    canvas.drawCircle(const Offset(18.5, 17.5), 2.8, wheelPaint);
    canvas.drawCircle(const Offset(18.5, 17.5), 1.2, rimPaint);
  }

  @override
  bool shouldRepaint(covariant _DumpTruckPainter oldDelegate) =>
      oldDelegate.bedColor != bedColor ||
      oldDelegate.cabinColor != cabinColor ||
      oldDelegate.wheelColor != wheelColor;
}
