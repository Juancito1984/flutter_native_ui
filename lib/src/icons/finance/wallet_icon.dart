import 'package:flutter/material.dart';

/// Icono vectorial de billetera digital para finanzas.
class WalletIcon extends StatelessWidget {
  final double size;
  final Color walletColor;

  const WalletIcon({
    super.key,
    this.size = 24.0,
    this.walletColor = const Color(0xFF00897B),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _WalletPainter(walletColor: walletColor),
      ),
    );
  }
}

class _WalletPainter extends CustomPainter {
  final Color walletColor;

  const _WalletPainter({required this.walletColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final walletPaint = Paint()
      ..color = walletColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final claspPaint = Paint()..color = const Color(0xFFFFB300);
    final dotPaint = Paint()..color = const Color(0xFF37474F);

    // Main Wallet Box
    final walletRect = RRect.fromLTRBR(2, 6, 22, 19, const Radius.circular(2.5));
    canvas.drawRRect(walletRect, walletPaint);

    // Wallet Flap
    final flapRect = RRect.fromLTRBR(14, 10, 22, 15, const Radius.circular(1.5));
    canvas.drawRRect(flapRect, claspPaint);

    // Button Snap
    canvas.drawCircle(const Offset(17, 12.5), 1.2, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _WalletPainter oldDelegate) =>
      oldDelegate.walletColor != walletColor;
}
