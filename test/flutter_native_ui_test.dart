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

  group('Iconos Vectoriales Nativos - Categorías Temáticas Ampliadas', () {
    testWidgets('Iconos de E-Commerce renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                ShoppingBagIcon(size: 36),
                ShoppingCartIcon(size: 36),
                TagDiscountIcon(size: 36),
                DeliveryTruckIcon(size: 36),
                BarcodeQrIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(ShoppingBagIcon), findsOneWidget);
      expect(find.byType(ShoppingCartIcon), findsOneWidget);
      expect(find.byType(TagDiscountIcon), findsOneWidget);
      expect(find.byType(DeliveryTruckIcon), findsOneWidget);
      expect(find.byType(BarcodeQrIcon), findsOneWidget);
    });

    testWidgets('Iconos de Gastronomía renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                RestaurantPlateIcon(size: 36),
                BurgerPizzaIcon(size: 36),
                CoffeeCupIcon(size: 36),
                DeliveryMotorcycleIcon(size: 36),
                ChefHatIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(RestaurantPlateIcon), findsOneWidget);
      expect(find.byType(BurgerPizzaIcon), findsOneWidget);
      expect(find.byType(CoffeeCupIcon), findsOneWidget);
      expect(find.byType(DeliveryMotorcycleIcon), findsOneWidget);
      expect(find.byType(ChefHatIcon), findsOneWidget);
    });

    testWidgets('Iconos de Finanzas renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                WalletIcon(size: 36),
                PiggyBankIcon(size: 36),
                BitcoinCryptoIcon(size: 36),
                TrendingChartIcon(size: 36),
                BankBuildingIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(WalletIcon), findsOneWidget);
      expect(find.byType(PiggyBankIcon), findsOneWidget);
      expect(find.byType(BitcoinCryptoIcon), findsOneWidget);
      expect(find.byType(TrendingChartIcon), findsOneWidget);
      expect(find.byType(BankBuildingIcon), findsOneWidget);
    });

    testWidgets('Iconos de Viajes renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AirplaneIcon(size: 36),
                SuitcaseIcon(size: 36),
                MapPinIcon(size: 36),
                CompassIcon(size: 36),
                HotelBedIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(AirplaneIcon), findsOneWidget);
      expect(find.byType(SuitcaseIcon), findsOneWidget);
      expect(find.byType(MapPinIcon), findsOneWidget);
      expect(find.byType(CompassIcon), findsOneWidget);
      expect(find.byType(HotelBedIcon), findsOneWidget);
    });

    testWidgets('Iconos de Educación renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                GraduationCapIcon(size: 36),
                BookOpenIcon(size: 36),
                CertificateAwardIcon(size: 36),
                IdeaBulbIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(GraduationCapIcon), findsOneWidget);
      expect(find.byType(BookOpenIcon), findsOneWidget);
      expect(find.byType(CertificateAwardIcon), findsOneWidget);
      expect(find.byType(IdeaBulbIcon), findsOneWidget);
    });

    testWidgets('Iconos de Automotriz renderizan correctamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CarIcon(size: 36),
                FuelGasIcon(size: 36),
                SpeedometerIcon(size: 36),
                CarKeyIcon(size: 36),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(CarIcon), findsOneWidget);
      expect(find.byType(FuelGasIcon), findsOneWidget);
      expect(find.byType(SpeedometerIcon), findsOneWidget);
      expect(find.byType(CarKeyIcon), findsOneWidget);
    });
  });

  group('Animaciones Nativas - Categorías Temáticas', () {
    testWidgets('NativeCartBadgePulse animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeCartBadgePulse(size: 48))),
      );
      expect(find.byType(NativeCartBadgePulse), findsOneWidget);
    });

    testWidgets('NativeCoffeeSteam animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeCoffeeSteam(size: 48))),
      );
      expect(find.byType(NativeCoffeeSteam), findsOneWidget);
    });

    testWidgets('NativeCryptoChartUp animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeCryptoChartUp(width: 64, height: 36))),
      );
      expect(find.byType(NativeCryptoChartUp), findsOneWidget);
    });

    testWidgets('NativeFlightTakeoff animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeFlightTakeoff(size: 48))),
      );
      expect(find.byType(NativeFlightTakeoff), findsOneWidget);
    });

    testWidgets('NativeIdeaBulbGlow animates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NativeIdeaBulbGlow(size: 48))),
      );
      expect(find.byType(NativeIdeaBulbGlow), findsOneWidget);
    });
  });
}
