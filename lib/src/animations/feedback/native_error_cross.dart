import 'package:flutter/material.dart';

/// Animación nativa de cruz de error (Error Cross).
class NativeErrorCross extends StatefulWidget {
  final double size;
  final Color? color;
  final Duration duration;

  const NativeErrorCross({
    super.key,
    this.size = 56.0,
    this.color,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<NativeErrorCross> createState() => _NativeErrorCrossState();
}

class _NativeErrorCrossState extends State<NativeErrorCross>
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

    final crossColor = widget.color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFE53935));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _ErrorCrossPainter(
                progress: _controller.value,
                color: crossColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ErrorCrossPainter extends CustomPainter {
  final double progress;
  final Color color;

  const _ErrorCrossPainter({
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

    final circleProgress = (progress / 0.5).clamp(0.0, 1.0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.57,
      6.28 * circleProgress,
      false,
      circlePaint,
    );

    // Cruz trazada progresivamente
    if (progress > 0.4) {
      final crossPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true;

      final p1 = Offset(size.width * 0.32, size.height * 0.32);
      final p2 = Offset(size.width * 0.68, size.height * 0.68);

      final p3 = Offset(size.width * 0.68, size.height * 0.32);
      final p4 = Offset(size.width * 0.32, size.height * 0.68);

      final stroke1Progress = ((progress - 0.4) / 0.3).clamp(0.0, 1.0);
      canvas.drawLine(
        p1,
        Offset(
          p1.dx + (p2.dx - p1.dx) * stroke1Progress,
          p1.dy + (p2.dy - p1.dy) * stroke1Progress,
        ),
        crossPaint,
      );

      if (progress > 0.7) {
        final stroke2Progress = ((progress - 0.7) / 0.3).clamp(0.0, 1.0);
        canvas.drawLine(
          p3,
          Offset(
            p3.dx + (p4.dx - p3.dx) * stroke2Progress,
            p3.dy + (p4.dy - p3.dy) * stroke2Progress,
          ),
          crossPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ErrorCrossPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
