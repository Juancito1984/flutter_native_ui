# flutter_native_ui 🎨⚡

Un paquete completo de **iconos vectoriales nativos** y **animaciones en Flutter de alto rendimiento** (60-120 FPS), sin dependencias externas pesadas, 100% adaptable a temas claros y oscuros.

---

## 👨‍💻 Autoría / Author

- **Autor / Author**: Ing. Juan Pablo Gosalvez
- **Marca / Brand**: NyK
- **Contacto / Email**: [ingejpablo@gmail.com](mailto:ingejpablo@gmail.com)
- **Licencia / License**: MIT

---

## 🌐 Documentación Completa / Documentation

- 🇪🇸 **[Español (README_ES.md)](README_ES.md)**
- 🇬🇧 **[English (README_EN.md)](README_EN.md)**

---

## ✨ Características / Summary Features

- 🚀 **0 Dependencias Externas**: Renderizado vectorial puro con `CustomPainter` y `AnimationController`.
- 🎯 **15 Iconos Vectoriales Nativos**:
  - 🔥 **Firebase & Cloud**: `FirebaseIcon`, `FirestoreIcon`, `FirebaseAuthIcon`, `CloudStorageIcon`, `DatabaseDisabledIcon`.
  - 📱 **Redes & Auth**: `GoogleIcon`, `FacebookIcon`, `AppleIcon`, `GitHubIcon`, `InstagramIcon`, `TwitterXIcon`, `LinkedInIcon`, `TikTokIcon`, `WhatsAppIcon`, `YouTubeIcon`.
  - 💳 **Pagos**: `VisaIcon`, `MastercardIcon`, `PayPalIcon`.
  - ✦ **UI & Sistema**: `SparklesIcon`, `ShieldCheckIcon`.
- ⚡ **10 Animaciones Nativas (60-120 FPS)**:
  - 🔥 **Firebase & Cloud**: `NativeCloudSync`, `NativeDataUpload`, `NativeDataDownload`, `NativeDatabaseOffline`.
  - 🌀 **Cargadores**: `NativeLoadingSpinner`, `NativePulsingHeart`, `NativePulseRipple`, `NativeBouncingDots`.
  - ✅ **Feedback**: `NativeSuccessCheckmark`, `NativeErrorCross`, `NativeWaveBars`.
  - ✨ **UI Avanzada**: `NativeShimmerButton`, `NativePulseBadge`, `NativeSkeletonShimmer`.

---

## 📦 Instalación / Installation

```bash
flutter pub add flutter_native_ui
```

O agrégalo a tu `pubspec.yaml`:

```yaml
dependencies:
  flutter_native_ui: ^0.3.0
```

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui/flutter_native_ui.dart';

class QuickDemo extends StatelessWidget {
  const QuickDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Iconos Firebase y Redes
            FirebaseIcon(size: 36),
            GoogleIcon(size: 36),
            
            SizedBox(height: 20),
            
            // Animaciones Nativas
            NativeCloudSync(size: 48),
            NativeLoadingSpinner(size: 40),
            NativePulsingHeart(size: 44),
          ],
        ),
      ),
    );
  }
}
```

---

## 📄 Licencia / License

MIT License - Copyright (c) 2025 **Ing. Juan Pablo Gosalvez (NyK)**.
