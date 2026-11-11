# flutter_native_ui_nyk

A complete package of **83 native vector icons** and **32 high-performance Flutter animations (60–120 FPS)**. Built 100% in pure Dart using `CustomPainter` and `AnimationController` with **zero external dependencies**, central IDE autocompletion via **`NativeIcons`** & **`NativeAnimations`**, and full Material 3 light & dark theme adaptability.

[![pub package](https://img.shields.io/pub/v/flutter_native_ui_nyk.svg)](https://pub.dev/packages/flutter_native_ui_nyk)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.10.0-02569B?logo=flutter)](https://flutter.dev)

---

## 📚 Documentation by Language / Documentación por Idioma

Select your preferred language to access full component documentation, property tables, architecture technical details, and copy-paste code examples:

* 🇪🇸 **[Documentación Completa en Español (`doc/es/`)](doc/es/README.md)**
  * Guías detalladas de cada icono y animación, catálogo `NativeIcons` / `NativeAnimations`, tablas de parámetros y ejemplos.
* 🇺🇸 **[Full English Documentation Hub (`doc/en/`)](doc/en/README.md)**
  * Exhaustive guides for vector icons and animations, `NativeIcons` / `NativeAnimations` catalog, property tables, and code samples.

---

## ☕ Support the Project / Apoya el Proyecto

If this package has been helpful and you'd like to support its ongoing development and maintenance, feel free to contribute:

- 💳 **PayPal**: [paypal.me/NyKservice](https://paypal.me/NyKservice)
- 🅿️ **Patreon**: [patreon.com/JuanPabloGosalvez](https://www.patreon.com/c/JuanPabloGosalvez)

Your support is greatly appreciated to keep this project 100% free, open-source, and constantly evolving!

---

## 🌟 Key Features

- 🚀 **Zero External Dependencies**: Pure native canvas rendering with `CustomPainter` and `AnimationController`.
- 💡 **Central IDE Autocompletion (`NativeIcons` & `NativeAnimations`)**: Instant IntelliSense code completion in Android Studio & VS Code.
- 🎯 **83 Native Vector Icons**: Geometrically drawn and crisp at any resolution across 19 industry categories with optional `color` & `secondaryColor` bi-tone support.
- ⚡ **32 Ultra-Smooth Native Animations (60–120 FPS)**: Render layers isolated with `RepaintBoundary` for zero GPU repaint lag.
- 🌓 **Theme Adaptive**: Automatic bi-tone vivid light mode & sleek high-contrast flat dark mode integration (`ThemeData`).
- 📦 **19 Industry Categories**: AI & GenAI, Biometrics & Security, Smart Home, Fitness & Sports, Logistics & GPS, Cloud, Social/Auth, Payments, Engineering, Music, Football, Pharmacy, E-Commerce, Food/Gastronomy, Finance, Travel, Education, Automotive, and System.

---

## 🧩 Component Catalog & Quick Links

| Component / Module | Summary | 🇺🇸 English Docs | 🇪🇸 Documentación ES |
| :--- | :--- | :--- | :--- |
| **`NativeIcons` Catalog** | Access all 83 native vector icons via `NativeIcons.name(...)` with IDE autocompletion | [📖 View Docs](doc/en/vector_icons.md) | [📖 Ver Guía](doc/es/vector_icons.md) |
| **`NativeAnimations` Catalog** | Access all 32 60–120 FPS native animations via `NativeAnimations.name(...)` with IDE autocompletion | [📖 View Docs](doc/en/native_animations.md) | [📖 Ver Guía](doc/es/native_animations.md) |
| **`Performance & Architecture`** | Hardware rendering, zero external dependencies, matrix scaling & ThemeData adaptability | [📖 View Docs](doc/en/performance_and_architecture.md) | [📖 Ver Guía](doc/es/performance_and_architecture.md) |

---

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_native_ui_nyk: ^1.1.2
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
        actions: [
          // Access via Central NativeIcons Catalog with IDE autocompletion
          NativeIcons.sparkles(size: 28),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IDE Autocomplete Icons (NativeIcons.name)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NativeIcons.brainAi(size: 40),
                const SizedBox(width: 16),
                NativeIcons.fingerprintScan(size: 40, color: Colors.blue, secondaryColor: Colors.amber),
                const SizedBox(width: 16),
                NativeIcons.smartLock(size: 40),
              ],
            ),
            const SizedBox(height: 32),
            
            // IDE Autocomplete Animations (NativeAnimations.name)
            NativeAnimations.aiThinkingOrbit(size: 56),
            const SizedBox(height: 16),
            NativeAnimations.creditCardNfc(width: 64, height: 42),
            const SizedBox(height: 32),

            // Shimmer Action Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: NativeAnimations.shimmerButton(
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
