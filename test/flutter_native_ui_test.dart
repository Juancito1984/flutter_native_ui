import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_native_ui/flutter_native_ui.dart';

void main() {
  group('Iconos Vectoriales Nativos', () {
    testWidgets('FirebaseIcon renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FirebaseIcon(size: 36),
          ),
        ),
      );
      expect(find.byType(FirebaseIcon), findsOneWidget);
    });

    testWidgets('GoogleIcon renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GoogleIcon(size: 36),
          ),
        ),
      );
      expect(find.byType(GoogleIcon), findsOneWidget);
    });

    testWidgets('ShieldCheckIcon renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShieldCheckIcon(size: 36),
          ),
        ),
      );
      expect(find.byType(ShieldCheckIcon), findsOneWidget);
    });

    testWidgets('VisaIcon renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VisaIcon(size: 36),
          ),
        ),
      );
      expect(find.byType(VisaIcon), findsOneWidget);
    });
  });

  group('Animaciones Nativas', () {
    testWidgets('NativeCloudSync renders and animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NativeCloudSync(size: 48),
          ),
        ),
      );
      expect(find.byType(NativeCloudSync), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(NativeCloudSync), findsOneWidget);
    });

    testWidgets('NativeLoadingSpinner renders and animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NativeLoadingSpinner(size: 40),
          ),
        ),
      );
      expect(find.byType(NativeLoadingSpinner), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(NativeLoadingSpinner), findsOneWidget);
    });

    testWidgets('NativeSuccessCheckmark renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NativeSuccessCheckmark(size: 44),
          ),
        ),
      );
      expect(find.byType(NativeSuccessCheckmark), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(NativeSuccessCheckmark), findsOneWidget);
    });
  });
}
