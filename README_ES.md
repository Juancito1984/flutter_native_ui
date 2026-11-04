# flutter_native_ui 🎨⚡

Un paquete completo de **iconos vectoriales nativos** y **animaciones en Flutter de alto rendimiento** (60-120 FPS), sin dependencias externas pesadas, 100% adaptable a temas claros y oscuros.

---

## 👨‍💻 Autoría y Créditos

- **Autor**: Ing. Juan Pablo Gosalvez
- **Marca**: NyK
- **Contacto**: [ingejpablo@gmail.com](mailto:ingejpablo@gmail.com)
- **Licencia**: MIT

---

## 🌐 Idioma / Language

- [Español (README_ES.md)](README_ES.md)
- [English (README_EN.md)](README_EN.md)

---

## ✨ Características Principales

- 🚀 **0 Dependencias Externas**: Renderizado nativo puro con `CustomPainter` y `AnimationController`.
- 🎯 **15 Iconos Vectoriales Nativos**:
  - **Firebase & Nube**: `FirebaseIcon`, `FirestoreIcon`, `FirebaseAuthIcon`, `CloudStorageIcon`, `DatabaseDisabledIcon`.
  - **Redes & Autenticación**: `GoogleIcon`, `FacebookIcon`, `AppleIcon`, `GitHubIcon`, `InstagramIcon`, `TwitterXIcon`, `LinkedInIcon`, `TikTokIcon`, `WhatsAppIcon`, `YouTubeIcon`.
  - **Pasarelas de Pago**: `VisaIcon`, `MastercardIcon`, `PayPalIcon`.
  - **UI & Sistema**: `SparklesIcon` (IA / Magia), `ShieldCheckIcon` (Seguridad / Verificado).
- ⚡ **10 Animaciones Nativas Ultra Fluidas (60-120 FPS)**:
  - **Firebase & Nube**: `NativeCloudSync`, `NativeDataUpload`, `NativeDataDownload`, `NativeDatabaseOffline`.
  - **Spinners y Cargadores**: `NativeLoadingSpinner`, `NativePulsingHeart`, `NativePulseRipple`, `NativeBouncingDots`.
  - **Retroalimentación (Feedback)**: `NativeSuccessCheckmark`, `NativeErrorCross`, `NativeWaveBars`.
  - **UI Interactivas**: `NativeShimmerButton` (Botón destello metálico), `NativePulseBadge` (Insignia con halo), `NativeSkeletonShimmer` (Esqueleto de carga).
- 🌓 **Adaptativo**: Colores configurables y soporte automático para temas claros y oscuros (`ThemeData`).

---

## 📦 Instalación

Agrega `flutter_native_ui` a las dependencias de tu proyecto con el siguiente comando:

```bash
flutter pub add flutter_native_ui
```

O agrégalo manualmente a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter_native_ui: ^0.3.0
```

Luego ejecuta en tu terminal:

```bash
flutter pub get
```

---

## 💻 Guía de Uso

### 1. Importación
```dart
import 'package:flutter_native_ui/flutter_native_ui.dart';
```

---

### 2. Uso de Iconos Vectoriales
```dart
// Iconos de Firebase y Nube
const FirebaseIcon(size: 36)
const FirestoreIcon(size: 36)
const FirebaseAuthIcon(size: 36)
const CloudStorageIcon(size: 36)
const DatabaseDisabledIcon(size: 36)

// Iconos de Redes y Autenticación
const GoogleIcon(size: 32)
const FacebookIcon(size: 32)
const AppleIcon(size: 32)
const GitHubIcon(size: 32)
const InstagramIcon(size: 32)
const TwitterXIcon(size: 32)
const LinkedInIcon(size: 32)
const TikTokIcon(size: 32)
const WhatsAppIcon(size: 32)
const YouTubeIcon(size: 32)

// Pagos
const VisaIcon(size: 40)
const MastercardIcon(size: 40)
const PayPalIcon(size: 40)

// UI
const SparklesIcon(size: 32, color: Colors.amber)
const ShieldCheckIcon(size: 32, color: Colors.green)
```

---

### 3. Uso de Animaciones Nativas

#### A. Firebase & Sincronización en Nube
```dart
// Sincronización continua de datos
const NativeCloudSync(size: 48)

// Subida / Guardado de datos
const NativeDataUpload(size: 48)

// Descarga / Consulta de datos
const NativeDataDownload(size: 48)

// Base de datos desconectada / offline
const NativeDatabaseOffline(size: 48)
```

#### B. Spinner y Carga
```dart
const NativeLoadingSpinner(
  size: 40.0,
  strokeWidth: 4.0,
  duration: Duration(milliseconds: 1000),
)

const NativePulsingHeart(
  size: 48.0,
  color: Color(0xFFE53935),
)
```

#### C. Feedback Interactivo (Éxito y Error)
```dart
// Checkmark animado al completar una acción
NativeSuccessCheckmark(
  size: 56.0,
  color: Colors.green,
)

// Cruz animada de error
NativeErrorCross(
  size: 56.0,
  color: Colors.red,
)
```

#### D. Botón Shimmer y Badges
```dart
// Botón metálico con destello brillante
NativeShimmerButton(
  text: 'Confirmar Transacción',
  onPressed: () {
    print('Procesando...');
  },
)

// Notificación con halo de pulso
NativePulseBadge(
  count: '5',
  child: Icon(Icons.notifications, size: 30),
)

// Cargador de Esqueleto / Placeholder
NativeSkeletonShimmer(
  width: double.infinity,
  height: 16.0,
  borderRadius: 8.0,
)
```

---

## 📄 Licencia

Este proyecto está bajo la Licencia **MIT**.  
Desarrollado con ❤️ por **Ing. Juan Pablo Gosalvez (NyK)**.
