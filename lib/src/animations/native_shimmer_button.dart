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

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final dx = _controller.value * 3 - 1;

        return Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment(dx - 1, -0.5),
              end: Alignment(dx + 1, 0.5),
              colors: [
                bg,
                bg.withOpacity(0.85),
                Colors.white.withOpacity(0.6),
                bg.withOpacity(0.85),
                bg,
              ],
              stops: const [0.0, 0.4, 0.5, 0.6, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: bg.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
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
    );
  }
}
