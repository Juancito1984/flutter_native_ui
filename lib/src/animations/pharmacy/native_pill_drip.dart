import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de cápsula/píldora levitando con halo de luz para farmacia.
class NativePillDrip extends StatefulWidget {
  final double size;
  final Color primaryColor;
  final Color secondaryColor;
  final Duration duration;

  const NativePillDrip({
    super.key,
    this.size = 56.0,
    this.primaryColor = const Color(0xFFE91E63),
    this.secondaryColor = const Color(0xFF00BCD4),
    this.duration = const Duration(milliseconds: 1500),
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
    )..repeat(reverse: true);
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
        final floatY = math.sin(_controller.value * math.pi) * 4.0;
        final glowScale = 0.8 + (_controller.value * 0.4);

        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: _PillDripPainter(
              floatY: floatY,
              glowScale: glowScale,
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
            ),
          ),
        );
      },
    );
  }
}

class _PillDripPainter extends CustomPainter {
  final double floatY;
  final double glowScale;
  final Color primaryColor;
  final Color secondaryColor;

  const _PillDripPainter({
    required this.floatY,
    required this.glowScale,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    // Glow Halo behind pill
    final glowPaint = Paint()
      // ignore: deprecated_member_use
      ..color = primaryColor.withOpacity(0.25 * glowScale)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(12, 12), 9 * glowScale, glowPaint);

    final primaryPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final secondaryPaint = Paint()
      ..color = secondaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Floating Capsule
    canvas.save();
    canvas.translate(12, 12 + (floatY / scale));
    canvas.rotate(-0.52); // -30 deg

    final leftCap = Path()
      ..addRRect(RRect.fromRectAndCorners(
        const Rect.fromLTRB(-7, -3.5, 0, 3.5),
        topLeft: const Radius.circular(3.5),
        bottomLeft: const Radius.circular(3.5),
      ));
    canvas.drawPath(leftCap, primaryPaint);

    final rightCap = Path()
      ..addRRect(RRect.fromRectAndCorners(
        const Rect.fromLTRB(0, -3.5, 7, 3.5),
        topRight: const Radius.circular(3.5),
        bottomRight: const Radius.circular(3.5),
      ));
    canvas.drawPath(rightCap, secondaryPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _PillDripPainter oldDelegate) =>
      oldDelegate.floatY != floatY ||
      oldDelegate.primaryColor != primaryColor ||
      oldDelegate.secondaryColor != secondaryColor;
}
