import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de barras de onda de voz/audio oscilantes.
class NativeWaveBars extends StatefulWidget {
  final double height;
  final Color? barColor;
  final Duration duration;

  const NativeWaveBars({
    super.key,
    this.height = 32.0,
    this.barColor,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<NativeWaveBars> createState() => _NativeWaveBarsState();
}

class _NativeWaveBarsState extends State<NativeWaveBars>
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final activeColor = widget.barColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF0288D1));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.height * 2.0,
            height: widget.height,
            child: CustomPaint(
              painter: _WaveBarsPainter(
                progress: _controller.value,
                color: activeColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WaveBarsPainter extends CustomPainter {
  final double progress;
  final Color color;

  const _WaveBarsPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final barPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    const numBars = 5;
    final barWidth = size.width / (numBars * 2 - 1);

    for (int i = 0; i < numBars; i++) {
      final phase = i * 0.4;
      final hFactor = 0.3 + 0.7 * math.sin((progress * 2 * math.pi) + phase).abs();
      final barHeight = size.height * hFactor;
      final x = i * barWidth * 2;
      final y = (size.height - barHeight) / 2;

      final barRRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        Radius.circular(barWidth / 2),
      );
      canvas.drawRRect(barRRect, barPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _WaveBarsPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
