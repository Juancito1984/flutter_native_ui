# flutter_native_ui 🎨⚡

A complete package of **native vector icons** and **high-performance Flutter animations** (60-120 FPS), zero heavy external dependencies, 100% theme adaptive for Light & Dark mode.

---

## 👨‍💻 Authorship & Credits

- **Author**: Ing. Juan Pablo Gosalvez
- **Brand**: NyK
- **Contact**: [ingejpablo@gmail.com](mailto:ingejpablo@gmail.com)
- **License**: MIT

---

## 🌐 Language / Idioma

- [English (README_EN.md)](README_EN.md)
- [Español (README_ES.md)](README_ES.md)

---

## ✨ Key Features

- 🚀 **Zero External Dependencies**: Pure native rendering with `CustomPainter` and `AnimationController`.
- 🎯 **39 Native Vector Icons**:
  - **Firebase & Cloud**: `FirebaseIcon`, `FirestoreIcon`, `FirebaseAuthIcon`, `CloudStorageIcon`, `DatabaseDisabledIcon`.
  - **Social & Auth**: `GoogleIcon`, `FacebookIcon`, `AppleIcon`, `GitHubIcon`, `InstagramIcon`, `TwitterXIcon`, `LinkedInIcon`, `TikTokIcon`, `WhatsAppIcon`, `YouTubeIcon`.
  - **Payment Gateways**: `VisaIcon`, `MastercardIcon`, `PayPalIcon`.
  - **UI & System**: `SparklesIcon`, `ShieldCheckIcon`.
  - 🏗️ **Engineering**: `HardhatWorkerIcon`, `WorkCrewIcon`, `ExcavatorIcon`, `DumpTruckIcon`, `TractorIcon`, `EngineeringToolsIcon`.
  - 🎵 **Music**: `MusicSheetIcon`, `MusicChordsIcon`, `PlayControlIcon`, `PauseControlIcon`, `StopControlIcon`.
  - ⚽ **Football**: `SoccerBallIcon`, `SoccerPlayerIcon`, `SoccerTeamIcon`, `YellowCardIcon`, `RedCardIcon`, `RefereeCardIcon`, `RefereeWhistleIcon`, `MatchCalendarIcon`.
  - 💊 **Pharmacy & Health**: `PillIcon`, `SyringeIcon`, `StethoscopeIcon`, `FirstAidKitIcon`, `HospitalBuildingIcon`, `MedicineBottleIcon`.
- ⚡ **19 Ultra-Smooth Native Animations (60-120 FPS)**:
  - **Firebase & Cloud**: `NativeCloudSync`, `NativeDataUpload`, `NativeDataDownload`, `NativeDatabaseOffline`.
  - **Spinners & Loaders**: `NativeLoadingSpinner`, `NativePulsingHeart`, `NativePulseRipple`, `NativeBouncingDots`.
  - **Feedback & Status**: `NativeSuccessCheckmark`, `NativeErrorCross`, `NativeWaveBars`.
  - **Interactive UI**: `NativeShimmerButton`, `NativePulseBadge`, `NativeSkeletonShimmer`.
  - 🎭 **Thematic**: `NativeExcavatorDigging`, `NativeAudioEqualizer`, `NativeSoccerBallBounce`, `NativeHeartbeatPulse`, `NativePillDrip`.
- 🌓 **Theme Adaptive**: Fully customizable colors and automatic support for Light & Dark themes (`ThemeData`).

---

## 📦 Installation

```bash
flutter pub add flutter_native_ui
```

Or manually add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_native_ui: ^0.4.0
```

---

## 💻 Usage Guide

### 1. Import
```dart
import 'package:flutter_native_ui/flutter_native_ui.dart';
```

---

### 2. Vector Icons Usage
```dart
// Pharmacy & Health
const PillIcon(size: 36)
const SyringeIcon(size: 36)
const StethoscopeIcon(size: 36)
const FirstAidKitIcon(size: 36)
const HospitalBuildingIcon(size: 36)
const MedicineBottleIcon(size: 36)
```

---

### 3. Native Animations Usage
```dart
// ECG Heartbeat Pulse
const NativeHeartbeatPulse(width: 60, height: 36)

// Floating Pill Halo
const NativePillDrip(size: 48)
```

---

## 📄 License

This project is licensed under the **MIT License**.  
Developed with ❤️ by **Ing. Juan Pablo Gosalvez (NyK)**.
