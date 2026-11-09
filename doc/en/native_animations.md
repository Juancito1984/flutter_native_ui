# ⚡ Native Animations Guide (60–120 FPS)

The **24 native animations** in **`flutter_native_ui_nyk`** are powered by `AnimationController` and `CustomPainter`. Every animation is wrapped in a `RepaintBoundary` widget to ensure maximum rendering performance, reducing CPU/GPU overhead with zero unnecessary widget tree recompositions.

---

## ⚙️ Standard Animation Parameters

Most animation widgets accept the following configurable parameters:

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **`size`** | `double` | Variable (`48.0` to `64.0`) | Square dimension (width and height) of the animation. |
| **`duration`** | `Duration` | `Duration(milliseconds: 1500)` | Full cycle loop duration of the animation. |
| **`color`** | `Color?` | `null` | Primary animation color (if applicable). |

---

## 🎭 Catalog of All 24 Native Animations

### 1. 🔥 Firebase & Cloud (`cloud`)

- **`NativeCloudSync`**: Cloud with continuous rotating arrows.
- **`NativeDataUpload`**: Cloud with animated upward upload arrow.
- **`NativeDataDownload`**: Cloud with animated downward download arrow.
- **`NativeDatabaseOffline`**: Database with pulsing offline alert state.

### 2. 🌀 Loaders & Spinners (`loaders`)

- **`NativeLoadingSpinner`**: Lightweight native circular loading spinner.
- **`NativePulsingHeart`**: Heart with continuous rhythmic heartbeat pulse.
- **`NativePulseRipple`**: Radial concentric wave pulse ripples.
- **`NativeBouncingDots`**: Three dots bouncing in harmonious sequence.

### 3. ✅ Feedback (`feedback`)

- **`NativeSuccessCheckmark`**: Success checkmark with live path drawing animation.
- **`NativeErrorCross`**: Error cross with corner-to-corner stroke drawing.
- **`NativeWaveBars`**: Oscillating audio / voice wave bars.

### 4. ✨ Advanced UI (`ui`)

- **`NativeShimmerButton`**: Interactive button with continuous metallic light shimmer.
- **`NativePulseBadge`**: Notification badge with radiant halo glow.
- **`NativeSkeletonShimmer`**: Skeleton loading block with moving gradient.

### 5. 🎭 Industry Thematic Animations

- **`NativeCartBadgePulse`** *(E-Commerce)*: Shopping cart badge with pulsing item count.
- **`NativeIdeaBulbGlow`** *(Education)*: Light bulb with filament and radiant glowing rays.
- **`NativeExcavatorDigging`** *(Engineering)*: Mechanical excavator arm with realistic digging motion.
- **`NativeCryptoChartUp`** *(Finance)*: Real-time drawing crypto candlestick / trend chart.
- **`NativeCoffeeSteam`** *(Gastronomy)*: Coffee cup with floating, rising steam waves.
- **`NativeSoccerBallBounce`** *(Football)*: Bouncing soccer ball with dynamic shadow physics.
- **`NativeAudioEqualizer`** *(Music)*: Graphic music equalizer with 4 independent bars.
- **`NativeHeartbeatPulse`** *(Pharmacy)*: Electrocardiogram (ECG) line with moving trace.
- **`NativePillDrip`** *(Pharmacy)*: Capsule dripping active medical liquid.
- **`NativeFlightTakeoff`** *(Travel)*: Airplane taking off over animated horizon line.

---

## 💻 Integration Examples

### 1. Loading & Cloud Sync Indicator
```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

Widget loadingState() {
  return const Column(
    children: [
      NativeCloudSync(size: 64),
      SizedBox(height: 12),
      Text('Syncing data with cloud...'),
    ],
  );
}
```

---

### 2. Successful Form Feedback Modal
```dart
void showSuccessModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NativeSuccessCheckmark(size: 72),
          SizedBox(height: 16),
          Text('Operation completed successfully!'),
        ],
      ),
    ),
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
