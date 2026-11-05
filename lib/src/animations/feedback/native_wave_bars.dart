import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Barras de ecualizador de audio / sonido animadas.
class NativeWaveBars extends StatefulWidget {
  final double height;
  final Color? color;
  final Duration duration;

  const NativeWaveBars({
    super.key,
    this.height = 32.0,
    this.color,
    this.duration = const Duration(milliseconds: 800),
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
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barColor = widget.color ?? Theme.of(context).colorScheme.primary;

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(4, (index) {
              final phase = index * 0.7;
              final val = math.sin((_controller.value * math.pi) + phase).abs();
              final currentHeight = math.max(6.0, val * widget.height);

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.5),
                width: 4.5,
                height: currentHeight,
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
