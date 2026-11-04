import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación de puntos saltarines para indicador de carga o escritura.
class NativeBouncingDots extends StatefulWidget {
  final double size;
  final Color? color;
  final Duration duration;

  const NativeBouncingDots({
    super.key,
    this.size = 10.0,
    this.color,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<NativeBouncingDots> createState() => _NativeBouncingDotsState();
}

class _NativeBouncingDotsState extends State<NativeBouncingDots>
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
    final dotColor = widget.color ?? Theme.of(context).colorScheme.primary;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final delay = index * 0.2;
            final val = math.sin((_controller.value * 2 * math.pi) - delay);
            final dy = -math.max(0.0, val) * widget.size;

            return Transform.translate(
              offset: Offset(0, dy),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: widget.size * 0.3),
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
