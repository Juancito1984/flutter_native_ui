// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Animación nativa de carrito de compras con indicador de badge pulsante.
class NativeCartBadgePulse extends StatefulWidget {
  final double size;
  final String count;
  final Color cartColor;
  final Color badgeColor;
  final Duration duration;

  const NativeCartBadgePulse({
    super.key,
    this.size = 48.0,
    this.count = '3',
    this.cartColor = const Color(0xFF1E88E5),
    this.badgeColor = const Color(0xFFE53935),
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<NativeCartBadgePulse> createState() => _NativeCartBadgePulseState();
}

class _NativeCartBadgePulseState extends State<NativeCartBadgePulse>
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
          final scale = 0.95 + (_controller.value * 0.15);

          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: CustomPaint(
                  painter: _CartPainter(cartColor: widget.cartColor),
                ),
              ),
              Positioned(
                top: -2,
                right: -2,
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: widget.badgeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      widget.count,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartPainter extends CustomPainter {
  final Color cartColor;

  const _CartPainter({required this.cartColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cartPaint = Paint()
      ..color = cartColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = cartColor
      ..style = PaintingStyle.fill;

    final cartPath = Path()
      ..moveTo(2, 3)
      ..lineTo(5, 3)
      ..lineTo(8, 14)
      ..lineTo(19, 14)
      ..lineTo(21, 6)
      ..lineTo(6, 6);
    canvas.drawPath(cartPath, cartPaint);

    canvas.drawCircle(const Offset(9, 19), 2.0, wheelPaint);
    canvas.drawCircle(const Offset(18, 19), 2.0, wheelPaint);
  }

  @override
  bool shouldRepaint(covariant _CartPainter oldDelegate) =>
      oldDelegate.cartColor != cartColor;
}
