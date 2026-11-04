import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_native_ui/flutter_native_ui.dart';

void main() {
  group('Iconos Vectoriales Nativos - Categorías Existentes', () {
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

  group('Iconos Vectoriales Nativos - Categorías Temáticas', () {
    testWidgets('Iconos de Ingeniería renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                HardhatWorkerIcon(size: 36),
                WorkCrewIcon(size: 36),
                ExcavatorIcon(size: 36),
                DumpTruckIcon(size: 36),
                TractorIcon(size: 36),
                EngineeringToolsIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(HardhatWorkerIcon), findsOneWidget);
      expect(find.byType(WorkCrewIcon), findsOneWidget);
      expect(find.byType(ExcavatorIcon), findsOneWidget);
      expect(find.byType(DumpTruckIcon), findsOneWidget);
      expect(find.byType(TractorIcon), findsOneWidget);
      expect(find.byType(EngineeringToolsIcon), findsOneWidget);
    });

    testWidgets('Iconos de Música renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                MusicSheetIcon(size: 36),
                MusicChordsIcon(size: 36),
                PlayControlIcon(size: 36),
                PauseControlIcon(size: 36),
                StopControlIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(MusicSheetIcon), findsOneWidget);
      expect(find.byType(MusicChordsIcon), findsOneWidget);
      expect(find.byType(PlayControlIcon), findsOneWidget);
      expect(find.byType(PauseControlIcon), findsOneWidget);
      expect(find.byType(StopControlIcon), findsOneWidget);
    });

    testWidgets('Iconos de Fútbol renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                SoccerBallIcon(size: 36),
                SoccerPlayerIcon(size: 36),
                SoccerTeamIcon(size: 36),
                YellowCardIcon(size: 36),
                RedCardIcon(size: 36),
                RefereeCardIcon(size: 36),
                RefereeWhistleIcon(size: 36),
                MatchCalendarIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(SoccerBallIcon), findsOneWidget);
      expect(find.byType(SoccerPlayerIcon), findsOneWidget);
      expect(find.byType(SoccerTeamIcon), findsOneWidget);
      expect(find.byType(YellowCardIcon), findsOneWidget);
      expect(find.byType(RedCardIcon), findsOneWidget);
      expect(find.byType(RefereeCardIcon), findsOneWidget);
      expect(find.byType(RefereeWhistleIcon), findsOneWidget);
      expect(find.byType(MatchCalendarIcon), findsOneWidget);
    });

    testWidgets('Iconos de Farmacia y Salud renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                PillIcon(size: 36),
                SyringeIcon(size: 36),
                StethoscopeIcon(size: 36),
                FirstAidKitIcon(size: 36),
                HospitalBuildingIcon(size: 36),
                MedicineBottleIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(PillIcon), findsOneWidget);
      expect(find.byType(SyringeIcon), findsOneWidget);
      expect(find.byType(StethoscopeIcon), findsOneWidget);
      expect(find.byType(FirstAidKitIcon), findsOneWidget);
      expect(find.byType(HospitalBuildingIcon), findsOneWidget);
      expect(find.byType(MedicineBottleIcon), findsOneWidget);
    });
  });

  group('Animaciones Nativas', () {
    testWidgets('NativeCloudSync renders and animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NativeCloudSync(size: 48)),
        ),
      );
      expect(find.byType(NativeCloudSync), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(NativeCloudSync), findsOneWidget);
    });

    testWidgets('NativeHeartbeatPulse renders and animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NativeHeartbeatPulse(width: 64, height: 36)),
        ),
      );
      expect(find.byType(NativeHeartbeatPulse), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(NativeHeartbeatPulse), findsOneWidget);
    });

    testWidgets('NativePillDrip renders and animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NativePillDrip(size: 48)),
        ),
      );
      expect(find.byType(NativePillDrip), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(NativePillDrip), findsOneWidget);
    });
  });
}
