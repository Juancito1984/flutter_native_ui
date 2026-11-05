// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Animación nativa de base de datos offline/desactivada con alerta.
class NativeDatabaseOffline extends StatefulWidget {
  final double size;
  final Duration duration;

  const NativeDatabaseOffline({
    super.key,
    this.size = 56.0,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<NativeDatabaseOffline> createState() => _NativeDatabaseOfflineState();
}

class _NativeDatabaseOfflineState extends State<NativeDatabaseOffline>
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
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _DatabaseOfflinePainter(
                alertOpacity: 0.3 + (_controller.value * 0.7),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DatabaseOfflinePainter extends CustomPainter {
  final double alertOpacity;

  const _DatabaseOfflinePainter({required this.alertOpacity});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final dbPaint = Paint()
      ..color = const Color(0xFF757575)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;

    canvas.drawOval(const Rect.fromLTWH(4, 3, 16, 6), dbPaint);

    final p2 = Path()
      ..moveTo(4, 6)
      ..lineTo(4, 12)
      ..cubicTo(4, 15, 20, 15, 20, 12)
      ..lineTo(20, 6);
    canvas.drawPath(p2, dbPaint);

    final p3 = Path()
      ..moveTo(4, 12)
      ..lineTo(4, 18)
      ..cubicTo(4, 21, 20, 21, 20, 18)
      ..lineTo(20, 12);
    canvas.drawPath(p3, dbPaint);

    // Pulsing Red Warning Slash
    final alertPaint = Paint()
      ..color = const Color(0xFFD32F2F).withOpacity(alertOpacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawLine(const Offset(3, 3), const Offset(21, 21), alertPaint);
  }

  @override
  bool shouldRepaint(covariant _DatabaseOfflinePainter oldDelegate) =>
      oldDelegate.alertOpacity != alertOpacity;
}
