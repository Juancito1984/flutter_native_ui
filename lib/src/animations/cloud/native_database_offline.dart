import 'package:flutter/material.dart';

/// Animación nativa de Base de Datos Fuera de Línea / Desconectada.
class NativeDatabaseOffline extends StatefulWidget {
  final double size;
  final Color? dbColor;
  final Color? alertColor;
  final Duration duration;

  const NativeDatabaseOffline({
    super.key,
    this.size = 56.0,
    this.dbColor,
    this.alertColor,
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primaryDb = widget.dbColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF757575));
    final activeAlert = widget.alertColor ?? (isDark ? theme.colorScheme.error : const Color(0xFFD32F2F));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _DatabaseOfflinePainter(
                alertAlpha: 0.4 + (_controller.value * 0.6),
                dbColor: primaryDb,
                alertColor: activeAlert,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DatabaseOfflinePainter extends CustomPainter {
  final double alertAlpha;
  final Color dbColor;
  final Color alertColor;

  const _DatabaseOfflinePainter({
    required this.alertAlpha,
    required this.dbColor,
    required this.alertColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final dbPaint = Paint()
      ..color = dbColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    // Cylinder 1 (Top)
    canvas.drawOval(const Rect.fromLTWH(4, 3, 16, 6), dbPaint);

    // Cylinder 2 (Middle)
    final p2 = Path()
      ..moveTo(4, 6)
      ..lineTo(4, 12)
      ..cubicTo(4, 15, 20, 15, 20, 12)
      ..lineTo(20, 6);
    canvas.drawPath(p2, dbPaint);

    // Cylinder 3 (Bottom)
    final p3 = Path()
      ..moveTo(4, 12)
      ..lineTo(4, 18)
      ..cubicTo(4, 21, 20, 21, 20, 18)
      ..lineTo(20, 12);
    canvas.drawPath(p3, dbPaint);

    // Pulsing Red Slash Off Line
    final alertPaint = Paint()
      ..color = alertColor.withValues(alpha: alertAlpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawLine(const Offset(3, 3), const Offset(21, 21), alertPaint);
  }

  @override
  bool shouldRepaint(covariant _DatabaseOfflinePainter oldDelegate) =>
      oldDelegate.alertAlpha != alertAlpha || oldDelegate.dbColor != dbColor || oldDelegate.alertColor != alertColor;
}
