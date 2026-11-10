import 'package:flutter/material.dart';

import 'ai/ai.dart';
import 'cloud/cloud.dart';
import 'ecommerce/ecommerce.dart';
import 'education/education.dart';
import 'engineering/engineering.dart';
import 'feedback/feedback.dart';
import 'finance/finance.dart';
import 'fitness/fitness.dart';
import 'food/food.dart';
import 'football/football.dart';
import 'loaders/loaders.dart';
import 'logistics/logistics.dart';
import 'music/music.dart';
import 'pharmacy/pharmacy.dart';
import 'security/security.dart';
import 'travel/travel.dart';
import 'ui/ui.dart';

/// Catálogo centralizado de acceso a las 32 animaciones nativas a 60–120 FPS.
///
/// Permite autocompletado nativo en el IDE mediante `NativeAnimations.nombre(...)`.
abstract class NativeAnimations {
  // 🤖 Inteligencia Artificial & Chatbots
  static Widget aiThinkingOrbit({
    double size = 56.0,
    Color primaryColor = const Color(0xFF7B2CBF),
    Color accentColor = const Color(0xFF00F5D4),
    Duration duration = const Duration(milliseconds: 2000),
    Key? key,
  }) =>
      NativeAiThinkingOrbit(
        key: key,
        size: size,
        primaryColor: primaryColor,
        accentColor: accentColor,
        duration: duration,
      );

  static Widget typingIndicator({
    double size = 36.0,
    Color? dotColor,
    Duration duration = const Duration(milliseconds: 1200),
    Key? key,
  }) =>
      NativeTypingIndicator(
        key: key,
        size: size,
        dotColor: dotColor,
        duration: duration,
      );

  // 🔒 Seguridad & Biometría
  static Widget fingerprintScan({
    double size = 56.0,
    Color fingerprintColor = const Color(0xFF0288D1),
    Color laserColor = const Color(0xFF00E676),
    Duration duration = const Duration(milliseconds: 1800),
    Key? key,
  }) =>
      NativeFingerprintScan(
        key: key,
        size: size,
        fingerprintColor: fingerprintColor,
        laserColor: laserColor,
        duration: duration,
      );

  // 💳 Finanzas & Pagos
  static Widget creditCardNfc({
    double width = 64.0,
    double height = 42.0,
    Color cardColor = const Color(0xFF1E88E5),
    Color signalColor = const Color(0xFFFFCA28),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeCreditCardNfc(
        key: key,
        width: width,
        height: height,
        cardColor: cardColor,
        signalColor: signalColor,
        duration: duration,
      );

  static Widget cryptoChartUp({
    double width = 54.0,
    double height = 36.0,
    Duration duration = const Duration(milliseconds: 2000),
    Key? key,
  }) =>
      NativeCryptoChartUp(
        key: key,
        width: width,
        height: height,
        duration: duration,
      );

  // 🏋️ Salud & Fitness
  static Widget waterWaveFill({
    double size = 56.0,
    Color waveColor = const Color(0xFF0288D1),
    Duration duration = const Duration(milliseconds: 2000),
    Key? key,
  }) =>
      NativeWaterWaveFill(
        key: key,
        size: size,
        waveColor: waveColor,
        duration: duration,
      );

  // 📦 Logística & Envíos
  static Widget truckMoving({
    double size = 64.0,
    Color truckColor = const Color(0xFF1565C0),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeTruckMoving(
        key: key,
        size: size,
        truckColor: truckColor,
        duration: duration,
      );

  static Widget radarPin({
    double size = 56.0,
    Color pinColor = const Color(0xFFD32F2F),
    Color pulseColor = const Color(0xFFEF5350),
    Duration duration = const Duration(milliseconds: 1600),
    Key? key,
  }) =>
      NativeRadarPin(
        key: key,
        size: size,
        pinColor: pinColor,
        pulseColor: pulseColor,
        duration: duration,
      );

  // 🔥 Firebase & Nube
  static Widget cloudSync({
    double size = 56.0,
    Color cloudColor = const Color(0xFF0288D1),
    Color syncColor = const Color(0xFFFFCA28),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeCloudSync(
        key: key,
        size: size,
        cloudColor: cloudColor,
        syncColor: syncColor,
        duration: duration,
      );

  static Widget dataUpload({
    double size = 56.0,
    Color cloudColor = const Color(0xFF0288D1),
    Color arrowColor = const Color(0xFF00E676),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeDataUpload(
        key: key,
        size: size,
        cloudColor: cloudColor,
        arrowColor: arrowColor,
        duration: duration,
      );

  static Widget dataDownload({
    double size = 56.0,
    Color cloudColor = const Color(0xFF0288D1),
    Color arrowColor = const Color(0xFF2979FF),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeDataDownload(
        key: key,
        size: size,
        cloudColor: cloudColor,
        arrowColor: arrowColor,
        duration: duration,
      );

  static Widget databaseOffline({
    double size = 56.0,
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeDatabaseOffline(
        key: key,
        size: size,
        duration: duration,
      );

  // 🌀 Cargadores & Spinners
  static Widget loadingSpinner({
    double size = 40.0,
    Color color = const Color(0xFF0288D1),
    Duration duration = const Duration(milliseconds: 1000),
    Key? key,
  }) =>
      NativeLoadingSpinner(
        key: key,
        size: size,
        color: color,
        duration: duration,
      );

  static Widget pulsingHeart({
    double size = 44.0,
    Color color = const Color(0xFFE53935),
    Duration duration = const Duration(milliseconds: 1000),
    Key? key,
  }) =>
      NativePulsingHeart(
        key: key,
        size: size,
        color: color,
        duration: duration,
      );

  static Widget pulseRipple({
    double size = 48.0,
    Color color = const Color(0xFF0288D1),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativePulseRipple(
        key: key,
        size: size,
        color: color,
        duration: duration,
      );

  static Widget bouncingDots({
    double size = 10.0,
    Color? color,
    Duration duration = const Duration(milliseconds: 1200),
    Key? key,
  }) =>
      NativeBouncingDots(
        key: key,
        size: size,
        color: color,
        duration: duration,
      );

  // ✅ Retroalimentación (Feedback)
  static Widget successCheckmark({
    double size = 48.0,
    Duration duration = const Duration(milliseconds: 1200),
    Key? key,
  }) =>
      NativeSuccessCheckmark(
        key: key,
        size: size,
        duration: duration,
      );

  static Widget errorCross({
    double size = 48.0,
    Duration duration = const Duration(milliseconds: 1200),
    Key? key,
  }) =>
      NativeErrorCross(
        key: key,
        size: size,
        duration: duration,
      );

  static Widget waveBars({
    double height = 32.0,
    Duration duration = const Duration(milliseconds: 1200),
    Key? key,
  }) =>
      NativeWaveBars(
        key: key,
        height: height,
        duration: duration,
      );

  // ✨ Interfaz de Usuario Avanzada (UI)
  static Widget shimmerButton({
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
    double height = 48.0,
    Key? key,
  }) =>
      NativeShimmerButton(
        key: key,
        text: text,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        textColor: textColor,
        height: height,
      );

  static Widget pulseBadge({
    required Widget child,
    String? count,
    Color badgeColor = const Color(0xFFE53935),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativePulseBadge(
        key: key,
        count: count,
        badgeColor: badgeColor,
        duration: duration,
        child: child,
      );

  static Widget skeletonShimmer({
    double width = double.infinity,
    double height = 16.0,
    double borderRadius = 8.0,
    Key? key,
  }) =>
      NativeSkeletonShimmer(
        key: key,
        width: width,
        height: height,
        borderRadius: borderRadius,
      );

  static Widget ringProgress({
    double size = 56.0,
    Color primaryColor = const Color(0xFF00E676),
    Color secondaryColor = const Color(0xFF2979FF),
    Duration duration = const Duration(milliseconds: 2000),
    Key? key,
  }) =>
      NativeRingProgress(
        key: key,
        size: size,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        duration: duration,
      );

  // 🎭 Animaciones Temáticas por Industria
  static Widget cartBadgePulse({
    double size = 48.0,
    Color cartColor = const Color(0xFF1E88E5),
    Color badgeColor = const Color(0xFFE53935),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeCartBadgePulse(
        key: key,
        size: size,
        cartColor: cartColor,
        badgeColor: badgeColor,
        duration: duration,
      );

  static Widget ideaBulbGlow({
    double size = 48.0,
    Color bulbColor = const Color(0xFFFFB300),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeIdeaBulbGlow(
        key: key,
        size: size,
        bulbColor: bulbColor,
        duration: duration,
      );

  static Widget excavatorDigging({
    double size = 56.0,
    Duration duration = const Duration(milliseconds: 2000),
    Key? key,
  }) =>
      NativeExcavatorDigging(
        key: key,
        size: size,
        duration: duration,
      );

  static Widget coffeeSteam({
    double size = 48.0,
    Duration duration = const Duration(milliseconds: 2000),
    Key? key,
  }) =>
      NativeCoffeeSteam(
        key: key,
        size: size,
        duration: duration,
      );

  static Widget soccerBallBounce({
    double size = 48.0,
    Duration duration = const Duration(milliseconds: 1000),
    Key? key,
  }) =>
      NativeSoccerBallBounce(
        key: key,
        size: size,
        duration: duration,
      );

  static Widget audioEqualizer({
    double width = 48.0,
    double height = 36.0,
    Duration duration = const Duration(milliseconds: 1200),
    Key? key,
  }) =>
      NativeAudioEqualizer(
        key: key,
        width: width,
        height: height,
        duration: duration,
      );

  static Widget heartbeatPulse({
    double width = 54.0,
    double height = 36.0,
    Color lineColor = const Color(0xFFE53935),
    Duration duration = const Duration(milliseconds: 1500),
    Key? key,
  }) =>
      NativeHeartbeatPulse(
        key: key,
        width: width,
        height: height,
        lineColor: lineColor,
        duration: duration,
      );

  static Widget pillDrip({
    double size = 48.0,
    Duration duration = const Duration(milliseconds: 2000),
    Key? key,
  }) =>
      NativePillDrip(
        key: key,
        size: size,
        duration: duration,
      );

  static Widget flightTakeoff({
    double size = 48.0,
    Color planeColor = const Color(0xFF1E88E5),
    Duration duration = const Duration(milliseconds: 2000),
    Key? key,
  }) =>
      NativeFlightTakeoff(
        key: key,
        size: size,
        planeColor: planeColor,
        duration: duration,
      );
}
