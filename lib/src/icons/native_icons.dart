import 'package:flutter/material.dart';

import 'ai/ai.dart';
import 'automotive/automotive.dart';
import 'cloud/cloud.dart';
import 'ecommerce/ecommerce.dart';
import 'education/education.dart';
import 'engineering/engineering.dart';
import 'finance/finance.dart';
import 'fitness/fitness.dart';
import 'food/food.dart';
import 'football/football.dart';
import 'logistics/logistics.dart';
import 'music/music.dart';
import 'payments/payments.dart';
import 'pharmacy/pharmacy.dart';
import 'security/security.dart';
import 'smarthome/smarthome.dart';
import 'social/social.dart';
import 'system/system.dart';
import 'travel/travel.dart';

/// Catálogo centralizado de acceso a los 83 iconos vectoriales nativos.
///
/// Permite autocompletado nativo en el IDE mediante `NativeIcons.nombre(...)`,
/// personalización de tamaño, color principal (`color`) y secundario (`secondaryColor`),
/// y adaptación bi-tonal viva predeterminada en Modo Claro / plana en Modo Oscuro.
abstract class NativeIcons {
  // 🤖 Inteligencia Artificial & GenAI
  static Widget brainAi({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      BrainAiIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget botMessage({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      BotMessageIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget wandMagic({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      WandMagicIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget cpuChip({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      CpuChipIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🔒 Biometría & Seguridad
  static Widget fingerprintScan({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      FingerprintScanIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget faceId({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      FaceIdIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget keyholeLock({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      KeyholeLockIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget shieldCheck({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      ShieldCheckIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🏠 Domótica & Smart Home
  static Widget smartLock({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SmartLockIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget lightBulbSmart({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      LightBulbSmartIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget thermometerSmart({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      ThermometerSmartIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget solarPanel({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SolarPanelIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🏋️ Salud, Fitness & Deportes
  static Widget dumbbell({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      DumbbellIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget flameKcal({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      FlameKcalIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget waterDrop({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      WaterDropIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget trophyAward({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      TrophyAwardIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 📦 Logística & Envíos
  static Widget packageBox({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      PackageBoxIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget qrScanner({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      QrScannerIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget locationRadar({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      LocationRadarIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🔥 Firebase & Nube
  static Widget firebase({double size = 24.0, Key? key}) =>
      FirebaseIcon(key: key, size: size);

  static Widget firestore({double size = 24.0, Key? key}) =>
      FirestoreIcon(key: key, size: size);

  static Widget firebaseAuth({double size = 24.0, Key? key}) =>
      FirebaseAuthIcon(key: key, size: size);

  static Widget cloudStorage({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      CloudStorageIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget databaseDisabled({
    double size = 24.0,
    Color? color,
    Color? disabledColor,
    Key? key,
  }) =>
      DatabaseDisabledIcon(
        key: key,
        size: size,
        color: color,
        disabledColor: disabledColor,
      );

  // 📱 Redes Sociales & Autenticación
  static Widget google({double size = 24.0, Key? key}) =>
      GoogleIcon(key: key, size: size);

  static Widget facebook({double size = 24.0, Key? key}) =>
      FacebookIcon(key: key, size: size);

  static Widget apple({double size = 24.0, Color? color, Key? key}) =>
      AppleIcon(key: key, size: size, color: color);

  static Widget github({double size = 24.0, Color? color, Key? key}) =>
      GitHubIcon(key: key, size: size, color: color);

  static Widget instagram({double size = 24.0, Key? key}) =>
      InstagramIcon(key: key, size: size);

  static Widget twitterX({double size = 24.0, Color? color, Key? key}) =>
      TwitterXIcon(key: key, size: size, color: color);

  static Widget linkedin({double size = 24.0, Key? key}) =>
      LinkedInIcon(key: key, size: size);

  static Widget tiktok({double size = 24.0, Key? key}) =>
      TikTokIcon(key: key, size: size);

  static Widget whatsapp({double size = 24.0, Key? key}) =>
      WhatsAppIcon(key: key, size: size);

  static Widget youtube({double size = 24.0, Key? key}) =>
      YouTubeIcon(key: key, size: size);

  // 💳 Pasarelas de Pago
  static Widget visa({double size = 24.0, Key? key}) =>
      VisaIcon(key: key, size: size);

  static Widget mastercard({double size = 24.0, Key? key}) =>
      MastercardIcon(key: key, size: size);

  static Widget paypal({double size = 24.0, Key? key}) =>
      PayPalIcon(key: key, size: size);

  // ✦ Sistema & UI
  static Widget sparkles({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SparklesIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🏗️ Ingeniería & Construcción
  static Widget hardhatWorker({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      HardhatWorkerIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget workCrew({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      WorkCrewIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget excavator({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      ExcavatorIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget dumpTruck({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      DumpTruckIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget tractor({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      TractorIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget engineeringTools({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      EngineeringToolsIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🎵 Música & Controles
  static Widget musicSheet({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      MusicSheetIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget musicChords({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      MusicChordsIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget playControl({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      PlayControlIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget pauseControl({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      PauseControlIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget stopControl({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      StopControlIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // ⚽ Deportes & Fútbol
  static Widget soccerBall({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SoccerBallIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget soccerPlayer({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SoccerPlayerIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget soccerTeam({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SoccerTeamIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget yellowCard({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      YellowCardIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget redCard({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      RedCardIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget refereeCard({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      RefereeCardIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget refereeWhistle({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      RefereeWhistleIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget matchCalendar({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      MatchCalendarIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 💊 Farmacia & Salud
  static Widget pill({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      PillIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget syringe({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SyringeIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget stethoscope({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      StethoscopeIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget firstAidKit({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      FirstAidKitIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget hospitalBuilding({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      HospitalBuildingIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget medicineBottle({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      MedicineBottleIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🛒 Comercio Electrónico
  static Widget shoppingBag({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      ShoppingBagIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget shoppingCart({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      ShoppingCartIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget tagDiscount({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      TagDiscountIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget deliveryTruck({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      DeliveryTruckIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget barcodeQr({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      BarcodeQrIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🍔 Gastronomía & Delivery
  static Widget restaurantPlate({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      RestaurantPlateIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget burgerPizza({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      BurgerPizzaIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget coffeeCup({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      CoffeeCupIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget deliveryMotorcycle({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      DeliveryMotorcycleIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget chefHat({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      ChefHatIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 💼 Finanzas & Cripto
  static Widget wallet({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      WalletIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget piggyBank({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      PiggyBankIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget bitcoinCrypto({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      BitcoinCryptoIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget trendingChart({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      TrendingChartIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget bankBuilding({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      BankBuildingIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // ✈️ Viajes & Turismo
  static Widget airplane({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      AirplaneIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget suitcase({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SuitcaseIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget mapPin({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      MapPinIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget compass({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      CompassIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget hotelBed({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      HotelBedIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🎓 Educación & Cursos
  static Widget graduationCap({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      GraduationCapIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget bookOpen({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      BookOpenIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget certificateAward({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      CertificateAwardIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget ideaBulb({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      IdeaBulbIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  // 🚗 Automotriz & Movilidad
  static Widget car({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      CarIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget fuelGas({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      FuelGasIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget speedometer({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      SpeedometerIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);

  static Widget carKey({double size = 24.0, Color? color, Color? secondaryColor, Key? key}) =>
      CarKeyIcon(key: key, size: size, color: color, secondaryColor: secondaryColor);
}
