import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de volqueta / camión de volteo para ingeniería.
class DumpTruckIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const DumpTruckIcon({
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
    final dumpAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB300));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _DumpTruckPainter(
          primaryColor: primary,
          accentColor: dumpAccent,
        ),
      ),
    );
  }
}

class _DumpTruckPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _DumpTruckPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final dumpFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final cabinStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final wheelFill = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.fill;

    // Dump Container (Vibrant Yellow Industrial Accent)
    final dumpPath = Path()
      ..moveTo(2, 7)
      ..lineTo(13, 7)
      ..lineTo(13, 14)
      ..lineTo(4, 14)
      ..close();
    canvas.drawPath(dumpPath, dumpFill);

    // Cabin
    final cabinPath = Path()
      ..moveTo(14, 9)
      ..lineTo(19, 10)
      ..lineTo(21, 14)
      ..lineTo(14, 14)
      ..close();
    canvas.drawPath(cabinPath, cabinStroke);

    // Wheels
    canvas.drawCircle(const Offset(6, 16.5), 2.2, wheelFill);
    canvas.drawCircle(const Offset(17, 16.5), 2.2, wheelFill);
  }

  @override
  bool shouldRepaint(covariant _DumpTruckPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
