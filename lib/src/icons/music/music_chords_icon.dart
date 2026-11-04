import 'package:flutter/material.dart';

/// Icono vectorial de acordes/diagrama de guitarra o teclado para música.
class MusicChordsIcon extends StatelessWidget {
  final double size;
  final Color gridColor;
  final Color dotColor;

  const MusicChordsIcon({
    super.key,
    this.size = 24.0,
    this.gridColor = const Color(0xFF78909C),
    this.dotColor = const Color(0xFF9C27B0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _MusicChordsPainter(
          gridColor: gridColor,
          dotColor: dotColor,
        ),
      ),
    );
  }
}

class _MusicChordsPainter extends CustomPainter {
  final Color gridColor;
  final Color dotColor;

  const _MusicChordsPainter({
    required this.gridColor,
    required this.dotColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final gridPaint = Paint()
      ..color = gridColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..isAntiAlias = true;

    final nutPaint = Paint()
      ..color = gridColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..isAntiAlias = true;

    final dotPaint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Fretboard Grid Nut (Top)
    canvas.drawLine(const Offset(5, 5), const Offset(19, 5), nutPaint);

    // Vertical Strings (4 Cuerdas)
    canvas.drawLine(const Offset(6, 5), const Offset(6, 20), gridPaint);
    canvas.drawLine(const Offset(10, 5), const Offset(10, 20), gridPaint);
    canvas.drawLine(const Offset(14, 5), const Offset(14, 20), gridPaint);
    canvas.drawLine(const Offset(18, 5), const Offset(18, 20), gridPaint);

    // Horizontal Frets (Trastes)
    canvas.drawLine(const Offset(5, 10), const Offset(19, 10), gridPaint);
    canvas.drawLine(const Offset(5, 15), const Offset(19, 15), gridPaint);
    canvas.drawLine(const Offset(5, 20), const Offset(19, 20), gridPaint);

    // Chord Dots (Posiciones del acorde)
    canvas.drawCircle(const Offset(10, 7.5), 1.8, dotPaint);
    canvas.drawCircle(const Offset(14, 12.5), 1.8, dotPaint);
    canvas.drawCircle(const Offset(18, 12.5), 1.8, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _MusicChordsPainter oldDelegate) =>
      oldDelegate.gridColor != gridColor || oldDelegate.dotColor != dotColor;
}
