import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

void main() {
  group('Iconos Vectoriales Nativos - Categorías Básicas', () {
    testWidgets('FirebaseIcon renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: FirebaseIcon(size: 36))),
      );
      expect(find.byType(FirebaseIcon), findsOneWidget);
    });

    testWidgets('GoogleIcon renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: GoogleIcon(size: 36))),
      );
      expect(find.byType(GoogleIcon), findsOneWidget);
    });

    testWidgets('ShieldCheckIcon renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: ShieldCheckIcon(size: 36))),
      );
      expect(find.byType(ShieldCheckIcon), findsOneWidget);
    });

    testWidgets('VisaIcon renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: VisaIcon(size: 36))),
      );
      expect(find.byType(VisaIcon), findsOneWidget);
    });
  });

  group('Catálogo Centralizado - NativeIcons y NativeAnimations', () {
    testWidgets('NativeIcons factory methods render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NativeIcons.brainAi(size: 36),
                NativeIcons.firebase(size: 36),
                NativeIcons.google(size: 36),
                NativeIcons.smartLock(size: 36),
                NativeIcons.dumbbell(size: 36),
                NativeIcons.packageBox(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(BrainAiIcon), findsOneWidget);
      expect(find.byType(FirebaseIcon), findsOneWidget);
      expect(find.byType(GoogleIcon), findsOneWidget);
      expect(find.byType(SmartLockIcon), findsOneWidget);
      expect(find.byType(DumbbellIcon), findsOneWidget);
      expect(find.byType(PackageBoxIcon), findsOneWidget);
    });

    testWidgets('NativeAnimations factory methods render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NativeAnimations.aiThinkingOrbit(size: 48),
                NativeAnimations.cloudSync(size: 48),
                NativeAnimations.fingerprintScan(size: 48),
                NativeAnimations.creditCardNfc(width: 64, height: 42),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(NativeAiThinkingOrbit), findsOneWidget);
      expect(find.byType(NativeCloudSync), findsOneWidget);
      expect(find.byType(NativeFingerprintScan), findsOneWidget);
      expect(find.byType(NativeCreditCardNfc), findsOneWidget);
    });
  });

  group('Iconos Vectoriales Nativos - Nuevas Categorías (v1.1.0)', () {
    testWidgets('Iconos de Inteligencia Artificial renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                BrainAiIcon(size: 36),
                BotMessageIcon(size: 36),
                WandMagicIcon(size: 36),
                CpuChipIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(BrainAiIcon), findsOneWidget);
      expect(find.byType(BotMessageIcon), findsOneWidget);
      expect(find.byType(WandMagicIcon), findsOneWidget);
      expect(find.byType(CpuChipIcon), findsOneWidget);
    });

    testWidgets('Iconos de Biometría & Seguridad renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                FingerprintScanIcon(size: 36),
                FaceIdIcon(size: 36),
                KeyholeLockIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(FingerprintScanIcon), findsOneWidget);
      expect(find.byType(FaceIdIcon), findsOneWidget);
      expect(find.byType(KeyholeLockIcon), findsOneWidget);
    });

    testWidgets('Iconos de Domótica & Smart Home renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                SmartLockIcon(size: 36),
                LightBulbSmartIcon(size: 36),
                ThermometerSmartIcon(size: 36),
                SolarPanelIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(SmartLockIcon), findsOneWidget);
      expect(find.byType(LightBulbSmartIcon), findsOneWidget);
      expect(find.byType(ThermometerSmartIcon), findsOneWidget);
      expect(find.byType(SolarPanelIcon), findsOneWidget);
    });

    testWidgets('Iconos de Fitness & Deportes renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                DumbbellIcon(size: 36),
                FlameKcalIcon(size: 36),
                WaterDropIcon(size: 36),
                TrophyAwardIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(DumbbellIcon), findsOneWidget);
      expect(find.byType(FlameKcalIcon), findsOneWidget);
      expect(find.byType(WaterDropIcon), findsOneWidget);
      expect(find.byType(TrophyAwardIcon), findsOneWidget);
    });

    testWidgets('Iconos de Logística & Envíos renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                PackageBoxIcon(size: 36),
                QrScannerIcon(size: 36),
                LocationRadarIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(PackageBoxIcon), findsOneWidget);
      expect(find.byType(QrScannerIcon), findsOneWidget);
      expect(find.byType(LocationRadarIcon), findsOneWidget);
    });
  });

  group('Animaciones Nativas - Nuevas Animaciones (v1.1.0)', () {
    testWidgets('NativeAiThinkingOrbit animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeAiThinkingOrbit(size: 48))),
      );
      expect(find.byType(NativeAiThinkingOrbit), findsOneWidget);
    });

    testWidgets('NativeTypingIndicator animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeTypingIndicator(size: 36))),
      );
      expect(find.byType(NativeTypingIndicator), findsOneWidget);
    });

    testWidgets('NativeFingerprintScan animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeFingerprintScan(size: 48))),
      );
      expect(find.byType(NativeFingerprintScan), findsOneWidget);
    });

    testWidgets('NativeCreditCardNfc animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeCreditCardNfc(width: 64, height: 42))),
      );
      expect(find.byType(NativeCreditCardNfc), findsOneWidget);
    });

    testWidgets('NativeWaterWaveFill animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeWaterWaveFill(size: 48))),
      );
      expect(find.byType(NativeWaterWaveFill), findsOneWidget);
    });

    testWidgets('NativeTruckMoving animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeTruckMoving(size: 48))),
      );
      expect(find.byType(NativeTruckMoving), findsOneWidget);
    });

    testWidgets('NativeRadarPin animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeRadarPin(size: 48))),
      );
      expect(find.byType(NativeRadarPin), findsOneWidget);
    });

    testWidgets('NativeRingProgress animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeRingProgress(size: 48))),
      );
      expect(find.byType(NativeRingProgress), findsOneWidget);
    });
  });
}
