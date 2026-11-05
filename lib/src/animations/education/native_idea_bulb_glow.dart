// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Animación nativa de foco de idea encendiéndose con destello de luz radiante.
class NativeIdeaBulbGlow extends StatefulWidget {
  final double size;
  final Color bulbColor;
  final Duration duration;

  const NativeIdeaBulbGlow({
    super.key,
    this.size = 56.0,
    this.bulbColor = const Color(0xFFFFC107),
    this.duration = const Duration(milliseconds: 1400),
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
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final glowScale = 0.8 + (_controller.value * 0.4);

          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _IdeaBulbGlowPainter(
                glowScale: glowScale,
                bulbColor: widget.bulbColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _IdeaBulbGlowPainter extends CustomPainter {
  final double glowScale;
  final Color bulbColor;

  const _IdeaBulbGlowPainter({
    required this.glowScale,
    required this.bulbColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    // Light Glow Halo
    final glowPaint = Paint()
      ..color = bulbColor.withOpacity(0.25 * glowScale)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(12, 11), 9 * glowScale, glowPaint);

    final bulbPaint = Paint()
      ..color = bulbColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final basePaint = Paint()
      ..color = const Color(0xFF78909C)
      ..style = PaintingStyle.fill;

    // Bulb
    final bulbPath = Path()
      ..moveTo(12, 3)
      ..cubicTo(7, 3, 5, 7, 5, 11)
      ..cubicTo(5, 14, 8, 15.5, 9, 17)
      ..lineTo(15, 17)
      ..cubicTo(16, 15.5, 19, 14, 19, 11)
      ..cubicTo(19, 7, 17, 3, 12, 3)
      ..close();
    canvas.drawPath(bulbPath, bulbPaint);

    // Screw Base
    canvas.drawRect(const Rect.fromLTRB(9, 18, 15, 20), basePaint);
    canvas.drawRRect(
      RRect.fromLTRBR(10, 20, 14, 22, const Radius.circular(1)),
      basePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _IdeaBulbGlowPainter oldDelegate) =>
      oldDelegate.glowScale != glowScale || oldDelegate.bulbColor != bulbColor;
}
