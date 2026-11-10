# 🎯 Guía de Iconos Vectoriales Nativos

La librería **`flutter_native_ui_nyk`** incluye **83 iconos vectoriales nativos** dibujados con `CustomPainter`. Al no requerir archivos SVG ni fuentes tipográficas de terceros, garantizan **0 sobrecarga en tiempo de ejecución**, peso mínimo y total nitidez a cualquier tamaño de pantalla.

---

## ⚙️ Propiedades Comunes de los Iconos

Todos los iconos vectoriales aceptan los siguientes parámetros estandarizados:

| Parámetro | Tipo | Valor por Defecto | Descripción |
| :--- | :--- | :--- | :--- |
| **`size`** | `double` | `24.0` | Ancho y alto del contenedor del icono en píxeles lógicos. |
| **`color`** | `Color?` | `null` | Color principal de trazo o relleno (si el icono es monocromático). Si es nulo, toma el tema actual. |

---

## 📂 Catálogo Completo por Categorías (83 Iconos / 19 Categorías)

### 1. 🤖 Inteligencia Artificial & GenAI (`ai`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🧠 | `BrainAiIcon` | Cerebro con conexiones de red neuronal. |
| 🤖 | `BotMessageIcon` | Cabeza de robot chatbot IA. |
| 🪄 | `WandMagicIcon` | Varita mágica de prompts e IA generativa. |
| 🔲 | `CpuChipIcon` | Procesador CPU / Chip NPU de IA. |

### 2. 🔒 Biometría & Seguridad (`security`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 👆 | `FingerprintScanIcon` | Escaneo de huella dactilar. |
| 👤 | `FaceIdIcon` | Reconocimiento facial / Face ID. |
| 🔑 | `KeyholeLockIcon` | Candado con ojo de cerradura. |
| 🛡️ | `ShieldCheckIcon` | Escudo de seguridad verificado. |

### 3. 🏠 Domótica & Smart Home (`smarthome`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🔓 | `SmartLockIcon` | Candado inteligente con señal inalámbrica. |
| 💡 | `LightBulbSmartIcon` | Foco domótico inteligente. |
| 🌡️ | `ThermometerSmartIcon` | Termostato digital inteligente. |
| ☀️ | `SolarPanelIcon` | Panel solar de energía limpia. |

### 4. 🏋️ Salud, Fitness & Deportes (`fitness`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🏋️ | `DumbbellIcon` | Mancuerna / Pesas de gimnasio. |
| 🔥 | `FlameKcalIcon` | Llama de calorías quemadas. |
| 💧 | `WaterDropIcon` | Gota de agua / Hidratación. |
| 🏆 | `TrophyAwardIcon` | Trofeo / Copa de victoria. |

### 5. 📦 Logística, Envíos & GPS (`logistics`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 📦 | `PackageBoxIcon` | Caja de paquete / Envío. |
| 📷 | `QrScannerIcon` | Marco de escáner de código QR. |
| 📍 | `LocationRadarIcon` | Pin de mapa con radar de ubicación. |

### 6. 🔥 Firebase & Nube (`cloud`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🔥 | `FirebaseIcon` | Llama oficial de Firebase de 3 colores. |
| 🗄️ | `FirestoreIcon` | Logotipo oficial de Cloud Firestore. |
| 🔑 | `FirebaseAuthIcon` | Icono de autenticación de Firebase. |
| ☁️ | `CloudStorageIcon` | Nube de almacenamiento de datos. |
| 🚫 | `DatabaseDisabledIcon` | Base de datos deshabilitada o fuera de línea. |

### 7. 📱 Redes Sociales & Autenticación (`social`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🌐 | `GoogleIcon` | G multicolor oficial de Google. |
| 👍 | `FacebookIcon` | Logotipo oficial de Facebook. |
| 🍎 | `AppleIcon` | Manzana vectorial oficial de Apple. |
| 🐙 | `GithubIcon` | Octocat / Logotipo de GitHub. |
| 📸 | `InstagramIcon` | Cámara con gradiente de Instagram. |
| 𝕏 | `TwitterXIcon` | Logotipo X / Twitter. |
| 💼 | `LinkedinIcon` | Logotipo profesional de LinkedIn. |
| 🎵 | `TiktokIcon` | Nota musical estilizada de TikTok. |
| 💬 | `WhatsappIcon` | Burbuja de chat de WhatsApp. |
| ▶️ | `YoutubeIcon` | Botón de reproducción oficial de YouTube. |

### 8. 💳 Pasarelas de Pago (`payments`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 💳 | `VisaIcon` | Logotipo oficial de Visa. |
| 💳 | `MastercardIcon` | Esferas entrelazadas de Mastercard. |
| 🅿️ | `PaypalIcon` | Logotipo oficial de PayPal. |

### 9. ✦ Sistema & UI (`system`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| ✨ | `SparklesIcon` | Destellos de Inteligencia Artificial / Magia. |
| 🛡️ | `ShieldCheckIcon` | Escudo de seguridad verificado. |

### 10. 🏗️ Ingeniería & Construcción (`engineering`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 👷 | `HardhatWorkerIcon` | Casco de obrero de construcción. |
| 👥 | `WorkCrewIcon` | Equipo de trabajo de ingeniería. |
| 🚜 | `ExcavatorIcon` | Excavadora pesada de obra. |
| 🚛 | `DumpTruckIcon` | Camión de volteo / volquete. |
| 🚜 | `TractorIcon` | Tractor agrícola e industrial. |
| 🛠️ | `EngineeringToolsIcon` | Herramientas cruzadas de ingeniería. |

### 11. 🎵 Música & Controles (`music`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🎼 | `MusicSheetIcon` | Partitura musical. |
| 🎸 | `MusicChordsIcon` | Acordes y notas musicales. |
| ▶️ | `PlayControlIcon` | Botón de reproducción. |
| ⏸️ | `PauseControlIcon` | Botón de pausa. |
| ⏹️ | `StopControlIcon` | Botón de detención. |

### 12. ⚽ Deportes & Fútbol (`football`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| ⚽ | `SoccerBallIcon` | Balón de fútbol clásico. |
| 🏃 | `SoccerPlayerIcon` | Silueta de jugador de fútbol. |
| 👥 | `SoccerTeamIcon` | Alineación de equipo. |
| 🟨 | `YellowCardIcon` | Tarjeta amarilla reglamentaria. |
| 🟥 | `RedCardIcon` | Tarjeta roja de expulsión. |
| 🟨🟥 | `RefereeCardIcon` | Tarjetas de árbitro. |
| 📢 | `RefereeWhistleIcon` | Silbato de árbitro. |
| 📅 | `MatchCalendarIcon` | Calendario de partidos. |

### 13. 💊 Farmacia & Salud (`pharmacy`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 💊 | `PillIcon` | Cápsula / Pastilla médica. |
| 💉 | `SyringeIcon` | Jeringa de inyección. |
| 🩺 | `StethoscopeIcon` | Estetoscopio médico. |
| 🧰 | `FirstAidKitIcon` | Botiquín de primeros auxilios. |
| 🏥 | `HospitalBuildingIcon` | Edificio de hospital. |
| 🍾 | `MedicineBottleIcon` | Frasco de medicina. |

### 14. 🛒 E-Commerce (`ecommerce`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🛍️ | `ShoppingBagIcon` | Bolsa de compras. |
| 🛒 | `ShoppingCartIcon` | Carrito de compras. |
| 🏷️ | `TagDiscountIcon` | Etiqueta de descuento. |
| 🚚 | `DeliveryTruckIcon` | Camión de envíos. |
| 📊 | `BarcodeQrIcon` | Código de barras y QR. |

### 15. 🍔 Gastronomía (`food`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🍽️ | `RestaurantPlateIcon` | Plato de restaurante con cubiertos. |
| 🍔 | `BurgerPizzaIcon` | Comida rápida (hamburguesa/pizza). |
| ☕ | `CoffeeCupIcon` | Taza de café. |
| 🛵 | `DeliveryMotorcycleIcon` | Motocicleta de reparto gastronómico. |
| 👨‍🍳 | `ChefHatIcon` | Gorro de chef. |

### 16. 💼 Finanzas (`finance`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 👛 | `WalletIcon` | Billetera digital/física. |
| 🐖 | `PiggyBankIcon` | Alcancía de ahorro. |
| ₿ | `BitcoinCryptoIcon` | Moneda Bitcoin / Cripto. |
| 📈 | `TrendingChartIcon` | Gráfico financiero ascendente. |
| 🏦 | `BankBuildingIcon` | Edificio bancario. |

### 17. ✈️ Viajes & Turismo (`travel`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| ✈️ | `AirplaneIcon` | Avión comercial. |
| 🧳 | `SuitcaseIcon` | Maleta de viaje. |
| 📍 | `MapPinIcon` | Pin de ubicación en mapa. |
| 🧭 | `CompassIcon` | Brújula de navegación. |
| 🏨 | `HotelBedIcon` | Cama de hotel. |

### 18. 🎓 Educación (`education`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🎓 | `GraduationCapIcon` | Birrete de graduación. |
| 📖 | `BookOpenIcon` | Libro abierto. |
| 📜 | `CertificateAwardIcon` | Certificado / Diploma. |
| 💡 | `IdeaBulbIcon` | Bombilla de idea / conocimiento. |

### 19. 🚗 Automotriz (`automotive`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🚗 | `CarIcon` | Vehículo automóvil. |
| ⛽ | `FuelGasIcon` | Surtidor de combustible / Gasolina. |
| ⏱️ | `SpeedometerIcon` | Velocímetro. |
| 🔑 | `CarKeyIcon` | Llave de auto. |

---

## 💻 Ejemplos de Código

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

// 1. Icono de Cerebro IA
const aiBrain = BrainAiIcon(size: 48);

// 2. Icono de Huella Dactilar
const fingerprint = FingerprintScanIcon(size: 32);

// 3. Icono de Smart Lock en ListTile
ListTile(
  leading: const SmartLockIcon(size: 32),
  title: const Text('Cerradura Inteligente'),
  subtitle: const Text('Conectada por WiFi'),
);
```
