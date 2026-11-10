# ⚡ Guía de Animaciones Nativas (60–120 FPS)

Las **32 animaciones nativas** de **`flutter_native_ui_nyk`** están construidas sobre `AnimationController` y `CustomPainter`. Cada animación se encuentra envuelta en un widget `RepaintBoundary` para garantizar el máximo rendimiento en pantalla, reduciendo la carga de CPU/GPU a cero recomposiciones innecesarias.

---

## ⚙️ Propiedades Comunes de las Animaciones

La mayoría de los widgets de animación aceptan los siguientes parámetros configurables:

| Parámetro | Tipo | Valor por Defecto | Descripción |
| :--- | :--- | :--- | :--- |
| **`size`** | `double` | Variables (`48.0` a `64.0`) | Dimensión cuadrada (ancho y alto) de la animación. |
| **`duration`** | `Duration` | `Duration(milliseconds: 1500)` | Tiempo de ciclo completo de la animación. |
| **`color`** | `Color?` | `null` | Color primario de la animación (si aplica). |

---

## 🎭 Catálogo Completo de las 32 Animaciones Nativas

### 1. 🤖 Inteligencia Artificial & Chatbots (`ai`)

- **`NativeAiThinkingOrbit`**: Esfera central con partículas en órbitas elípticas rotando mientras la IA genera una respuesta.
- **`NativeTypingIndicator`**: Tres puntos de escritura oscilando ("Escribiendo...").

### 2. 🔒 Seguridad & Biometría (`security`)

- **`NativeFingerprintScan`**: Huella dactilar con rayo láser horizontal animado subiendo y bajando.

### 3. 💳 Finanzas & Pagos (`finance`)

- **`NativeCreditCardNfc`**: Tarjeta de crédito emitiendo ondas de señal *Contactless* (NFC) en vivo.
- **`NativeCryptoChartUp`**: Gráfica de velas / tendencia cripto dibujándose en tiempo real.

### 4. 🏋️ Salud & Fitness (`fitness`)

- **`NativeWaterWaveFill`**: Gota de agua llenándose con ondas de líquido animadas.

### 5. 📦 Logística & Envíos (`logistics`)

- **`NativeTruckMoving`**: Camión de reparto avanzando en vivo con ruedas giratorias y viento.
- **`NativeRadarPin`**: Pin de mapa emitiendo pulso radial de búsqueda por GPS.

### 6. 🔥 Firebase & Nube (`cloud`)

- **`NativeCloudSync`**: Nube con flechas circulares de sincronización giratoria continua.
- **`NativeDataUpload`**: Nube con flecha de carga animada de abajo hacia arriba.
- **`NativeDataDownload`**: Nube con flecha de descarga animada de arriba hacia abajo.
- **`NativeDatabaseOffline`**: Base de datos con pulso de advertencia y estado fuera de línea.

### 7. 🌀 Cargadores y Spinners (`loaders`)

- **`NativeLoadingSpinner`**: Spinner circular nativo fluido ultra liviano.
- **`NativePulsingHeart`**: Corazón con latido rítmico continuo.
- **`NativePulseRipple`**: Ondas concéntricas de pulso radial.
- **`NativeBouncingDots`**: Tres puntos rebotando en secuencia armónica.

### 8. ✅ Retroalimentación (`feedback`)

- **`NativeSuccessCheckmark`**: Marca de verificación (*Checkmark*) animada con efecto de trazado en vivo.
- **`NativeErrorCross`**: Cruz de error animada con dibujo de trazo de esquina a esquina.
- **`NativeWaveBars`**: Barras de onda de audio/voz oscilantes.

### 9. ✨ Interfaz de Usuario Avanzada (`ui`)

- **`NativeShimmerButton`**: Botón interactivo con destello de luz metálico continuo (*Shimmer*).
- **`NativePulseBadge`**: Insignia con halo de brillo radiante de notificación.
- **`NativeSkeletonShimmer`**: Bloque de carga esqueleto (*Skeleton Loader*) con degradado en movimiento.
- **`NativeRingProgress`**: Anillo circular de progreso con degradado.

### 10. 🎭 Animaciones Temáticas Industriales

- **`NativeCartBadgePulse`** *(E-Commerce)*: Carrito de compras con número de items oscilante.
- **`NativeIdeaBulbGlow`** *(Educación)*: Bombilla con filamento y rayos de luz resplandeciente.
- **`NativeExcavatorDigging`** *(Ingeniería)*: Excavadora con brazo mecánico en movimiento de excavación.
- **`NativeCoffeeSteam`** *(Gastronomía)*: Taza de café con ondas de vapor flotantes y ascendentes.
- **`NativeSoccerBallBounce`** *(Fútbol)*: Balón de fútbol rebotando con física de sombra dinámica.
- **`NativeAudioEqualizer`** *(Música)*: Ecualizador gráfico de música con 4 barras independientes.
- **`NativeHeartbeatPulse`** *(Farmacia)*: Línea de electrocardiograma (ECG) con trazo en movimiento.
- **`NativePillDrip`** *(Farmacia)*: Cápsula goteando sustancia médica activa.
- **`NativeFlightTakeoff`** *(Viajes)*: Avión despegando sobre línea de horizonte animada.

---

## 💻 Ejemplos de Integración

### 1. Indicador de IA Pensando
```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

Widget aiThinking() {
  return const Column(
    children: [
      NativeAiThinkingOrbit(size: 64),
      SizedBox(height: 12),
      Text('Generando respuesta de IA...'),
    ],
  );
}
```

---

### 2. Animación NFC de Tarjeta de Crédito
```dart
Widget pagoNfc() {
  return const NativeCreditCardNfc(
    width: 64,
    height: 42,
  );
}
```

---

### 3. Botón de Acción Principal con Efecto Shimmer
```dart
NativeShimmerButton(
  text: 'PROCESAR PAGO',
  height: 52,
  onPressed: () {
    print('Procesando pago...');
  },
);
```
