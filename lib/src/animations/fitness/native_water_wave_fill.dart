import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de Gota de Agua Llenándose con Ondas de Líquido.
class NativeWaterWaveFill extends StatefulWidget {
  final double size;
  final Color waveColor;
  final Duration duration;

  const NativeWaterWaveFill({
    super.key,
    this.size = 56.0,
    this.waveColor = const Color(0xFF0288D1),
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<NativeWaterWaveFill> createState() => _NativeWaterWaveFillState();
}

class _NativeWaterWaveFillState extends State<NativeWaterWaveFill>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _WaterWaveFillPainter(
                progress: _controller.value,
                waveColor: widget.waveColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WaterWaveFillPainter extends CustomPainter {
  final double progress;
  final Color waveColor;

  const _WaterWaveFillPainter({
    required this.progress,
    required this.waveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final dropPath = Path()
      ..moveTo(12.0, 3.0)
      ..cubicTo(12.0, 3.0, 5.0, 11.0, 5.0, 15.0)
      ..cubicTo(5.0, 19.0, 8.0, 21.0, 12.0, 21.0)
      ..cubicTo(16.0, 21.0, 19.0, 19.0, 19.0, 15.0)
      ..cubicTo(19.0, 11.0, 12.0, 3.0, 12.0, 3.0)
      ..close();

    final borderPaint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    canvas.drawPath(dropPath, borderPaint);

    // Clip Wave inside Drop
    canvas.save();
    canvas.clipPath(dropPath);

    final fillPaint = Paint()
      ..color = waveColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final wavePath = Path();
    final waveY = 21.0 - (progress * 14.0);
    wavePath.moveTo(0.0, waveY);

    for (double x = 0; x <= 24.0; x += 1.0) {
      final y = waveY + math.sin((x / 24.0 * 2 * math.pi) + (progress * 2 * math.pi)) * 1.5;
      wavePath.lineTo(x, y);
    }
    wavePath.lineTo(24.0, 24.0);
    wavePath.lineTo(0.0, 24.0);
    wavePath.close();

    canvas.drawPath(wavePath, fillPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _WaterWaveFillPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.waveColor != waveColor;
}
