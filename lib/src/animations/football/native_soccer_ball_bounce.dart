import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de balón de fútbol rebotando con sombra dinámica.
class NativeSoccerBallBounce extends StatefulWidget {
  final double size;
  final Duration duration;

  const NativeSoccerBallBounce({
    super.key,
    this.size = 56.0,
    this.duration = const Duration(milliseconds: 900),
  });

  @override
  State<NativeSoccerBallBounce> createState() => _NativeSoccerBallBounceState();
}

class _NativeSoccerBallBounceState extends State<NativeSoccerBallBounce>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _bounceAnimation;
  late final Animation<double> _shadowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _bounceAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuad,
    );

    _shadowAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInQuad,
    );
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
          final bounceY = (1.0 - _bounceAnimation.value) * (widget.size * 0.45);
          final shadowScale = 0.3 + (_shadowAnimation.value * 0.7);

          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _SoccerBallBouncePainter(
                bounceY: bounceY,
                shadowScale: shadowScale,
                rotationAngle: _controller.value * math.pi,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SoccerBallBouncePainter extends CustomPainter {
  final double bounceY;
  final double shadowScale;
  final double rotationAngle;

  const _SoccerBallBouncePainter({
    required this.bounceY,
    required this.shadowScale,
    required this.rotationAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    // Dynamic Ground Shadow
    final shadowPaint = Paint()
      ..color = const Color(0x33000000)
      ..style = PaintingStyle.fill;
    final shadowWidth = 7.0 * shadowScale;
    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(12, 22),
        width: shadowWidth,
        height: 2.2,
      ),
      shadowPaint,
    );

    // Ball translated by bounceY
    canvas.save();
    canvas.translate(12, 8 + (bounceY / scale));
    canvas.rotate(rotationAngle);

    final ballPaint = Paint()
      ..color = const Color(0xFFECEFF1)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final patchPaint = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8
      ..isAntiAlias = true;

    canvas.drawCircle(Offset.zero, 6, ballPaint);
    canvas.drawCircle(Offset.zero, 6, borderPaint);

    // Center pentagon patch
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final angle = (i * 72 - 90) * math.pi / 180;
      final x = 2.4 * math.cos(angle);
      final y = 2.4 * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, patchPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _SoccerBallBouncePainter oldDelegate) =>
      oldDelegate.bounceY != bounceY || oldDelegate.rotationAngle != rotationAngle;
}
