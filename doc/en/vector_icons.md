# 🎯 Native Vector Icons Guide

The **`flutter_native_ui_nyk`** package features **83 native vector icons** drawn programmatically via `CustomPainter`. By eliminating external SVG files and custom icon fonts, they deliver **zero runtime parsing overhead**, minimal app footprint, and perfect clarity at any display scale.

---

## ⚙️ Standard Icon Parameters

All vector icons accept the following standard parameters:

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **`size`** | `double` | `24.0` | Square width and height of the icon container in logical pixels. |
| **`color`** | `Color?` | `null` | Primary stroke or fill color (for monochromatic icons). Defaults to active theme context if null. |

---

## 📂 Complete Category Catalog (83 Icons / 19 Categories)

### 1. 🤖 AI & GenAI (`ai`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🧠 | `BrainAiIcon` | Brain with neural network node connections. |
| 🤖 | `BotMessageIcon` | AI chatbot robot head icon. |
| 🪄 | `WandMagicIcon` | AI prompt & generative magic wand. |
| 🔲 | `CpuChipIcon` | CPU processor / AI NPU chip icon. |

### 2. 🔒 Biometrics & Security (`security`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 👆 | `FingerprintScanIcon` | Fingerprint scan icon. |
| 👤 | `FaceIdIcon` | Facial recognition / Face ID icon. |
| 🔑 | `KeyholeLockIcon` | Lock with keyhole icon. |
| 🛡️ | `ShieldCheckIcon` | Verified security shield icon. |

### 3. 🏠 Smart Home & IoT (`smarthome`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🔓 | `SmartLockIcon` | Smart lock with wireless signal. |
| 💡 | `LightBulbSmartIcon` | Smart home light bulb icon. |
| 🌡️ | `ThermometerSmartIcon` | Smart digital thermostat icon. |
| ☀️ | `SolarPanelIcon` | Solar panel clean energy icon. |

### 4. 🏋️ Health, Fitness & Sports (`fitness`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🏋️ | `DumbbellIcon` | Gym dumbbell weights icon. |
| 🔥 | `FlameKcalIcon` | Burned calories flame icon. |
| 💧 | `WaterDropIcon` | Water hydration drop icon. |
| 🏆 | `TrophyAwardIcon` | Victory trophy cup icon. |

### 5. 📦 Logistics, Shipping & GPS (`logistics`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 📦 | `PackageBoxIcon` | Package shipping box icon. |
| 📷 | `QrScannerIcon` | QR code scanner frame icon. |
| 📍 | `LocationRadarIcon` | Map pin location radar icon. |

### 6. 🔥 Firebase & Cloud (`cloud`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🔥 | `FirebaseIcon` | Official 3-color Firebase flame. |
| 🗄️ | `FirestoreIcon` | Official Cloud Firestore logo. |
| 🔑 | `FirebaseAuthIcon` | Firebase User Authentication icon. |
| ☁️ | `CloudStorageIcon` | Cloud Storage icon. |
| 🚫 | `DatabaseDisabledIcon` | Disabled / Offline database icon. |

### 7. 📱 Social Media & Auth (`social`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🌐 | `GoogleIcon` | Official multicolor Google 'G' logo. |
| 👍 | `FacebookIcon` | Official Facebook logo. |
| 🍎 | `AppleIcon` | Official vector Apple logo. |
| 🐙 | `GithubIcon` | GitHub Octocat / logo. |
| 📸 | `InstagramIcon` | Instagram camera icon with gradient accent. |
| 𝕏 | `TwitterXIcon` | Official X / Twitter logo. |
| 💼 | `LinkedinIcon` | Official LinkedIn logo. |
| 🎵 | `TiktokIcon` | Official TikTok musical note logo. |
| 💬 | `WhatsappIcon` | Official WhatsApp chat bubble icon. |
| ▶️ | `YoutubeIcon` | Official YouTube play button logo. |

### 8. 💳 Payment Gateways (`payments`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 💳 | `VisaIcon` | Official Visa logo. |
| 💳 | `MastercardIcon` | Official Mastercard intersecting spheres logo. |
| 🅿️ | `PaypalIcon` | Official PayPal logo. |

### 9. ✦ System & UI (`system`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| ✨ | `SparklesIcon` | AI / Magic Sparkles icon. |
| 🛡️ | `ShieldCheckIcon` | Verified security shield icon. |

### 10. 🏗️ Engineering & Construction (`engineering`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 👷 | `HardhatWorkerIcon` | Construction hardhat icon. |
| 👥 | `WorkCrewIcon` | Engineering work crew icon. |
| 🚜 | `ExcavatorIcon` | Heavy machinery excavator icon. |
| 🚛 | `DumpTruckIcon` | Construction dump truck icon. |
| 🚜 | `TractorIcon` | Agricultural / industrial tractor icon. |
| 🛠️ | `EngineeringToolsIcon` | Crossed engineering tools icon. |

### 11. 🎵 Music & Media Controls (`music`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🎼 | `MusicSheetIcon` | Music sheet notation icon. |
| 🎸 | `MusicChordsIcon` | Musical chords & notes icon. |
| ▶️ | `PlayControlIcon` | Media play button icon. |
| ⏸️ | `PauseControlIcon` | Media pause button icon. |
| ⏹️ | `StopControlIcon` | Media stop button icon. |

### 12. ⚽ Sports & Football (`football`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| ⚽ | `SoccerBallIcon` | Classic soccer ball icon. |
| 🏃 | `SoccerPlayerIcon` | Soccer player silhouette icon. |
| 👥 | `SoccerTeamIcon` | Soccer team lineup icon. |
| 🟨 | `YellowCardIcon` | Official yellow card icon. |
| 🟥 | `RedCardIcon` | Official red card ejection icon. |
| 🟨🟥 | `RefereeCardIcon` | Referee cards icon. |
| 📢 | `RefereeWhistleIcon` | Referee whistle icon. |
| 📅 | `MatchCalendarIcon` | Match schedule calendar icon. |

### 13. 💊 Pharmacy & Healthcare (`pharmacy`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 💊 | `PillIcon` | Medical capsule / pill icon. |
| 💉 | `SyringeIcon` | Medical syringe icon. |
| 🩺 | `StethoscopeIcon` | Stethoscope icon. |
| 🧰 | `FirstAidKitIcon` | First aid kit box icon. |
| 🏥 | `HospitalBuildingIcon` | Hospital building icon. |
| 🍾 | `MedicineBottleIcon` | Medicine bottle icon. |

### 14. 🛒 E-Commerce (`ecommerce`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🛍️ | `ShoppingBagIcon` | Shopping bag icon. |
| 🛒 | `ShoppingCartIcon` | Shopping cart icon. |
| 🏷️ | `TagDiscountIcon` | Discount tag icon. |
| 🚚 | `DeliveryTruckIcon` | Delivery shipping truck icon. |
| 📊 | `BarcodeQrIcon` | Barcode & QR code icon. |

### 15. 🍔 Gastronomy & Food (`food`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🍽️ | `RestaurantPlateIcon` | Restaurant plate & cutlery icon. |
| 🍔 | `BurgerPizzaIcon` | Fast food (burger/pizza) icon. |
| ☕ | `CoffeeCupIcon` | Coffee cup icon. |
| 🛵 | `DeliveryMotorcycleIcon` | Food delivery motorcycle icon. |
| 👨‍🍳 | `ChefHatIcon` | Chef hat icon. |

### 16. 💼 Finance (`finance`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 👛 | `WalletIcon` | Digital/physical wallet icon. |
| 🐖 | `PiggyBankIcon` | Savings piggy bank icon. |
| ₿ | `BitcoinCryptoIcon` | Bitcoin / Crypto coin icon. |
| 📈 | `TrendingChartIcon` | Trending upward financial chart icon. |
| 🏦 | `BankBuildingIcon` | Bank building icon. |

### 17. ✈️ Travel & Tourism (`travel`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| ✈️ | `AirplaneIcon` | Commercial airplane icon. |
| 🧳 | `SuitcaseIcon` | Travel suitcase icon. |
| 📍 | `MapPinIcon` | Map pin location icon. |
| 🧭 | `CompassIcon` | Navigation compass icon. |
| 🏨 | `HotelBedIcon` | Hotel bed icon. |

### 18. 🎓 Education (`education`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🎓 | `GraduationCapIcon` | Graduation cap icon. |
| 📖 | `BookOpenIcon` | Open book icon. |
| 📜 | `CertificateAwardIcon` | Award certificate / diploma icon. |
| 💡 | `IdeaBulbIcon` | Idea / knowledge light bulb icon. |

### 19. 🚗 Automotive (`automotive`)
| Icon | Dart Class | Description |
| :--- | :--- | :--- |
| 🚗 | `CarIcon` | Passenger car icon. |
| ⛽ | `FuelGasIcon` | Gas station pump icon. |
| ⏱️ | `SpeedometerIcon` | Speedometer gauge icon. |
| 🔑 | `CarKeyIcon` | Car key icon. |

---

## 💻 Code Snippets

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

// 1. AI Brain Icon
const aiBrain = BrainAiIcon(size: 48);

// 2. Fingerprint Scan Icon
const fingerprint = FingerprintScanIcon(size: 32);

// 3. Smart Lock in ListTile
ListTile(
  leading: const SmartLockIcon(size: 32),
  title: const Text('Smart Lock'),
  subtitle: const Text('Connected via WiFi'),
);
```
