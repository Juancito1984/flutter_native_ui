// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Animación nativa de pulso cardíaco / electrocardiograma (ECG) para salud y farmacia.
class NativeHeartbeatPulse extends StatefulWidget {
  final double width;
  final double height;
  final Color lineColor;
  final Duration duration;

  const NativeHeartbeatPulse({
    super.key,
    this.width = 64.0,
    this.height = 36.0,
    this.lineColor = const Color(0xFFE53935),
    this.duration = const Duration(milliseconds: 1400),
  });

  @override
  State<NativeHeartbeatPulse> createState() => _NativeHeartbeatPulseState();
}

class _NativeHeartbeatPulseState extends State<NativeHeartbeatPulse>
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
          width: widget.width,
          height: widget.height,
          child: CustomPaint(
            painter: _HeartbeatPulsePainter(
              progress: _controller.value,
              lineColor: widget.lineColor,
            ),
          ),
        );
      },
    );
  }
}

class _HeartbeatPulsePainter extends CustomPainter {
  final double progress;
  final Color lineColor;

  const _HeartbeatPulsePainter({
    required this.progress,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // ECG Base Line Path
    final fullPath = Path()
      ..moveTo(0, 12)
      ..lineTo(5, 12)
      ..lineTo(7, 8)
      ..lineTo(9, 16)
      ..lineTo(11, 3)
      ..lineTo(14, 20)
      ..lineTo(16, 12)
      ..lineTo(18, 14)
      ..lineTo(20, 12)
      ..lineTo(24, 12);

    // Scan sweep line revealing pulse
    final sweepX = progress * 24.0;

    final bgLinePaint = Paint()
      ..color = lineColor.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    canvas.drawPath(fullPath, bgLinePaint);
    canvas.drawPath(fullPath, linePaint);

    // Active Pulse Dot moving along sweep
    final dotPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(sweepX, 12), 2.2, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _HeartbeatPulsePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.lineColor != lineColor;
}
