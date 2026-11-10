import 'package:flutter/material.dart';

/// Animación nativa de marca de verificación de éxito (Checkmark).
class NativeSuccessCheckmark extends StatefulWidget {
  final double size;
  final Color? color;
  final Duration duration;

  const NativeSuccessCheckmark({
    super.key,
    this.size = 56.0,
    this.color,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<NativeSuccessCheckmark> createState() => _NativeSuccessCheckmarkState();
}

class _NativeSuccessCheckmarkState extends State<NativeSuccessCheckmark>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..forward();
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

    final checkColor = widget.color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF4CAF50));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _SuccessCheckmarkPainter(
                progress: _controller.value,
                color: checkColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SuccessCheckmarkPainter extends CustomPainter {
  final double progress;
  final Color color;

  const _SuccessCheckmarkPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Círculo de fondo con animación
    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..isAntiAlias = true;

    final circleProgress = (progress / 0.6).clamp(0.0, 1.0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.57,
      6.28 * circleProgress,
      false,
      circlePaint,
    );

    // Checkmark dibujado progresivamente
    if (progress > 0.5) {
      final checkProgress = ((progress - 0.5) / 0.5).clamp(0.0, 1.0);

      final checkPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..isAntiAlias = true;

      final p1 = Offset(size.width * 0.28, size.height * 0.52);
      final p2 = Offset(size.width * 0.45, size.height * 0.68);
      final p3 = Offset(size.width * 0.72, size.height * 0.36);

      final checkPath = Path();
      if (checkProgress < 0.5) {
        final subProgress = checkProgress / 0.5;
        checkPath.moveTo(p1.dx, p1.dy);
        checkPath.lineTo(
          p1.dx + (p2.dx - p1.dx) * subProgress,
          p1.dy + (p2.dy - p1.dy) * subProgress,
        );
      } else {
        final subProgress = (checkProgress - 0.5) / 0.5;
        checkPath.moveTo(p1.dx, p1.dy);
        checkPath.lineTo(p2.dx, p2.dy);
        checkPath.lineTo(
          p2.dx + (p3.dx - p2.dx) * subProgress,
          p2.dy + (p3.dy - p2.dy) * subProgress,
        );
      }

      canvas.drawPath(checkPath, checkPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SuccessCheckmarkPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
