import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de sincronización en la nube (Cloud Sync).
class NativeCloudSync extends StatefulWidget {
  final double size;
  final Color cloudColor;
  final Color syncColor;
  final Duration duration;

  const NativeCloudSync({
    super.key,
    this.size = 56.0,
    this.cloudColor = const Color(0xFF0288D1),
    this.syncColor = const Color(0xFFFFCA28),
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<NativeCloudSync> createState() => _NativeCloudSyncState();
}

class _NativeCloudSyncState extends State<NativeCloudSync>
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
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _CloudSyncPainter(
                angle: _controller.value * 2 * math.pi,
                cloudColor: widget.cloudColor,
                syncColor: widget.syncColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CloudSyncPainter extends CustomPainter {
  final double angle;
  final Color cloudColor;
  final Color syncColor;

  const _CloudSyncPainter({
    required this.angle,
    required this.cloudColor,
    required this.syncColor,
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

    // Rotating Sync Arrows in Center
    canvas.save();
    canvas.translate(12, 13);
    canvas.rotate(angle);

    final syncPaint = Paint()
      ..color = syncColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    const rect = Rect.fromLTRB(-4, -4, 4, 4);
    canvas.drawArc(rect, 0, 2.3, false, syncPaint);
    canvas.drawArc(rect, 3.14, 2.3, false, syncPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _CloudSyncPainter oldDelegate) =>
      oldDelegate.angle != angle || oldDelegate.cloudColor != cloudColor;
}
