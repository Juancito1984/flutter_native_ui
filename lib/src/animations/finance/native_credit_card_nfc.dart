import 'package:flutter/material.dart';

/// Animación nativa de Tarjeta de Crédito con Ondas NFC / Contactless.
class NativeCreditCardNfc extends StatefulWidget {
  final double width;
  final double height;
  final Color cardColor;
  final Color signalColor;
  final Duration duration;

  const NativeCreditCardNfc({
    super.key,
    this.width = 64.0,
    this.height = 42.0,
    this.cardColor = const Color(0xFF1E88E5),
    this.signalColor = const Color(0xFFFFCA28),
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<NativeCreditCardNfc> createState() => _NativeCreditCardNfcState();
}

class _NativeCreditCardNfcState extends State<NativeCreditCardNfc>
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
            width: widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: _CreditCardNfcPainter(
                progress: _controller.value,
                cardColor: widget.cardColor,
                signalColor: widget.signalColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CreditCardNfcPainter extends CustomPainter {
  final double progress;
  final Color cardColor;
  final Color signalColor;

  const _CreditCardNfcPainter({
    required this.progress,
    required this.cardColor,
    required this.signalColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cardPaint = Paint()
      ..color = cardColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final cardRect = RRect.fromRectAndRadius(
      Rect.fromLTRB(0, size.height * 0.15, size.width * 0.75, size.height * 0.95),
      const Radius.circular(6.0),
    );
    canvas.drawRRect(cardRect, cardPaint);

    // Magnetic Strip / Chip
    final chipPaint = Paint()..color = const Color(0xFFFFD54F);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.1, size.height * 0.35, 10, 8), chipPaint);

    // NFC Wireless Signal Arcs
    final signalPaint = Paint()
      ..color = signalColor.withValues(alpha: (1.0 - progress).clamp(0.2, 1.0))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final cx = size.width * 0.8;
    final cy = size.height * 0.35;
    final r = 6.0 + progress * 14.0;

    canvas.drawArc(Rect.fromCircle(center: Offset(cx, cy), radius: r), -0.8, 1.6, false, signalPaint);
  }

  @override
  bool shouldRepaint(covariant _CreditCardNfcPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.cardColor != cardColor;
}
