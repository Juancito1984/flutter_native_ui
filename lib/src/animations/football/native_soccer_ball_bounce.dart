import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de Balón de Fútbol Rebotando con Física de Sombra.
class NativeSoccerBallBounce extends StatefulWidget {
  final double size;
  final Color? ballColor;
  final Duration duration;

  const NativeSoccerBallBounce({
    super.key,
    this.size = 48.0,
    this.ballColor,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<NativeSoccerBallBounce> createState() => _NativeSoccerBallBounceState();
}

class _NativeSoccerBallBounceState extends State<NativeSoccerBallBounce>
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

    final color = widget.ballColor ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final t = _controller.value;
          final bounceY = (1.0 - math.sin(t * math.pi / 2)) * (widget.size * 0.4);

          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _SoccerBallBouncePainter(
                bounceY: bounceY,
                bounceProgress: t,
                color: color,
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
  final double bounceProgress;
  final Color color;

  const _SoccerBallBouncePainter({
    required this.bounceY,
    required this.bounceProgress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width * 0.3;
    final centerX = size.width / 2;
    final groundY = size.height - radius - 2;

    // Shadow on Ground
    final shadowScale = 0.5 + (1.0 - bounceProgress) * 0.5;
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.2 * shadowScale)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(centerX, size.height - 4), width: radius * 2 * shadowScale, height: 4),
      shadowPaint,
    );

    // Ball
    final ballCenterY = groundY - bounceY;
    final ballStroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;

    canvas.drawCircle(Offset(centerX, ballCenterY), radius, ballStroke);

    // Inner Pentagon
    final penta = Path()
      ..moveTo(centerX, ballCenterY - radius * 0.4)
      ..lineTo(centerX + radius * 0.3, ballCenterY - radius * 0.1)
      ..lineTo(centerX + radius * 0.2, ballCenterY + radius * 0.3)
      ..lineTo(centerX - radius * 0.2, ballCenterY + radius * 0.3)
      ..lineTo(centerX - radius * 0.3, ballCenterY - radius * 0.1)
      ..close();
    canvas.drawPath(penta, Paint()..color = color..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant _SoccerBallBouncePainter oldDelegate) =>
      oldDelegate.bounceY != bounceY || oldDelegate.color != color;
}
