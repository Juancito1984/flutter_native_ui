## 1.1.1

* **Mejora Mayor de DX: Clases Padre Centralizadas con Autocompletado IDE (`NativeIcons` y `NativeAnimations`)**:
  - Introducción de la clase padre **`NativeIcons`** (`lib/src/icons/native_icons.dart`): permite autocompletado nativo en el IDE (IntelliSense) mediante `NativeIcons.nombre(...)` para acceder a los **83 iconos vectoriales**.
  - Introducción de la clase padre **`NativeAnimations`** (`lib/src/animations/native_animations.dart`): permite autocompletado en el IDE mediante `NativeAnimations.nombre(...)` para acceder a las **32 animaciones nativas (60–120 FPS)**.
* **Estandarización de Parámetros Opcionales de Color (`color` y `secondaryColor`)**:
  - Todos los 83 métodos de `NativeIcons` y las 32 animaciones de `NativeAnimations` aceptan `size`, `color` (primario) y `secondaryColor` (secundario/acento) como parámetros opcionales con valores predeterminados implícitos.
* **Diseño Bi-Tonal Inteligente & Adaptabilidad ThemeData**:
  - **Modo Claro (`Brightness.light`)**: Combinación bi-tonal de colores vivos y agradables por defecto (`primary` + `secondary`/`tertiary` o acentos de dominio).
  - **Modo Oscuro (`Brightness.dark`)**: Conmutación automática a acabado plano de alto contraste (`onSurface` y `primary`).
  - **100% Retrocompatible**: Se mantiene el soporte completo para instanciar directamente los widgets de clases individuales (`BrainAiIcon`, `FirebaseIcon`, `NativeCloudSync`, etc.).
* **Actualización de la App de Ejemplo y Documentación Bilingüe**:
  - App de ejemplo ([`example/lib/main.dart`](file:///C:/Users/ingej/StudioProjects/flutter_native_ui/example/lib/main.dart)) actualizada con ejemplos de `NativeIcons` y `NativeAnimations`.
  - Documentación bilingüe en `doc/es/` y `doc/en/` actualizada.

## 1.1.0

* **Gran Expansión de Iconos Vectoriales Nativos (83 Iconos Total / 19 Categorías)**:
  - **17 Nuevos Iconos Vectoriales Nativos** repartidos en 5 nuevas categorías estratégicas de industria:
    - 🤖 **IA & GenAI (`ai`)**: `BrainAiIcon`, `BotMessageIcon`, `WandMagicIcon`, `CpuChipIcon`.
    - 🔒 **Biometría & Seguridad (`security`)**: `FingerprintScanIcon`, `FaceIdIcon`, `KeyholeLockIcon`.
    - 🏠 **Domótica & Smart Home (`smarthome`)**: `SmartLockIcon`, `LightBulbSmartIcon`, `ThermometerSmartIcon`, `SolarPanelIcon`.
    - 🏋️ **Fitness, Salud & Deportes (`fitness`)**: `DumbbellIcon`, `FlameKcalIcon`, `WaterDropIcon`, `TrophyAwardIcon`.
    - 📦 **Logística, Envíos & GPS (`logistics`)**: `PackageBoxIcon`, `QrScannerIcon`, `LocationRadarIcon`.
* **Nuevas Animaciones Nativas Ultra Fluidas (32 Animaciones Total)**:
  - **8 Nuevas Animaciones a 60–120 FPS**: `NativeAiThinkingOrbit`, `NativeTypingIndicator`, `NativeFingerprintScan`, `NativeCreditCardNfc`, `NativeWaterWaveFill`, `NativeTruckMoving`, `NativeRadarPin`, `NativeRingProgress`.

## 1.0.2

* **Reestructuración de Documentación Bilingüe y Validación de URLs**:
  - Reorganización completa de la documentación bilingüe en el directorio `doc/` (`doc/es/` y `doc/en/`) con guías individuales para `vector_icons.md`, `native_animations.md` y `performance_and_architecture.md`.
  - Estructuración de portada principal alineada con los estándares oficiales de Flutter.
  - Corrección en `.gitignore` para permitir el rastreo e inclusión del directorio `doc/` en el paquete publicado.
  - Verificación y validación de URLs públicas del repositorio en GitHub (`Juancito1984/flutter_native_ui`).

## 1.0.1

* **Actualización de Enlaces, Documentación y Nombre Oficial**:
  - Nombre oficial publicado en pub.dev: `flutter_native_ui_nyk`.
  - Actualización de las URLs oficiales del repositorio GitHub (`Juancito1984/flutter_native_ui`), Homepage e Issue Tracker.
  - Enlaces de patrocinio refinados para PayPal y Patreon.

## 1.0.0

* **Primer Lanzamiento Mayor Oficial Estable en pub.dev**:
  - **66 Iconos Vectoriales Nativos** distribuidos en 14 categorías industriales.
  - **24 Animaciones Nativas Ultra Fluidas (60-120 FPS)**.
  - Sección oficial de patrocinio y donaciones voluntarias (`funding:` en `pubspec.yaml` para PayPal y Patreon).
  - 100% libre de dependencias externas.
  - Aislamiento de renderizado en GPU con `RepaintBoundary` y matriz de gradientes acotada en todas las animaciones.

## 0.0.1

* Desarrollo inicial de `flutter_native_ui_nyk`.
