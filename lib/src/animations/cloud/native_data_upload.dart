// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Animación nativa de carga/subida de datos a la nube (Upload).
class NativeDataUpload extends StatefulWidget {
  final double size;
  final Color cloudColor;
  final Color arrowColor;
  final Duration duration;

  const NativeDataUpload({
    super.key,
    this.size = 56.0,
    this.cloudColor = const Color(0xFF0288D1),
    this.arrowColor = const Color(0xFF2E7D32),
    this.duration = const Duration(milliseconds: 1100),
  });

  @override
  State<NativeDataUpload> createState() => _NativeDataUploadState();
}

class _NativeDataUploadState extends State<NativeDataUpload>
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: _DataUploadPainter(
              progress: _controller.value,
              cloudColor: widget.cloudColor,
              arrowColor: widget.arrowColor,
            ),
          ),
        );
      },
    );
  }
}

class _DataUploadPainter extends CustomPainter {
  final double progress;
  final Color cloudColor;
  final Color arrowColor;

  const _DataUploadPainter({
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

    // Animating Upward Arrow
    final dy = 3.0 - (progress * 6.0);
    final opacity = (1.0 - progress).clamp(0.0, 1.0);

    final arrowPaint = Paint()
      ..color = arrowColor.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    canvas.drawLine(Offset(12, 16 + dy), Offset(12, 9 + dy), arrowPaint);

    final headPath = Path()
      ..moveTo(9, 12 + dy)
      ..lineTo(12, 9 + dy)
      ..lineTo(15, 12 + dy);
    canvas.drawPath(headPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant _DataUploadPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.cloudColor != cloudColor;
}
