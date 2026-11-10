import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de motocicleta de reparto gastronómico.
class DeliveryMotorcycleIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const DeliveryMotorcycleIcon({
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
    final greenAccent = secondaryColor ?? const Color(0xFF00E676);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _DeliveryMotorcyclePainter(
          primaryColor: primary,
          accentColor: greenAccent,
        ),
      ),
    );
  }
}

class _DeliveryMotorcyclePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _DeliveryMotorcyclePainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final frameStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final boxFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Wheels
    canvas.drawCircle(const Offset(6, 17), 3.0, frameStroke);
    canvas.drawCircle(const Offset(18, 17), 3.0, frameStroke);

    // Frame Body
    final frame = Path()
      ..moveTo(6, 17)
      ..lineTo(10, 12)
      ..lineTo(16, 12)
      ..lineTo(18, 17);
    canvas.drawPath(frame, frameStroke);

    // Delivery Box on Back (Vibrant Emerald Fill Accent)
    canvas.drawRect(const Rect.fromLTWH(3, 8, 6, 6), boxFill);
  }

  @override
  bool shouldRepaint(covariant _DeliveryMotorcyclePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
