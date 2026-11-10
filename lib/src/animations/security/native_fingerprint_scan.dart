import 'package:flutter/material.dart';

/// Animación nativa de Escaneo de Huella Dactilar por Láser.
class NativeFingerprintScan extends StatefulWidget {
  final double size;
  final Color fingerprintColor;
  final Color laserColor;
  final Duration duration;

  const NativeFingerprintScan({
    super.key,
    this.size = 56.0,
    this.fingerprintColor = const Color(0xFF0288D1),
    this.laserColor = const Color(0xFF00E676),
    this.duration = const Duration(milliseconds: 1800),
  });

  @override
  State<NativeFingerprintScan> createState() => _NativeFingerprintScanState();
}

class _NativeFingerprintScanState extends State<NativeFingerprintScan>
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
              painter: _FingerprintScanPainter(
                laserY: _controller.value * widget.size,
                fingerprintColor: widget.fingerprintColor,
                laserColor: widget.laserColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FingerprintScanPainter extends CustomPainter {
  final double laserY;
  final Color fingerprintColor;
  final Color laserColor;

  const _FingerprintScanPainter({
    required this.laserY,
    required this.fingerprintColor,
    required this.laserColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final fpPaint = Paint()
      ..color = fingerprintColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Fingerprint Arcs
    canvas.drawArc(const Rect.fromLTRB(4.0, 4.0, 20.0, 20.0), -2.8, 4.2, false, fpPaint);
    canvas.drawArc(const Rect.fromLTRB(7.0, 7.0, 17.0, 17.0), -2.8, 3.8, false, fpPaint);
    canvas.drawArc(const Rect.fromLTRB(10.0, 10.0, 14.0, 14.0), -2.8, 3.2, false, fpPaint);

    // Animated Laser Line
    final laserPaint = Paint()
      ..color = laserColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..isAntiAlias = true;

    final ly = laserY / scale;
    canvas.drawLine(Offset(2.0, ly), Offset(22.0, ly), laserPaint);
  }

  @override
  bool shouldRepaint(covariant _FingerprintScanPainter oldDelegate) =>
      oldDelegate.laserY != laserY || oldDelegate.laserColor != laserColor;
}
