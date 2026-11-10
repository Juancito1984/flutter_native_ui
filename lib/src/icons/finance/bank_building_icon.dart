import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de edificio bancario.
class BankBuildingIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const BankBuildingIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);
    final emeraldAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BankBuildingPainter(
          primaryColor: primary,
          accentColor: emeraldAccent,
        ),
      ),
    );
  }
}

class _BankBuildingPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _BankBuildingPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final columnStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final roofStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // Roof Triangle (Vibrant Emerald Accent)
    final roof = Path()..moveTo(2, 8)..lineTo(12, 3)..lineTo(22, 8)..close();
    canvas.drawPath(roof, roofStroke);

    // Columns
    canvas.drawLine(const Offset(5, 8), const Offset(5, 18), columnStroke);
    canvas.drawLine(const Offset(10, 8), const Offset(10, 18), columnStroke);
    canvas.drawLine(const Offset(14, 8), const Offset(14, 18), columnStroke);
    canvas.drawLine(const Offset(19, 8), const Offset(19, 18), columnStroke);

    // Base Line
    canvas.drawLine(const Offset(2, 18), const Offset(22, 18), roofStroke..strokeWidth = 2.2);
  }

  @override
  bool shouldRepaint(covariant _BankBuildingPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
