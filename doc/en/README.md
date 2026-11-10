# 📚 English Documentation - flutter_native_ui_nyk

A comprehensive, high-performance Material 3 **Native Vector Icons & 60–120 FPS Animations Suite** for Flutter. Built 100% in pure Dart using `CustomPainter` and `AnimationController` with **zero external dependencies**, central IDE autocompletion via **`NativeIcons`** and **`NativeAnimations`**, and full light & dark theme adaptability.

[![pub package](https://img.shields.io/pub/v/flutter_native_ui_nyk.svg)](https://pub.dev/packages/flutter_native_ui_nyk)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.10.0-02569B?logo=flutter)](https://flutter.dev)

*🌍 [Ver Documentación en Español](../es/README.md) | [🏠 Main Cover](../../README.md)*

---

## 🌟 Key Features

- 🚀 **Zero External Dependencies**: Pure native canvas rendering with `CustomPainter` and `AnimationController` with zero SVG parsing overhead or external fonts.
- 💡 **IDE Autocompletion (`NativeIcons` & `NativeAnimations`)**: Access all components via `NativeIcons.name(...)` and `NativeAnimations.name(...)` with instant IntelliSense code completion.
- 🎯 **83 Native Vector Icons**: Geometrically drawn and scalable without quality loss across 19 industry categories with optional `color` and `secondaryColor` bi-tone parameters.
- ⚡ **32 Ultra-Smooth Native Animations (60–120 FPS)**: Isolated rendering layers using `RepaintBoundary` for zero GPU repaint lag.
- 🌓 **ThemeData Adaptive**: Automatic vivid bi-tone light mode and sleek high-contrast flat dark mode support.
- 📦 **19 Industry Categories**: AI & GenAI, Biometrics & Security, Smart Home, Fitness & Sports, Logistics & GPS, Cloud, Social/Auth, Payments, Engineering, Music, Football, Pharmacy, E-Commerce, Food/Gastronomy, Finance, Travel, Education, Automotive, and System.

---

## 🧩 Complete Module Catalog & Individual Guides

Explore the dedicated technical documentation, property tables, and copy-paste code examples for each section:

| Module | Source File | Full Documentation | Summary of Functionality |
| :--- | :--- | :--- | :--- |
| **`NativeIcons`** | [`src/icons/`](../../lib/src/icons/) | [📖 Vector Icons Guide](vector_icons.md) | Catalog of 83 native vector icons categorized into 19 industry groups with IDE autocompletion, `size`, `color`, and `secondaryColor` parameters. |
| **`NativeAnimations`** | [`src/animations/`](../../lib/src/animations/) | [📖 Native Animations Guide](native_animations.md) | Catalog of 32 ultra-smooth 60–120 FPS native canvas animations isolated with `RepaintBoundary`, `AnimationController`, `color`, and `duration`. |
| **`Performance & Architecture`** | [`lib/src/`](../../lib/src/) | [📖 Architecture Guide](performance_and_architecture.md) | GPU layer composition, zero dependencies, matrix vector scaling, and memory lifecycle management. |

---

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_native_ui_nyk: ^1.1.1
```

Run:

```bash
flutter pub get
```

---

## 💻 Quick Code Examples

### 1. Vector Icons Usage via `NativeIcons` Catalog (IDE Autocompletion)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

Widget iconRow() {
  return Row(
    children: [
      // 1. Automatic bi-tone theme adaptation:
      NativeIcons.brainAi(size: 36),

      // 2. Custom primary and secondary colors:
      NativeIcons.fingerprintScan(
        size: 36, 
        color: Colors.blue, 
        secondaryColor: Colors.amber,
      ),
      NativeIcons.smartLock(size: 36),
      NativeIcons.dumbbell(size: 36),
    ],
  );
}
```

---

### 2. Native Animations Usage via `NativeAnimations` Catalog (IDE Autocompletion)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

Widget syncWidget() {
  return Column(
    children: [
      NativeAnimations.aiThinkingOrbit(size: 64),
      const SizedBox(height: 16),
      NativeAnimations.creditCardNfc(width: 64, height: 42),
    ],
  );
}
```

---

## ☕ Support the Project

If this package has been helpful and you'd like to support its ongoing development and maintenance, feel free to contribute:

- 💳 **PayPal**: [paypal.me/NyKservice](https://paypal.me/NyKservice)
- 🅿️ **Patreon**: [patreon.com/JuanPabloGosalvez](https://www.patreon.com/c/JuanPabloGosalvez)

---

## 👨‍💻 Authorship & Credits

- **Author**: Ing. Juan Pablo Gosalvez
- **Brand**: NyK
- **Contact**: [ingejpablo@gmail.com](mailto:ingejpablo@gmail.com)
- **License**: MIT
