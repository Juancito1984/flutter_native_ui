import 'package:flutter/material.dart';

/// Animación nativa de bombilla de idea con destello resplandeciente.
class NativeIdeaBulbGlow extends StatefulWidget {
  final double size;
  final Color? bulbColor;
  final Duration duration;

  const NativeIdeaBulbGlow({
    super.key,
    this.size = 48.0,
    this.bulbColor,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<NativeIdeaBulbGlow> createState() => _NativeIdeaBulbGlowState();
}

class _NativeIdeaBulbGlowState extends State<NativeIdeaBulbGlow>
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final color = widget.bulbColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFFB300));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _IdeaBulbGlowPainter(
                glowAlpha: 0.3 + (_controller.value * 0.7),
                bulbColor: color,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _IdeaBulbGlowPainter extends CustomPainter {
  final double glowAlpha;
  final Color bulbColor;

  const _IdeaBulbGlowPainter({
    required this.glowAlpha,
    required this.bulbColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bulbStroke = Paint()
      ..color = bulbColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final glowPaint = Paint()
      ..color = bulbColor.withValues(alpha: glowAlpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    // Bulb Contour
    final bulbPath = Path()
      ..moveTo(9, 18)
      ..lineTo(15, 18)
      ..lineTo(15, 16)
      ..cubicTo(18, 14, 19, 10, 17, 6.5)
      ..cubicTo(15, 3, 9, 3, 7, 6.5)
      ..cubicTo(5, 10, 6, 14, 9, 16)
      ..close();
    canvas.drawPath(bulbPath, bulbStroke);

    // Rays Glow
    canvas.drawLine(const Offset(12, 1), const Offset(12, 3), glowPaint);
    canvas.drawLine(const Offset(4, 5), const Offset(6, 6.5), glowPaint);
    canvas.drawLine(const Offset(20, 5), const Offset(18, 6.5), glowPaint);
  }

  @override
  bool shouldRepaint(covariant _IdeaBulbGlowPainter oldDelegate) =>
      oldDelegate.glowAlpha != glowAlpha || oldDelegate.bulbColor != bulbColor;
}
