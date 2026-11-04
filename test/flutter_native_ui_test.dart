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

  group('Iconos Vectoriales Nativos - Nuevas Categorías (Ingeniería, Música, Fútbol)', () {
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
      expect(find.byType(RefereeCardIcon), findsOneWidget);
      expect(find.byType(RefereeWhistleIcon), findsOneWidget);
      expect(find.byType(MatchCalendarIcon), findsOneWidget);
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

    testWidgets('NativeLoadingSpinner renders and animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NativeLoadingSpinner(size: 40)),
        ),
      );
      expect(find.byType(NativeLoadingSpinner), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(NativeLoadingSpinner), findsOneWidget);
    });

    testWidgets('NativeSuccessCheckmark renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: NativeSuccessCheckmark(size: 44)),
        ),
      );
      expect(find.byType(NativeSuccessCheckmark), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(NativeSuccessCheckmark), findsOneWidget);
    });
  });
}
