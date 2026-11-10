# ⚡ Native Animations Guide (60–120 FPS)

The **32 native animations** in **`flutter_native_ui_nyk`** are powered by `AnimationController` and `CustomPainter`. Every animation is wrapped in a `RepaintBoundary` widget to ensure maximum rendering performance, reducing CPU/GPU overhead with zero unnecessary widget tree recompositions.

---

## ⚙️ Standard Animation Parameters

Most animation widgets accept the following configurable parameters:

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **`size`** | `double` | Variable (`48.0` to `64.0`) | Square dimension (width and height) of the animation. |
| **`duration`** | `Duration` | `Duration(milliseconds: 1500)` | Full cycle loop duration of the animation. |
| **`color`** | `Color?` | `null` | Primary animation color (if applicable). |

---

## 🎭 Catalog of All 32 Native Animations

### 1. 🤖 AI & Chatbots (`ai`)

- **`NativeAiThinkingOrbit`**: Central sphere with electron particles orbiting while AI generates a response.
- **`NativeTypingIndicator`**: Three dots bouncing vertically ("Typing...").

### 2. 🔒 Security & Biometrics (`security`)

- **`NativeFingerprintScan`**: Fingerprint with animated laser beam scanning up and down.

### 3. 💳 Finance & Payments (`finance`)

- **`NativeCreditCardNfc`**: Credit card transmitting contactless (NFC) signal waves.
- **`NativeCryptoChartUp`**: Real-time drawing crypto candlestick / trend chart.

### 4. 🏋️ Health & Fitness (`fitness`)

- **`NativeWaterWaveFill`**: Water drop filling with animated liquid waves.

### 5. 📦 Logistics & Shipping (`logistics`)

- **`NativeTruckMoving`**: Shipping truck moving with spinning wheels and motion wind.
- **`NativeRadarPin`**: Map pin emitting GPS radar search pulses.

### 6. 🔥 Firebase & Cloud (`cloud`)

- **`NativeCloudSync`**: Cloud with continuous rotating arrows.
- **`NativeDataUpload`**: Cloud with animated upward upload arrow.
- **`NativeDataDownload`**: Cloud with animated downward download arrow.
- **`NativeDatabaseOffline`**: Database with pulsing offline alert state.

### 7. 🌀 Loaders & Spinners (`loaders`)

- **`NativeLoadingSpinner`**: Lightweight native circular loading spinner.
- **`NativePulsingHeart`**: Heart with continuous rhythmic heartbeat pulse.
- **`NativePulseRipple`**: Radial concentric wave pulse ripples.
- **`NativeBouncingDots`**: Three dots bouncing in harmonious sequence.

### 8. ✅ Feedback (`feedback`)

- **`NativeSuccessCheckmark`**: Success checkmark with live path drawing animation.
- **`NativeErrorCross`**: Error cross with corner-to-corner stroke drawing.
- **`NativeWaveBars`**: Oscillating audio / voice wave bars.

### 9. ✨ Advanced UI (`ui`)

- **`NativeShimmerButton`**: Interactive button with continuous metallic light shimmer.
- **`NativePulseBadge`**: Notification badge with radiant halo glow.
- **`NativeSkeletonShimmer`**: Skeleton loading block with moving gradient.
- **`NativeRingProgress`**: Circular progress ring with gradient.

### 10. 🎭 Industry Thematic Animations

- **`NativeCartBadgePulse`** *(E-Commerce)*: Shopping cart badge with pulsing item count.
- **`NativeIdeaBulbGlow`** *(Education)*: Light bulb with filament and radiant glowing rays.
- **`NativeExcavatorDigging`** *(Engineering)*: Mechanical excavator arm with realistic digging motion.
- **`NativeCoffeeSteam`** *(Gastronomy)*: Coffee cup with floating, rising steam waves.
- **`NativeSoccerBallBounce`** *(Football)*: Bouncing soccer ball with dynamic shadow physics.
- **`NativeAudioEqualizer`** *(Music)*: Graphic music equalizer with 4 independent bars.
- **`NativeHeartbeatPulse`** *(Pharmacy)*: Electrocardiogram (ECG) line with moving trace.
- **`NativePillDrip`** *(Pharmacy)*: Capsule dripping active medical liquid.
- **`NativeFlightTakeoff`** *(Travel)*: Airplane taking off over animated horizon line.

---

## 💻 Integration Examples

### 1. AI Thinking Animation
```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

Widget aiThinking() {
  return const Column(
    children: [
      NativeAiThinkingOrbit(size: 64),
      SizedBox(height: 12),
      Text('AI generating response...'),
    ],
  );
}
```

---

### 2. Credit Card NFC Animation
```dart
Widget nfcPayment() {
  return const NativeCreditCardNfc(
    width: 64,
    height: 42,
  );
}
```

---

### 3. Shimmer Action Button
```dart
NativeShimmerButton(
  text: 'PROCESS PAYMENT',
  height: 52,
  onPressed: () {
    print('Processing payment...');
  },
);
```
