import 'package:flutter/material.dart';

/// Icono vectorial de Escáner de Código QR.
class QrScannerIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const QrScannerIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _QrScannerIconPainter(color: iconColor),
      ),
    );
  }
}

class _QrScannerIconPainter extends CustomPainter {
  final Color color;

  const _QrScannerIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Corner brackets
    final tl = Path()..moveTo(3.0, 8.0)..lineTo(3.0, 4.0)..lineTo(8.0, 4.0);
    final tr = Path()..moveTo(16.0, 4.0)..lineTo(21.0, 4.0)..lineTo(21.0, 8.0);
    final bl = Path()..moveTo(3.0, 16.0)..lineTo(3.0, 20.0)..lineTo(8.0, 20.0);
    final br = Path()..moveTo(16.0, 20.0)..lineTo(21.0, 20.0)..lineTo(21.0, 16.0);

    canvas.drawPath(tl, strokePaint);
    canvas.drawPath(tr, strokePaint);
    canvas.drawPath(bl, strokePaint);
    canvas.drawPath(br, strokePaint);

    // Scanning Line in Center
    canvas.drawLine(const Offset(5.0, 12.0), const Offset(19.0, 12.0), strokePaint..strokeWidth = 2.0);

    // Inner QR squares
    canvas.drawRect(const Rect.fromLTRB(7.0, 7.0, 9.5, 9.5), fillPaint);
    canvas.drawRect(const Rect.fromLTRB(14.5, 7.0, 17.0, 9.5), fillPaint);
    canvas.drawRect(const Rect.fromLTRB(7.0, 14.5, 9.5, 17.0), fillPaint);
  }

  @override
  bool shouldRepaint(covariant _QrScannerIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
