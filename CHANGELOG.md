## 0.4.0

* **Reorganización Modular de Código**:
  - Reorganización interna de `icons` y `animations` en subdirectorios modulares por categoría (`cloud`, `social`, `payments`, `system`, `engineering`, `music`, `football`, `pharmacy`).

* **Nuevas Categorías e Iconos Vectoriales Nativos (19 nuevos iconos, 39 en total)**:
  - 🏗️ **Ingeniería & Construcción**: `HardhatWorkerIcon`, `WorkCrewIcon`, `ExcavatorIcon`, `DumpTruckIcon`, `TractorIcon`, `EngineeringToolsIcon`.
  - 🎵 **Música & Audio**: `MusicSheetIcon`, `MusicChordsIcon`, `PlayControlIcon`, `PauseControlIcon`, `StopControlIcon`.
  - ⚽ **Fútbol & Deportes**: `SoccerBallIcon`, `SoccerPlayerIcon`, `SoccerTeamIcon`, `YellowCardIcon`, `RedCardIcon`, `RefereeCardIcon`, `RefereeWhistleIcon`, `MatchCalendarIcon`.
  - 💊 **Farmacia & Salud**: `PillIcon`, `SyringeIcon`, `StethoscopeIcon`, `FirstAidKitIcon`, `HospitalBuildingIcon`, `MedicineBottleIcon`.

* **Nuevas Animaciones Nativas (5 nuevas animaciones, 19 en total)**:
  - 🏗️ `NativeExcavatorDigging`: Animación de excavadora en ciclo de excavación.
  - 🎵 `NativeAudioEqualizer`: Ecualizador de ondas musicales multinivel rítmico.
  - ⚽ `NativeSoccerBallBounce`: Balón de fútbol rebotando con sombra dinámica.
  - 💊 `NativeHeartbeatPulse`: Línea de pulso cardíaco / electrocardiograma (ECG) animada.
  - 💊 `NativePillDrip`: Cápsula médica flotante con halo radiante.

* **Mejoras de Rendimiento y Estabilidad**:
  - Inversión de jerarquía `LayoutBuilder` / `AnimatedBuilder` en `NativeSkeletonShimmer` evitando bloqueos durante el scroll.
  - Compatibilidad total con versiones anteriores y futuras de Flutter SDK.

## 0.3.0

* Colección Firebase & Cloud:
  - Iconos: `FirebaseIcon`, `FirestoreIcon`, `FirebaseAuthIcon`, `CloudStorageIcon`, `DatabaseDisabledIcon`.
  - Animaciones:
    * `NativeCloudSync`: Sincronización continua de datos en la nube con rotación de flechas.
    * `NativeDataUpload`: Animación de subida/guardado de datos a Firebase/Nube.
    * `NativeDataDownload`: Animación de descarga/consulta de datos desde la nube.
    * `NativeDatabaseOffline`: Animación de base de datos desactivada/desconectada con pulso de alerta.

## 0.2.0

* Nuevos Iconos Vectoriales Nativos:
  - `LinkedInIcon`, `TikTokIcon`, `WhatsAppIcon`, `YouTubeIcon`, `VisaIcon`, `MastercardIcon`, `PayPalIcon`, `SparklesIcon`, `ShieldCheckIcon`.
* Nuevas Animaciones Nativas:
  - `NativeSuccessCheckmark`, `NativeErrorCross`, `NativeWaveBars`, `NativeShimmerButton`, `NativePulseBadge`.

## 0.0.1

* Lanzamiento inicial de `flutter_native_ui`.
