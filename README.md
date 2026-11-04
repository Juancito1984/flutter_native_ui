# flutter_native_ui 🎨⚡

Un conjunto de **iconos vectoriales** y **animaciones nativas en Flutter** ultra fluidas (60-120 FPS), sin dependencias pesadas y optimizadas para rendimiento y adaptabilidad a temas claros y oscuros. Desarrollado por **NyK**.

---

## ✨ Características

- 🎯 **Iconos Vectoriales Nativos**: Google, Facebook, Apple, GitHub, Instagram, Twitter/X y más.
- ⚡ **Animaciones Nativas de Alto Rendimiento**:
  - `NativeLoadingSpinner` (Spinner de carga suave con degradado).
  - `NativePulsingHeart` (Corazón pulsante con resplandor difuminado).
  - `NativeBouncingDots` (Puntos saltarines animadas).
  - `NativePulseRipple` (Efecto de onda de pulso/radar).
  - `NativeSkeletonShimmer` (Carga de contenido esqueleto / Shimmer).
- 🎨 **100% Personalizable**: Control total sobre colores, tamaños, velocidades y bordes.
- 🌓 **Adaptativo**: Respeta el tema claro/oscuro (`ThemeData`) automáticamente.

---

## 📦 Instalación

Agrega `flutter_native_ui` a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter_native_ui:
    path: ../path/to/flutter_native_ui  # O versión de pub.dev cuando se publique
```

---

## 💻 Ejemplo de Uso

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui/flutter_native_ui.dart';

class DemonstrationScreen extends StatelessWidget {
  const DemonstrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_native_ui Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Iconos Vectoriales
            GoogleIcon(size: 32),
            FacebookIcon(size: 32),
            AppleIcon(size: 32),
            
            SizedBox(height: 24),
            
            // Animaciones Nativas
            NativeLoadingSpinner(size: 40),
            NativePulsingHeart(size: 48),
            NativeBouncingDots(size: 10),
            NativePulseRipple(size: 60),
          ],
        ),
      ),
    );
  }
}
```
