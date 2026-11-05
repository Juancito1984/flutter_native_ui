// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Botón nativo interactivo con efecto de destello de luz (Shimmer).
class NativeShimmerButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;

  const NativeShimmerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 48.0,
  });

  @override
  State<NativeShimmerButton> createState() => _NativeShimmerButtonState();
}

class _NativeShimmerButtonState extends State<NativeShimmerButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bg = widget.backgroundColor ?? Theme.of(context).colorScheme.primary;
    final txt = widget.textColor ?? Theme.of(context).colorScheme.onPrimary;

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final t = _controller.value;
          final p1 = (t - 0.3).clamp(0.0, 1.0);
          final p2 = (t - 0.15).clamp(0.0, 1.0);
          final p3 = t.clamp(0.0, 1.0);
          final p4 = (t + 0.15).clamp(0.0, 1.0);
          final p5 = (t + 0.3).clamp(0.0, 1.0);

          return Container(
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  bg,
                  bg.withOpacity(0.85),
                  Colors.white.withOpacity(0.6),
                  bg.withOpacity(0.85),
                  bg,
                ],
                stops: [p1, p2, p3, p4, p5],
              ),
            ),
            child: child,
          );
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
              color: txt,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
