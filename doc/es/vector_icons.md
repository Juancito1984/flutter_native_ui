# 🎯 Guía de Iconos Vectoriales Nativos

La librería **`flutter_native_ui_nyk`** incluye **66 iconos vectoriales nativos** dibujados con `CustomPainter`. Al no requerir archivos SVG ni fuentes tipográficas de terceros, garantizan **0 sobrecarga en tiempo de ejecución**, peso mínimo y total nitidez a cualquier tamaño de pantalla.

---

## ⚙️ Propiedades Comunes de los Iconos

Todos los iconos vectoriales aceptan los siguientes parámetros estandarizados:

| Parámetro | Tipo | Valor por Defecto | Descripción |
| :--- | :--- | :--- | :--- |
| **`size`** | `double` | `24.0` | Ancho y alto del contenedor del icono en píxeles lógicos. |
| **`color`** | `Color?` | `null` | Color principal de trazo o relleno (si el icono es monocromático). Si es nulo, toma el tema actual. |

---

## 📂 Catálogo Completo por Categorías (66 Iconos)

### 1. 🔥 Firebase & Nube (`cloud`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🔥 | `FirebaseIcon` | Llama oficial de Firebase de 3 colores (`#FFCA28`, `#FFA000`, `#DD2C00`). |
| 🗄️ | `FirestoreIcon` | Logotipo oficial de Cloud Firestore. |
| 🔑 | `FirebaseAuthIcon` | Icono de autenticación de usuarios de Firebase. |
| ☁️ | `CloudStorageIcon` | Nube de almacenamiento de datos. |
| 🚫 | `DatabaseDisabledIcon` | Base de datos deshabilitada o fuera de línea. |

### 2. 📱 Redes Sociales & Autenticación (`social`)
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

### 3. 💳 Pasarelas de Pago (`payments`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 💳 | `VisaIcon` | Logotipo oficial de Visa. |
| 💳 | `MastercardIcon` | Esferas entrelazadas oficiales de Mastercard. |
| 🅿️ | `PaypalIcon` | Logotipo oficial de PayPal. |

### 4. ✦ Sistema & UI (`system`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| ✨ | `SparklesIcon` | Destellos de Inteligencia Artificial / Magia. |
| 🛡️ | `ShieldCheckIcon` | Escudo de seguridad verificado. |

### 5. 🏗️ Ingeniería & Construcción (`engineering`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 👷 | `HardhatWorkerIcon` | Casco de obrero de construcción. |
| 👥 | `WorkCrewIcon` | Equipo de trabajo de ingeniería. |
| 🚜 | `ExcavatorIcon` | Excavadora pesada de obra. |
| 🚛 | `DumpTruckIcon` | Camión de volteo / volquete. |
| 🚜 | `TractorIcon` | Tractor agrícola e industrial. |
| 🛠️ | `EngineeringToolsIcon` | Herramientas cruzadas de ingeniería. |

### 6. 🎵 Música & Controles (`music`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🎼 | `MusicSheetIcon` | Partitura musical. |
| 🎸 | `MusicChordsIcon` | Acordes y notas musicales. |
| ▶️ | `PlayControlIcon` | Botón de reproducción. |
| ⏸️ | `PauseControlIcon` | Botón de pausa. |
| ⏹️ | `StopControlIcon` | Botón de detención. |

### 7. ⚽ Deportes & Fútbol (`football`)
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

### 8. 💊 Farmacia & Salud (`pharmacy`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 💊 | `PillIcon` | Cápsula / Pastilla médica. |
| 💉 | `SyringeIcon` | Jeringa de inyección. |
| 🩺 | `StethoscopeIcon` | Estetoscopio médico. |
| 🧰 | `FirstAidKitIcon` | Botiquín de primeros auxilios. |
| 🏥 | `HospitalBuildingIcon` | Edificio de hospital. |
| 🍾 | `MedicineBottleIcon` | Frasco de medicina. |

### 9. 🛒 E-Commerce (`ecommerce`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🛍️ | `ShoppingBagIcon` | Bolsa de compras. |
| 🛒 | `ShoppingCartIcon` | Carrito de compras. |
| 🏷️ | `TagDiscountIcon` | Etiqueta de descuento. |
| 🚚 | `DeliveryTruckIcon` | Camión de envíos. |
| 📊 | `BarcodeQrIcon` | Código de barras y QR. |

### 10. 🍔 Gastronomía (`food`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🍽️ | `RestaurantPlateIcon` | Plato de restaurante con cubiertos. |
| 🍔 | `BurgerPizzaIcon` | Comida rápida (hamburguesa/pizza). |
| ☕ | `CoffeeCupIcon` | Taza de café. |
| 🛵 | `DeliveryMotorcycleIcon` | Motocicleta de reparto gastronómico. |
| 👨‍🍳 | `ChefHatIcon` | Gorro de chef. |

### 11. 💼 Finanzas (`finance`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 👛 | `WalletIcon` | Billetera digital/física. |
| 🐖 | `PiggyBankIcon` | Alcancía de ahorro. |
| ₿ | `BitcoinCryptoIcon` | Moneda Bitcoin / Cripto. |
| 📈 | `TrendingChartIcon` | Gráfico financiero ascendente. |
| 🏦 | `BankBuildingIcon` | Edificio bancario. |

### 12. ✈️ Viajes & Turismo (`travel`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| ✈️ | `AirplaneIcon` | Avión comercial. |
| 🧳 | `SuitcaseIcon` | Maleta de viaje. |
| 📍 | `MapPinIcon` | Pin de ubicación en mapa. |
| 🧭 | `CompassIcon` | Brújula de navegación. |
| 🏨 | `HotelBedIcon` | Cama de hotel. |

### 13. 🎓 Educación (`education`)
| Icono | Clase Dart | Descripción |
| :--- | :--- | :--- |
| 🎓 | `GraduationCapIcon` | Birrete de graduación. |
| 📖 | `BookOpenIcon` | Libro abierto. |
| 📜 | `CertificateAwardIcon` | Certificado / Diploma. |
| 💡 | `IdeaBulbIcon` | Bombilla de idea / conocimiento. |

### 14. 🚗 Automotriz (`automotive`)
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

// 1. Icono de tarjeta Visa
const visa = VisaIcon(size: 48);

// 2. Icono de Google con tamaño personalizado
const googleBtn = GoogleIcon(size: 32);

// 3. Icono de Seguridad en ListTile
ListTile(
  leading: const ShieldCheckIcon(size: 32),
  title: const Text('Cuenta Verificada'),
  subtitle: const Text('Protegida con autenticación en dos pasos'),
);
```
