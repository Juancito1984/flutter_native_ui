import 'package:flutter/material.dart';

/// Icono vectorial de surtidor de gasolina / estación de carga.
class FuelGasIcon extends StatelessWidget {
  final double size;
  final Color pumpColor;

  const FuelGasIcon({
    super.key,
    this.size = 24.0,
    this.pumpColor = const Color(0xFFE53935),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _FuelGasPainter(pumpColor: pumpColor),
      ),
    );
  }
}

class _FuelGasPainter extends CustomPainter {
  final Color pumpColor;

  const _FuelGasPainter({required this.pumpColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final pumpPaint = Paint()
      ..color = pumpColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final hosePaint = Paint()
      ..color = pumpColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    final displayPaint = Paint()..color = Colors.white;

    // Pump Main Body
    final pumpRect = RRect.fromLTRBR(3, 4, 15, 21, const Radius.circular(2));
    canvas.drawRRect(pumpRect, pumpPaint);

    // Screen
    canvas.drawRRect(
      RRect.fromLTRBR(5, 7, 13, 11, const Radius.circular(1)),
      displayPaint,
    );

    // Hose & Nozzle
    final hosePath = Path()
      ..moveTo(15, 8)
      ..cubicTo(20, 8, 20, 16, 18, 16)
      ..lineTo(18, 12);
    canvas.drawPath(hosePath, hosePaint);
  }

  @override
  bool shouldRepaint(covariant _FuelGasPainter oldDelegate) =>
      oldDelegate.pumpColor != pumpColor;
}
