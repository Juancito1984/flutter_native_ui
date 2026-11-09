# 🏗️ Technical Architecture & Performance

The **`flutter_native_ui_nyk`** package was designed under strict principles of **high graphic performance, zero external dependencies, and optimized memory consumption**.

---

## ⚡ Graphic Design Principles

### 1. Zero Runtime Parsing Overhead (0 SVG / 0 TTF)
Most icon and animation libraries rely on runtime XML/SVG parsers (such as `flutter_svg`) or Lottie JSON files. This introduces:
- Continuous CPU decoding and parsing.
- Substantial increase in APK/IPA binary size.
- Initial frame drops during asset initialization.

**`flutter_native_ui_nyk`** solves this via **pure Dart code**, issuing vector geometric drawing commands (`Path`, `drawArc`, `drawRRect`, `drawCircle`) directly onto Flutter's `Canvas`.

---

## 🛡️ Isolated Rendering Layer via `RepaintBoundary`

In Flutter, when a widget requests a repaint (e.g., via `AnimationController.addListener`), by default it can invalidate the render layer of its ancestor widgets in the hierarchy.

To prevent this, **all 24 native animations** are internally wrapped in a `RepaintBoundary`:

```dart
@override
Widget build(BuildContext context) {
  return RepaintBoundary(
    child: AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _MyAnimatedPainter(_controller.value),
        );
      },
    ),
  );
}
```

### Technical Benefits:
- **Dedicated GPU Layer**: Animations execute on their own composited layer.
- **Constant 60 to 120 FPS**: The main UI widget tree experiences no rebuilds or repaints as the animation oscillates.

---

## 📐 Responsive Vector Matrix Scaling

All vector components use a reference canvas coordinate system of `24.0 x 24.0` (or `48.0 x 48.0`).

Inside the `paint(Canvas canvas, Size size)` method of each `CustomPainter`, a matrix scale transformation is applied:

```dart
final scale = size.width / 24.0;
canvas.scale(scale, scale);
```

This ensures that the icon or animation maintains exact proportions regardless of whether it is rendered at `16px` or `512px`.

---

## 🧼 Memory Management & Lifecycle

- **Animation Disposal**: `AnimationController` instances are bound to the widget lifecycle via `SingleTickerProviderStateMixin` and explicitly disposed in `dispose()`:

```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

- **Delegate Reuse (`shouldRepaint`)**: `CustomPainter` implementations use efficient checks in `shouldRepaint` to avoid re-running draw algorithms if properties remain unchanged.

---

## 🌗 Automatic ThemeData Integration

Components sample theme context via `Theme.of(context)` passively:
- If no explicit color is passed, icons default to the theme color scheme (`colorScheme.primary` or `onSurface`).
- Full compatibility with **Material 3**, dark mode, and light mode.
