import 'package:flutter/material.dart';

/// Icono vectorial de edificio de hospital / centro médico.
class HospitalBuildingIcon extends StatelessWidget {
  final double size;
  final Color buildingColor;
  final Color crossColor;

  const HospitalBuildingIcon({
    super.key,
    this.size = 24.0,
    this.buildingColor = const Color(0xFFECEFF1),
    this.crossColor = const Color(0xFFE53935),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _HospitalBuildingPainter(
          buildingColor: buildingColor,
          crossColor: crossColor,
        ),
      ),
    );
  }
}

class _HospitalBuildingPainter extends CustomPainter {
  final Color buildingColor;
  final Color crossColor;

  const _HospitalBuildingPainter({
    required this.buildingColor,
    required this.crossColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final buildingPaint = Paint()
      ..color = buildingColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final crossPaint = Paint()
      ..color = crossColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final windowPaint = Paint()..color = const Color(0xFF90A4AE);
    final doorPaint = Paint()..color = const Color(0xFF455A64);

    // Main Hospital Structure
    final bldgRect = RRect.fromLTRBR(4, 5, 20, 21, const Radius.circular(2.0));
    canvas.drawRRect(bldgRect, buildingPaint);

    // Red Cross Emblem on Top
    canvas.drawRRect(
      RRect.fromLTRBR(11, 7, 13, 11, const Radius.circular(0.5)),
      crossPaint,
    );
    canvas.drawRRect(
      RRect.fromLTRBR(9, 8.5, 15, 9.5, const Radius.circular(0.5)),
      crossPaint,
    );

    // Windows
    canvas.drawRect(const Rect.fromLTRB(6, 13, 9, 15), windowPaint);
    canvas.drawRect(const Rect.fromLTRB(15, 13, 18, 15), windowPaint);

    // Double Doors
    canvas.drawRect(const Rect.fromLTRB(10, 17, 14, 21), doorPaint);
  }

  @override
  bool shouldRepaint(covariant _HospitalBuildingPainter oldDelegate) =>
      oldDelegate.buildingColor != buildingColor || oldDelegate.crossColor != crossColor;
}
