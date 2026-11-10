# flutter_native_ui_nyk

A complete package of **83 native vector icons** and **32 high-performance Flutter animations (60–120 FPS)**. Built 100% in pure Dart using `CustomPainter` and `AnimationController` with **zero external dependencies** and full Material 3 light & dark theme adaptability.

[![pub package](https://img.shields.io/pub/v/flutter_native_ui_nyk.svg)](https://pub.dev/packages/flutter_native_ui_nyk)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.10.0-02569B?logo=flutter)](https://flutter.dev)

---

## 📚 Documentation by Language / Documentación por Idioma

Select your preferred language to access full component documentation, property tables, architecture technical details, and copy-paste code examples:

* 🇪🇸 **[Documentación Completa en Español (`doc/es/`)](doc/es/README.md)**
  * Guías detalladas de cada icono y animación, tablas de parámetros, optimizaciones en GPU y ejemplos en español.
* 🇺🇸 **[Full English Documentation Hub (`doc/en/`)](doc/en/README.md)**
  * Exhaustive guides for vector icons and animations, properties reference tables, architecture breakdown, and code samples in English.

---

## ☕ Support the Project / Apoya el Proyecto

If this package has been helpful and you'd like to support its ongoing development and maintenance, feel free to contribute:

- 💳 **PayPal**: [paypal.me/NyKservice](https://paypal.me/NyKservice)
- 🅿️ **Patreon**: [patreon.com/JuanPabloGosalvez](https://www.patreon.com/c/JuanPabloGosalvez)

Your support is greatly appreciated to keep this project 100% free, open-source, and constantly evolving!

---

## 🌟 Key Features

- 🚀 **Zero External Dependencies**: Pure native canvas rendering with `CustomPainter` and `AnimationController`.
- 🎯 **83 Native Vector Icons**: Geometrically drawn and crisp at any resolution across 19 industry categories.
- ⚡ **32 Ultra-Smooth Native Animations (60–120 FPS)**: Render layers isolated with `RepaintBoundary` for zero GPU repaint lag.
- 🌓 **Theme Adaptive**: Automatic support for Flutter light and dark theme color schemes (`ThemeData`).
- 📦 **19 Industry Categories**: AI & GenAI, Biometrics & Security, Smart Home, Fitness & Sports, Logistics & GPS, Cloud, Social/Auth, Payments, Engineering, Music, Football, Pharmacy, E-Commerce, Food/Gastronomy, Finance, Travel, Education, Automotive, and System.

---

## 🧩 Component Catalog & Quick Links

| Component / Module | Summary | 🇺🇸 English Docs | 🇪🇸 Documentación ES |
| :--- | :--- | :--- | :--- |
| **`Vector Icons`** | 83 native vector icons across 19 industry categories with custom sizing and coloring | [📖 View Docs](doc/en/vector_icons.md) | [📖 Ver Guía](doc/es/vector_icons.md) |
| **`Native Animations`** | 32 ultra-smooth 60–120 FPS native canvas animations isolated with `RepaintBoundary` | [📖 View Docs](doc/en/native_animations.md) | [📖 Ver Guía](doc/es/native_animations.md) |
| **`Performance & Architecture`** | Hardware rendering, zero external dependencies, matrix scaling & ThemeData adaptability | [📖 View Docs](doc/en/performance_and_architecture.md) | [📖 Ver Guía](doc/es/performance_and_architecture.md) |

---

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_native_ui_nyk: ^1.1.0
```

Run:

```bash
flutter pub get
```

---

## 💻 Quick Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

class QuickDemoPage extends StatelessWidget {
  const QuickDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Native UI Demo'),
        actions: const [
          SparklesIcon(size: 28),
          SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Vector icons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BrainAiIcon(size: 40),
                SizedBox(width: 16),
                FingerprintScanIcon(size: 40),
                SizedBox(width: 16),
                SmartLockIcon(size: 40),
              ],
            ),
            const SizedBox(height: 32),
            
            // Native animations
            const NativeAiThinkingOrbit(size: 56),
            const SizedBox(height: 16),
            const NativeCreditCardNfc(width: 64, height: 42),
            const SizedBox(height: 32),

            // Interactive Shimmer Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: NativeShimmerButton(
                text: 'Sign In with Google',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 📄 License

MIT License - Copyright (c) 2025 **Ing. Juan Pablo Gosalvez (NyK)**.
