import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Escáner de Código QR.
class QrScannerIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const QrScannerIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);
    final laserAccent = secondaryColor ?? const Color(0xFF00E676);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _QrScannerIconPainter(
          primaryColor: primary,
          accentColor: laserAccent,
        ),
      ),
    );
  }
}

class _QrScannerIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _QrScannerIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bracketStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final laserStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final qrFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Corner brackets
    final tl = Path()..moveTo(3.0, 8.0)..lineTo(3.0, 4.0)..lineTo(8.0, 4.0);
    final tr = Path()..moveTo(16.0, 4.0)..lineTo(21.0, 4.0)..lineTo(21.0, 8.0);
    final bl = Path()..moveTo(3.0, 16.0)..lineTo(3.0, 20.0)..lineTo(8.0, 20.0);
    final br = Path()..moveTo(16.0, 20.0)..lineTo(21.0, 20.0)..lineTo(21.0, 16.0);

    canvas.drawPath(tl, bracketStroke);
    canvas.drawPath(tr, bracketStroke);
    canvas.drawPath(bl, bracketStroke);
    canvas.drawPath(br, bracketStroke);

    // Scanning Line in Center (Vibrant Laser Accent)
    canvas.drawLine(const Offset(5.0, 12.0), const Offset(19.0, 12.0), laserStroke);

    // Inner QR squares
    canvas.drawRect(const Rect.fromLTRB(7.0, 7.0, 9.5, 9.5), qrFill);
    canvas.drawRect(const Rect.fromLTRB(14.5, 7.0, 17.0, 9.5), qrFill);
    canvas.drawRect(const Rect.fromLTRB(7.0, 14.5, 9.5, 17.0), qrFill);
  }

  @override
  bool shouldRepaint(covariant _QrScannerIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
