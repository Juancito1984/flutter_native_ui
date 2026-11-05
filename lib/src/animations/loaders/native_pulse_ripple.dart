// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Animación de ondas expansivas de pulso/radar.
class NativePulseRipple extends StatefulWidget {
  final double size;
  final Color? color;
  final Duration duration;

  const NativePulseRipple({
    super.key,
    this.size = 60.0,
    this.color,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<NativePulseRipple> createState() => _NativePulseRippleState();
}

class _NativePulseRippleState extends State<NativePulseRipple>
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
    final rippleColor = widget.color ?? Theme.of(context).colorScheme.primary;

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final progress = _controller.value;
          final radius = (widget.size / 2) * progress;
          final opacity = (1.0 - progress).clamp(0.0, 1.0);

          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: radius * 2,
                  height: radius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: rippleColor.withOpacity(opacity * 0.4),
                    border: Border.all(
                      color: rippleColor.withOpacity(opacity),
                      width: 1.5,
                    ),
                  ),
                ),
                Container(
                  width: widget.size * 0.25,
                  height: widget.size * 0.25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: rippleColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
