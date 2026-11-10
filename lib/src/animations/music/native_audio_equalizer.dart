import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de ecualizador de música de 4 barras.
class NativeAudioEqualizer extends StatefulWidget {
  final double width;
  final double height;
  final Color? barColor;
  final Duration duration;

  const NativeAudioEqualizer({
    super.key,
    this.width = 48.0,
    this.height = 36.0,
    this.barColor,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<NativeAudioEqualizer> createState() => _NativeAudioEqualizerState();
}

class _NativeAudioEqualizerState extends State<NativeAudioEqualizer>
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

    final activeColor = widget.barColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF1E88E5));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: _AudioEqualizerPainter(
                progress: _controller.value,
                barColor: activeColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AudioEqualizerPainter extends CustomPainter {
  final double progress;
  final Color barColor;

  const _AudioEqualizerPainter({
    required this.progress,
    required this.barColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final barPaint = Paint()
      ..color = barColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    const numBars = 4;
    final barWidth = size.width / (numBars * 2 - 1);

    for (int i = 0; i < numBars; i++) {
      final phase = i * 0.5;
      final hFactor = 0.2 + 0.8 * math.sin((progress * 2 * math.pi) + phase).abs();
      final barHeight = size.height * hFactor;
      final x = i * barWidth * 2;
      final y = size.height - barHeight;

      final barRRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        Radius.circular(barWidth / 2),
      );
      canvas.drawRRect(barRRect, barPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _AudioEqualizerPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.barColor != barColor;
}
