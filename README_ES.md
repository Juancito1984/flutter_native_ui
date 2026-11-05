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
- 🎯 **39 Iconos Vectoriales Nativos**:
  - **Firebase & Nube**: `FirebaseIcon`, `FirestoreIcon`, `FirebaseAuthIcon`, `CloudStorageIcon`, `DatabaseDisabledIcon`.
  - **Redes & Autenticación**: `GoogleIcon`, `FacebookIcon`, `AppleIcon`, `GitHubIcon`, `InstagramIcon`, `TwitterXIcon`, `LinkedInIcon`, `TikTokIcon`, `WhatsAppIcon`, `YouTubeIcon`.
  - **Pasarelas de Pago**: `VisaIcon`, `MastercardIcon`, `PayPalIcon`.
  - **UI & Sistema**: `SparklesIcon` (IA / Magia), `ShieldCheckIcon` (Seguridad / Verificado).
  - 🏗️ **Ingeniería**: `HardhatWorkerIcon`, `WorkCrewIcon`, `ExcavatorIcon`, `DumpTruckIcon`, `TractorIcon`, `EngineeringToolsIcon`.
  - 🎵 **Música**: `MusicSheetIcon`, `MusicChordsIcon`, `PlayControlIcon`, `PauseControlIcon`, `StopControlIcon`.
  - ⚽ **Fútbol**: `SoccerBallIcon`, `SoccerPlayerIcon`, `SoccerTeamIcon`, `YellowCardIcon`, `RedCardIcon`, `RefereeCardIcon`, `RefereeWhistleIcon`, `MatchCalendarIcon`.
  - 💊 **Farmacia & Salud**: `PillIcon`, `SyringeIcon`, `StethoscopeIcon`, `FirstAidKitIcon`, `HospitalBuildingIcon`, `MedicineBottleIcon`.
- ⚡ **19 Animaciones Nativas Ultra Fluidas (60-120 FPS)**:
  - **Firebase & Nube**: `NativeCloudSync`, `NativeDataUpload`, `NativeDataDownload`, `NativeDatabaseOffline`.
  - **Spinners y Cargadores**: `NativeLoadingSpinner`, `NativePulsingHeart`, `NativePulseRipple`, `NativeBouncingDots`.
  - **Retroalimentación (Feedback)**: `NativeSuccessCheckmark`, `NativeErrorCross`, `NativeWaveBars`.
  - **UI Interactivas**: `NativeShimmerButton` (Botón destello metálico), `NativePulseBadge` (Insignia con halo), `NativeSkeletonShimmer` (Esqueleto de carga).
  - 🎭 **Temáticas**: `NativeExcavatorDigging` (Excavadora), `NativeAudioEqualizer` (Ecualizador), `NativeSoccerBallBounce` (Rebote de balón), `NativeHeartbeatPulse` (Pulso ECG), `NativePillDrip` (Píldora con halo).
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
  flutter_native_ui: ^0.4.0
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
// Farmacia y Salud
const PillIcon(size: 36)
const SyringeIcon(size: 36)
const StethoscopeIcon(size: 36)
const FirstAidKitIcon(size: 36)
const HospitalBuildingIcon(size: 36)
const MedicineBottleIcon(size: 36)

// Ingeniería
const HardhatWorkerIcon(size: 36)
const WorkCrewIcon(size: 36)
const ExcavatorIcon(size: 36)
const DumpTruckIcon(size: 36)

// Música
const MusicSheetIcon(size: 36)
const MusicChordsIcon(size: 36)

// Fútbol
const SoccerBallIcon(size: 36)
const YellowCardIcon(size: 36)
const RedCardIcon(size: 36)
```

---

### 3. Uso de Animaciones Nativas
```dart
// Pulso ECG
const NativeHeartbeatPulse(width: 60, height: 36)

// Píldora Halo
const NativePillDrip(size: 48)

// Rebote de Balón
const NativeSoccerBallBounce(size: 48)

// Ecualizador de Audio
const NativeAudioEqualizer(width: 48, height: 36)
```

---

## 📄 Licencia

Este proyecto está bajo la Licencia **MIT**.  
Desarrollado con ❤️ por **Ing. Juan Pablo Gosalvez (NyK)**.
