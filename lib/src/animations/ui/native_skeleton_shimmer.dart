import 'package:flutter/material.dart';

/// Carga de esqueleto con animación Shimmer (brillo barrido).
class NativeSkeletonShimmer extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  const NativeSkeletonShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8.0,
    this.baseColor,
    this.highlightColor,
  });

  @override
  State<NativeSkeletonShimmer> createState() => _NativeSkeletonShimmerState();
}

class _NativeSkeletonShimmerState extends State<NativeSkeletonShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = widget.baseColor ?? (isDark ? const Color(0xFF2C2C2C) : const Color(0xFFE0E0E0));
    final highlight = widget.highlightColor ?? (isDark ? const Color(0xFF3D3D3D) : const Color(0xFFF5F5F5));

    return LayoutBuilder(
      builder: (context, constraints) {
        final effectiveWidth = widget.width.isInfinite
            ? (constraints.hasBoundedWidth ? constraints.maxWidth : 200.0)
            : widget.width;

        return RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final t = _controller.value;
              final startStop = (t - 0.3).clamp(0.0, 1.0);
              final midStop = t.clamp(0.0, 1.0);
              final endStop = (t + 0.3).clamp(0.0, 1.0);

              return Container(
                width: effectiveWidth,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [base, highlight, base],
                    stops: [startStop, midStop, endStop],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
