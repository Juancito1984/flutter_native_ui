import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de ecualizador de audio / ondas musicales.
class NativeAudioEqualizer extends StatefulWidget {
  final double width;
  final double height;
  final Color activeColor;
  final Duration duration;

  const NativeAudioEqualizer({
    super.key,
    this.width = 48.0,
    this.height = 36.0,
    this.activeColor = const Color(0xFFE91E63),
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: CustomPaint(
            painter: _AudioEqualizerPainter(
              progress: _controller.value,
              activeColor: widget.activeColor,
            ),
          ),
        );
      },
    );
  }
}

class _AudioEqualizerPainter extends CustomPainter {
  final double progress;
  final Color activeColor;

  const _AudioEqualizerPainter({
    required this.progress,
    required this.activeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const numBars = 5;
    final barWidth = size.width / (numBars * 2 - 1);
    final maxHeight = size.height;

    final paint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    for (int i = 0; i < numBars; i++) {
      final phase = i * 0.4;
      final wave = (math.sin((progress * 2 * math.pi) + phase) + 1) / 2;
      final barHeight = math.max(maxHeight * 0.18, maxHeight * wave);

      final left = i * (barWidth * 2);
      final top = maxHeight - barHeight;

      final rrect = RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, barWidth, barHeight),
        Radius.circular(barWidth / 2),
      );
      canvas.drawRRect(rrect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _AudioEqualizerPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.activeColor != activeColor;
}
