import 'package:flutter/material.dart';

/// Animación nativa de Descarga de Datos de la Nube.
class NativeDataDownload extends StatefulWidget {
  final double size;
  final Color? cloudColor;
  final Color? arrowColor;
  final Duration duration;

  const NativeDataDownload({
    super.key,
    this.size = 56.0,
    this.cloudColor,
    this.arrowColor,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<NativeDataDownload> createState() => _NativeDataDownloadState();
}

class _NativeDataDownloadState extends State<NativeDataDownload>
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

    final primaryCloud = widget.cloudColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF0288D1));
    final activeArrow = widget.arrowColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF2979FF));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _DataDownloadPainter(
                progress: _controller.value,
                cloudColor: primaryCloud,
                arrowColor: activeArrow,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DataDownloadPainter extends CustomPainter {
  final double progress;
  final Color cloudColor;
  final Color arrowColor;

  const _DataDownloadPainter({
    required this.progress,
    required this.cloudColor,
    required this.arrowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cloudPaint = Paint()
      ..color = cloudColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final cloudPath = Path()
      ..moveTo(19.35, 10.04)
      ..cubicTo(18.67, 6.59, 15.64, 4.0, 12.0, 4.0)
      ..cubicTo(9.11, 4.0, 6.6, 5.64, 5.35, 8.04)
      ..cubicTo(2.34, 8.36, 0.0, 10.91, 0.0, 14.0)
      ..cubicTo(0.0, 17.31, 2.69, 20.0, 6.0, 20.0)
      ..lineTo(19.0, 20.0)
      ..cubicTo(21.76, 20.0, 24.0, 17.76, 24.0, 15.0)
      ..cubicTo(24.0, 12.36, 21.95, 10.22, 19.35, 10.04)
      ..close();

    canvas.drawPath(cloudPath, cloudPaint);

    // Animated Download Arrow
    final arrowPaint = Paint()
      ..color = arrowColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final arrowY = 9.0 + (progress * 8.0);
    final arrowPath = Path()
      ..moveTo(12.0, arrowY - 6.0)
      ..lineTo(12.0, arrowY)
      ..moveTo(9.0, arrowY - 3.0)
      ..lineTo(12.0, arrowY)
      ..lineTo(15.0, arrowY - 3.0);

    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant _DataDownloadPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.cloudColor != cloudColor || oldDelegate.arrowColor != arrowColor;
}
