import 'package:flutter/material.dart';

/// Animación nativa de pulso de electrocardiograma (ECG / Latido).
class NativeHeartbeatPulse extends StatefulWidget {
  final double width;
  final double height;
  final Color? lineColor;
  final Duration duration;

  const NativeHeartbeatPulse({
    super.key,
    this.width = 54.0,
    this.height = 36.0,
    this.lineColor,
    this.duration = const Duration(milliseconds: 1500),
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final activeColor = widget.lineColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFE53935));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: _HeartbeatPulsePainter(
                progress: _controller.value,
                lineColor: activeColor,
              ),
            ),
          );
        },
      ),
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
    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final path = Path();
    final midY = size.height / 2;
    final w = size.width;

    path.moveTo(0, midY);
    path.lineTo(w * 0.25, midY);
    path.lineTo(w * 0.35, midY - size.height * 0.35);
    path.lineTo(w * 0.45, midY + size.height * 0.4);
    path.lineTo(w * 0.55, midY - size.height * 0.45);
    path.lineTo(w * 0.65, midY + size.height * 0.2);
    path.lineTo(w * 0.75, midY);
    path.lineTo(w, midY);

    // Glowing Pulse Head Dot
    final dotX = progress * w;
    canvas.drawPath(path, linePaint);
    canvas.drawCircle(Offset(dotX, midY), 3.0, Paint()..color = lineColor);
  }

  @override
  bool shouldRepaint(covariant _HeartbeatPulsePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.lineColor != lineColor;
}
