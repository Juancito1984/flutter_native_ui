import 'package:flutter/material.dart';

/// Icono vectorial de Reconocimiento Facial / Face ID.
class FaceIdIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const FaceIdIcon({
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
        painter: _FaceIdIconPainter(color: iconColor),
      ),
    );
  }
}

class _FaceIdIconPainter extends CustomPainter {
  final Color color;

  const _FaceIdIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Top Left Corner
    final tl = Path()..moveTo(3.0, 7.0)..lineTo(3.0, 4.0)..lineTo(7.0, 4.0);
    canvas.drawPath(tl, strokePaint);

    // Top Right Corner
    final tr = Path()..moveTo(17.0, 4.0)..lineTo(21.0, 4.0)..lineTo(21.0, 7.0);
    canvas.drawPath(tr, strokePaint);

    // Bottom Left Corner
    final bl = Path()..moveTo(3.0, 17.0)..lineTo(3.0, 20.0)..lineTo(7.0, 20.0);
    canvas.drawPath(bl, strokePaint);

    // Bottom Right Corner
    final br = Path()..moveTo(17.0, 20.0)..lineTo(21.0, 20.0)..lineTo(21.0, 17.0);
    canvas.drawPath(br, strokePaint);

    // Eyes
    canvas.drawLine(const Offset(8.0, 9.0), const Offset(8.0, 11.0), strokePaint);
    canvas.drawLine(const Offset(16.0, 9.0), const Offset(16.0, 11.0), strokePaint);

    // Nose
    final nose = Path()..moveTo(12.0, 10.0)..lineTo(12.0, 13.0)..lineTo(10.5, 13.0);
    canvas.drawPath(nose, strokePaint);

    // Smile
    final smile = Path()
      ..moveTo(8.5, 16.0)
      ..cubicTo(10.0, 17.5, 14.0, 17.5, 15.5, 16.0);
    canvas.drawPath(smile, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _FaceIdIconPainter oldDelegate) =>
      oldDelegate.color != color;
}
