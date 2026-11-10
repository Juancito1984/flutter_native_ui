import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de billetera digital/física.
class WalletIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const WalletIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF8D6E63));
    final goldAccent = secondaryColor ?? const Color(0xFFFFCA28);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _WalletPainter(
          primaryColor: primary,
          accentColor: goldAccent,
        ),
      ),
    );
  }
}

class _WalletPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _WalletPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final walletPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final claspFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Body RRect
    final bodyRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(3, 6, 18, 14),
      const Radius.circular(3),
    );
    canvas.drawRRect(bodyRRect, walletPaint);

    // Flap Clasp (Vibrant Gold Accent)
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(14, 10, 7, 6), const Radius.circular(2)),
      claspFill,
    );

    // Clasp Button
    canvas.drawCircle(const Offset(16.5, 13), 1.0, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant _WalletPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
