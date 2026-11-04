import 'package:flutter/material.dart';

/// Icono vectorial de partitura y notas musicales.
class MusicSheetIcon extends StatelessWidget {
  final double size;
  final Color sheetColor;
  final Color noteColor;

  const MusicSheetIcon({
    super.key,
    this.size = 24.0,
    this.sheetColor = const Color(0xFFE0E0E0),
    this.noteColor = const Color(0xFFE91E63),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _MusicSheetPainter(
          sheetColor: sheetColor,
          noteColor: noteColor,
        ),
      ),
    );
  }
}

class _MusicSheetPainter extends CustomPainter {
  final Color sheetColor;
  final Color noteColor;

  const _MusicSheetPainter({
    required this.sheetColor,
    required this.noteColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final linePaint = Paint()
      ..color = sheetColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final notePaint = Paint()
      ..color = noteColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final stemPaint = Paint()
      ..color = noteColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..isAntiAlias = true;

    // Staff lines (Partitura 5 líneas)
    canvas.drawLine(const Offset(3, 6), const Offset(21, 6), linePaint);
    canvas.drawLine(const Offset(3, 9), const Offset(21, 9), linePaint);
    canvas.drawLine(const Offset(3, 12), const Offset(21, 12), linePaint);
    canvas.drawLine(const Offset(3, 15), const Offset(21, 15), linePaint);
    canvas.drawLine(const Offset(3, 18), const Offset(21, 18), linePaint);

    // Eighth Note 1
    canvas.drawCircle(const Offset(8, 16.5), 2.2, notePaint);
    canvas.drawLine(const Offset(10, 16.5), const Offset(10, 8), stemPaint);

    // Eighth Note 2
    canvas.drawCircle(const Offset(16, 13.5), 2.2, notePaint);
    canvas.drawLine(const Offset(18, 13.5), const Offset(18, 5), stemPaint);

    // Beam connecting the 2 notes
    final beamPaint = Paint()
      ..color = noteColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..isAntiAlias = true;
    canvas.drawLine(const Offset(10, 8), const Offset(18, 5), beamPaint);
  }

  @override
  bool shouldRepaint(covariant _MusicSheetPainter oldDelegate) =>
      oldDelegate.sheetColor != sheetColor || oldDelegate.noteColor != noteColor;
}
