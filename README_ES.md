# flutter_native_ui_nyk 🎨⚡

Un paquete completo de **iconos vectoriales nativos** y **animaciones en Flutter de alto rendimiento** (60-120 FPS), sin dependencias externas pesadas, 100% adaptable a temas claros y oscuros.

---

## 👨‍💻 Autoría y Créditos

- **Autor**: Ing. Juan Pablo Gosalvez
- **Marca**: NyK
- **Contacto**: [ingejpablo@gmail.com](mailto:ingejpablo@gmail.com)
- **Licencia**: MIT

---

## ☕ Apoya el Proyecto

Si este paquete te ha sido útil y deseas apoyar su desarrollo continuo, mantenimiento y la incorporación de nuevos iconos y animaciones, puedes realizar una contribución voluntaria:

- 💳 **PayPal**: [paypal.me/NyKservice](https://paypal.me/NyKservice)
- 🅿️ **Patreon**: [patreon.com/JuanPabloGosalvez](https://www.patreon.com/c/JuanPabloGosalvez)

¡Tu contribución es enormemente apreciada para mantener este proyecto 100% libre, gratuito y en constante evolución!

---

## 🌐 Idioma / Language

- [Español (README_ES.md)](README_ES.md)
- [English (README_EN.md)](README_EN.md)

---

## ✨ Características Principales

- 🚀 **0 Dependencias Externas**: Renderizado nativo puro con `CustomPainter` y `AnimationController`.
- 🎯 **66 Iconos Vectoriales Nativos**:
  - **Firebase & Nube**: `FirebaseIcon`, `FirestoreIcon`, `FirebaseAuthIcon`, `CloudStorageIcon`, `DatabaseDisabledIcon`.
  - **Redes & Autenticación**: `GoogleIcon`, `FacebookIcon`, `AppleIcon`, `GitHubIcon`, `InstagramIcon`, `TwitterXIcon`, `LinkedInIcon`, `TikTokIcon`, `WhatsAppIcon`, `YouTubeIcon`.
  - **Pasarelas de Pago**: `VisaIcon`, `MastercardIcon`, `PayPalIcon`.
  - **UI & Sistema**: `SparklesIcon` (IA / Magia), `ShieldCheckIcon` (Seguridad / Verificado).
  - 🏗️ **Ingeniería**: `HardhatWorkerIcon`, `WorkCrewIcon`, `ExcavatorIcon`, `DumpTruckIcon`, `TractorIcon`, `EngineeringToolsIcon`.
  - 🎵 **Música**: `MusicSheetIcon`, `MusicChordsIcon`, `PlayControlIcon`, `PauseControlIcon`, `StopControlIcon`.
  - ⚽ **Fútbol**: `SoccerBallIcon`, `SoccerPlayerIcon`, `SoccerTeamIcon`, `YellowCardIcon`, `RedCardIcon`, `RefereeCardIcon`, `RefereeWhistleIcon`, `MatchCalendarIcon`.
  - 💊 **Farmacia & Salud**: `PillIcon`, `SyringeIcon`, `StethoscopeIcon`, `FirstAidKitIcon`, `HospitalBuildingIcon`, `MedicineBottleIcon`.
  - 🛒 **E-Commerce**: `ShoppingBagIcon`, `ShoppingCartIcon`, `TagDiscountIcon`, `DeliveryTruckIcon`, `BarcodeQrIcon`.
  - 🍔 **Gastronomía**: `RestaurantPlateIcon`, `BurgerPizzaIcon`, `CoffeeCupIcon`, `DeliveryMotorcycleIcon`, `ChefHatIcon`.
  - 💼 **Finanzas**: `WalletIcon`, `PiggyBankIcon`, `BitcoinCryptoIcon`, `TrendingChartIcon`, `BankBuildingIcon`.
  - ✈️ **Viajes**: `AirplaneIcon`, `SuitcaseIcon`, `MapPinIcon`, `CompassIcon`, `HotelBedIcon`.
  - 🎓 **Educación**: `GraduationCapIcon`, `BookOpenIcon`, `CertificateAwardIcon`, `IdeaBulbIcon`.
  - 🚗 **Automotriz**: `CarIcon`, `FuelGasIcon`, `SpeedometerIcon`, `CarKeyIcon`.
- ⚡ **24 Animaciones Nativas Ultra Fluidas (60-120 FPS)**:
  - **Firebase & Nube**: `NativeCloudSync`, `NativeDataUpload`, `NativeDataDownload`, `NativeDatabaseOffline`.
  - **Spinners y Cargadores**: `NativeLoadingSpinner`, `NativePulsingHeart`, `NativePulseRipple`, `NativeBouncingDots`.
  - **Retroalimentación (Feedback)**: `NativeSuccessCheckmark`, `NativeErrorCross`, `NativeWaveBars`.
  - **UI Interactivas**: `NativeShimmerButton` (Botón destello metálico), `NativePulseBadge` (Insignia con halo), `NativeSkeletonShimmer` (Esqueleto de carga).
  - 🎭 **Temáticas**: `NativeExcavatorDigging`, `NativeAudioEqualizer`, `NativeSoccerBallBounce`, `NativeHeartbeatPulse`, `NativePillDrip`, `NativeCartBadgePulse`, `NativeCoffeeSteam`, `NativeCryptoChartUp`, `NativeFlightTakeoff`, `NativeIdeaBulbGlow`.
- 🌓 **Adaptativo**: Colores configurables y soporte automático para temas claros y oscuros (`ThemeData`).

---

## 📦 Instalación

Agrega `flutter_native_ui` a las dependencias de tu proyecto con el siguiente comando:

```bash
flutter pub add flutter_native_ui_nyk
```

O agrégalo manualmente a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter_native_ui_nyk: ^1.0.0
```

---

## 💻 Guía de Uso

### 1. Importación
```dart
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';
```

---

### 2. Uso de Iconos Vectoriales
```dart
// E-Commerce
const ShoppingBagIcon(size: 36)
const ShoppingCartIcon(size: 36)

// Gastronomía
const CoffeeCupIcon(size: 36)
const DeliveryMotorcycleIcon(size: 36)
```

---

### 3. Uso de Animaciones Nativas
```dart
// Vapor de Café en Vivo
const NativeCoffeeSteam(size: 48)

// Gráfica Cripto en Crecimiento
const NativeCryptoChartUp(width: 54, height: 36)
```

---

## 📄 Licencia

Este proyecto está bajo la Licencia **MIT**.  
Desarrollado con ❤️ por **Ing. Juan Pablo Gosalvez (NyK)**.
