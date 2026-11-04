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
- 🎯 **15 Native Vector Icons**:
  - **Firebase & Cloud**: `FirebaseIcon`, `FirestoreIcon`, `FirebaseAuthIcon`, `CloudStorageIcon`, `DatabaseDisabledIcon`.
  - **Social & Auth**: `GoogleIcon`, `FacebookIcon`, `AppleIcon`, `GitHubIcon`, `InstagramIcon`, `TwitterXIcon`, `LinkedInIcon`, `TikTokIcon`, `WhatsAppIcon`, `YouTubeIcon`.
  - **Payment Gateways**: `VisaIcon`, `MastercardIcon`, `PayPalIcon`.
  - **UI & System**: `SparklesIcon` (AI / Magic), `ShieldCheckIcon` (Security / Verified).
- ⚡ **10 Ultra-Smooth Native Animations (60-120 FPS)**:
  - **Firebase & Cloud**: `NativeCloudSync`, `NativeDataUpload`, `NativeDataDownload`, `NativeDatabaseOffline`.
  - **Spinners & Loaders**: `NativeLoadingSpinner`, `NativePulsingHeart`, `NativePulseRipple`, `NativeBouncingDots`.
  - **Feedback & Status**: `NativeSuccessCheckmark`, `NativeErrorCross`, `NativeWaveBars`.
  - **Interactive UI**: `NativeShimmerButton` (Metallic shine button), `NativePulseBadge` (Pulsing halo badge), `NativeSkeletonShimmer` (Content skeleton loader).
- 🌓 **Theme Adaptive**: Fully customizable colors and automatic support for Light & Dark themes (`ThemeData`).

---

## 📦 Installation

Add `flutter_native_ui` to your project dependencies using the terminal:

```bash
flutter pub add flutter_native_ui
```

Or manually add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_native_ui: ^0.3.0
```

Then run in your terminal:

```bash
flutter pub get
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
// Firebase & Cloud Icons
const FirebaseIcon(size: 36)
const FirestoreIcon(size: 36)
const FirebaseAuthIcon(size: 36)
const CloudStorageIcon(size: 36)
const DatabaseDisabledIcon(size: 36)

// Social & Auth Icons
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

// Payments
const VisaIcon(size: 40)
const MastercardIcon(size: 40)
const PayPalIcon(size: 40)

// UI
const SparklesIcon(size: 32, color: Colors.amber)
const ShieldCheckIcon(size: 32, color: Colors.green)
```

---

### 3. Native Animations Usage

#### A. Firebase & Cloud Sync
```dart
// Continuous data synchronization
const NativeCloudSync(size: 48)

// Saving / Uploading data
const NativeDataUpload(size: 48)

// Fetching / Downloading data
const NativeDataDownload(size: 48)

// Offline or disabled database
const NativeDatabaseOffline(size: 48)
```

#### B. Spinners & Loaders
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

#### C. Interactive Feedback (Success & Error)
```dart
// Animated Checkmark on action completed
NativeSuccessCheckmark(
  size: 56.0,
  color: Colors.green,
)

// Animated Cross on error
NativeErrorCross(
  size: 56.0,
  color: Colors.red,
)
```

#### D. Shimmer Button & Badges
```dart
// Metallic button with sweeping light shimmer
NativeShimmerButton(
  text: 'Confirm Transaction',
  onPressed: () {
    print('Processing...');
  },
)

// Notification icon with pulsing halo
NativePulseBadge(
  count: '5',
  child: Icon(Icons.notifications, size: 30),
)

// Skeleton Content Loader / Placeholder
NativeSkeletonShimmer(
  width: double.infinity,
  height: 16.0,
  borderRadius: 8.0,
)
```

---

## 📄 License

This project is licensed under the **MIT License**.  
Developed with ❤️ by **Ing. Juan Pablo Gosalvez (NyK)**.
