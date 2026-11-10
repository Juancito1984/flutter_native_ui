import 'package:flutter/material.dart';

/// Animación nativa de cápsula con goteo de sustancia activa.
class NativePillDrip extends StatefulWidget {
  final double size;
  final Color? pillColor;
  final Color? dropColor;
  final Duration duration;

  const NativePillDrip({
    super.key,
    this.size = 48.0,
    this.pillColor,
    this.dropColor,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<NativePillDrip> createState() => _NativePillDripState();
}

class _NativePillDripState extends State<NativePillDrip>
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

    final primaryPill = widget.pillColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFE53935));
    final activeDrop = widget.dropColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF0288D1));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _PillDripPainter(
                progress: _controller.value,
                pillColor: primaryPill,
                dropColor: activeDrop,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PillDripPainter extends CustomPainter {
  final double progress;
  final Color pillColor;
  final Color dropColor;

  const _PillDripPainter({
    required this.progress,
    required this.pillColor,
    required this.dropColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = pillColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    // Horizontal Capsule
    final pillRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(4, 5, 16, 8),
      const Radius.circular(4),
    );
    canvas.drawRRect(pillRRect, strokePaint);

    // Drip Drop Line
    final dropY = 13.0 + (progress * 8.0);
    final dropAlpha = (1.0 - progress).clamp(0.0, 1.0);
    final dropPaint = Paint()
      ..color = dropColor.withValues(alpha: dropAlpha)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(12.0, dropY), 1.8 * (1.0 - progress * 0.4), dropPaint);
  }

  @override
  bool shouldRepaint(covariant _PillDripPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.pillColor != pillColor || oldDelegate.dropColor != dropColor;
}
