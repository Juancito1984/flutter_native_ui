# 📚 Documentación en Español - flutter_native_ui_nyk

Una suite completa de **66 iconos vectoriales nativos** y **24 animaciones en Flutter de alto rendimiento (60–120 FPS)**, desarrollada 100% en Dart nativo con `CustomPainter` y `AnimationController`, **sin dependencias externas pesadas** y adaptable a temas claros y oscuros.

[![pub package](https://img.shields.io/pub/v/flutter_native_ui_nyk.svg)](https://pub.dev/packages/flutter_native_ui_nyk)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.10.0-02569B?logo=flutter)](https://flutter.dev)

*🌍 [Switch to English Documentation](../en/README.md) | [🏠 Portada Principal](../../README.md)*

---

## 🌟 Características Principales

- 🚀 **0 Dependencias Externas**: Renderizado nativo en Canvas con `CustomPainter` y `AnimationController` sin sobrecarga de SVGs ni parseo pesado en tiempo de ejecución.
- 🎯 **66 Iconos Vectoriales Nativos**: Diseñados geométricamente y escalables sin pérdida de nitidez a cualquier resolución.
- ⚡ **24 Animaciones Nativas Ultra Fluidas (60–120 FPS)**: Renderizado optimizado con `RepaintBoundary` para aislar el repintado en la GPU.
- 🌓 **100% Adaptable a ThemeData**: Soporte automático para esquemas de colores claros y oscuros de Flutter.
- 📦 **14 Categorías de Industria**: Cloud, Social/Auth, Pagos, Ingeniería, Música, Fútbol, Farmacia, E-Commerce, Gastronomía, Finanzas, Viajes, Educación, Automotriz y Sistema.

---

## 🧩 Catálogo de Módulos y Documentación Individual

A continuación tienes acceso a la guía técnica detallada de cada sección con sus tablas de propiedades, explicaciones y ejemplos:

| Módulo | Archivo Fuente | Documentación Completa | Resumen de Funcionalidad |
| :--- | :--- | :--- | :--- |
| **`Vector Icons`** | [`src/icons/`](../../lib/src/icons/) | [📖 Guía de Iconos Vectoriales](vector_icons.md) | 66 iconos vectoriales nativos organizados en 14 categorías industriales con `size` y `color`. |
| **`Native Animations`** | [`src/animations/`](../../lib/src/animations/) | [📖 Guía de Animaciones Nativas](native_animations.md) | 24 animaciones nativas a 60–120 FPS aisladas con `RepaintBoundary` y `AnimationController`. |
| **`Performance & Architecture`** | [`lib/src/`](../../lib/src/) | [📖 Guía de Arquitectura](performance_and_architecture.md) | Explicación técnica de renderizado en GPU, cero dependencias y matriz de escalado. |

---

## 🚀 Instalación

Agrega la dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter_native_ui_nyk: ^1.0.1
```

Ejecuta en la terminal:

```bash
flutter pub get
```

---

## 💻 Ejemplos de Integración Rápida

### 1. Uso de Iconos Vectoriales Nativos

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

Widget listaDeIconos() {
  return const Row(
    children: [
      FirebaseIcon(size: 36),
      ShoppingBagIcon(size: 36),
      CoffeeCupIcon(size: 36),
      VisaIcon(size: 36),
    ],
  );
}
```

---

### 2. Animaciones Nativas e Interactivas

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

Widget estadoSincronizacion() {
  return const Column(
    children: [
      NativeCloudSync(size: 64),
      SizedBox(height: 16),
      NativeCoffeeSteam(size: 64),
    ],
  );
}
```

---

## ☕ Apoya el Proyecto

Si este paquete te ha sido útil y deseas apoyar su desarrollo continuo, mantenimiento y la incorporación de nuevos iconos y animaciones, puedes realizar una contribución voluntaria:

- 💳 **PayPal**: [paypal.me/NyKservice](https://paypal.me/NyKservice)
- 🅿️ **Patreon**: [patreon.com/JuanPabloGosalvez](https://www.patreon.com/c/JuanPabloGosalvez)

---

## 👨‍💻 Autoría y Créditos

- **Autor**: Ing. Juan Pablo Gosalvez
- **Marca**: NyK
- **Contacto**: [ingejpablo@gmail.com](mailto:ingejpablo@gmail.com)
- **Licencia**: MIT
