// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_native_ui_nyk/flutter_native_ui_nyk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_native_ui Demo (NyK)',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF216971),
              ),
            ),
      home: DemoHomeScreen(
        isDarkMode: _isDarkMode,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class DemoHomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const DemoHomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_native_ui (NyK)'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
            tooltip: 'Cambiar tema',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuCard(
                context: context,
                title: 'Catálogo de Iconos (NativeIcons)',
                subtitle: '83 iconos accedidos con NativeIcons.nombre(...)',
                leadingWidget: NativeIcons.sparkles(size: 38),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExampleIconsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildMenuCard(
                context: context,
                title: 'Catálogo de Animaciones (NativeAnimations)',
                subtitle:
                    '32 animaciones accedidas con NativeAnimations.nombre(...)',
                leadingWidget: NativeAnimations.pulsingHeart(size: 38),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExampleAnimacionesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Widget leadingWidget,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: leadingWidget,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleIconsScreen extends StatelessWidget {
  const ExampleIconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo NativeIcons (83 Iconos)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDxBanner(
              context,
              '💡 Tip de DX: Usa NativeIcons.nombre(...) para autocompletado en el IDE o instanciamiento directo.',
            ),


            const SizedBox(height: 16),
            _buildSectionTitle('🤖 Inteligencia Artificial & GenAI'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Cerebro IA', icon: NativeIcons.brainAi(size: 36)),
              _IconItem(
                  name: 'Bot Chat', icon: NativeIcons.botMessage(size: 36)),
              _IconItem(
                  name: 'Varita Prompt', icon: NativeIcons.wandMagic(size: 36)),
              _IconItem(name: 'Chip CPU', icon: NativeIcons.cpuChip(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🔒 Biometría y Seguridad'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Huella', icon: NativeIcons.fingerprintScan(size: 36)),
              _IconItem(name: 'Face ID', icon: NativeIcons.faceId(size: 36)),
              _IconItem(
                  name: 'Cerradura', icon: NativeIcons.keyholeLock(size: 36)),
              _IconItem(
                  name: 'Escudo', icon: NativeIcons.shieldCheck(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🏠 Domótica y Smart Home'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Smart Lock', icon: NativeIcons.smartLock(size: 36)),
              _IconItem(
                  name: 'Foco Smart',
                  icon: NativeIcons.lightBulbSmart(size: 36)),
              _IconItem(
                  name: 'Termostato',
                  icon: NativeIcons.thermometerSmart(size: 36)),
              _IconItem(
                  name: 'Panel Solar', icon: NativeIcons.solarPanel(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🏋️ Salud, Fitness y Deportes'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Mancuerna', icon: NativeIcons.dumbbell(size: 36)),
              _IconItem(
                  name: 'Calorías', icon: NativeIcons.flameKcal(size: 36)),
              _IconItem(
                  name: 'Gota Agua', icon: NativeIcons.waterDrop(size: 36)),
              _IconItem(
                  name: 'Trofeo', icon: NativeIcons.trophyAward(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('📦 Logística, Envíos y GPS'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Paquete', icon: NativeIcons.packageBox(size: 36)),
              _IconItem(
                  name: 'Escáner QR', icon: NativeIcons.qrScanner(size: 36)),
              _IconItem(
                  name: 'Radar GPS', icon: NativeIcons.locationRadar(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🔥 Firebase & Nube'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Firebase', icon: NativeIcons.firebase(size: 36)),
              _IconItem(
                  name: 'Firestore', icon: NativeIcons.firestore(size: 36)),
              _IconItem(name: 'Auth', icon: NativeIcons.firebaseAuth(size: 36)),
              _IconItem(
                  name: 'Storage', icon: NativeIcons.cloudStorage(size: 36)),
              _IconItem(
                  name: 'Base Offline',
                  icon: NativeIcons.databaseDisabled(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('📱 Redes Sociales y Autenticación'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Google', icon: NativeIcons.google(size: 36)),
              _IconItem(name: 'Facebook', icon: NativeIcons.facebook(size: 36)),
              _IconItem(name: 'Apple', icon: NativeIcons.apple(size: 36)),
              _IconItem(name: 'GitHub', icon: NativeIcons.github(size: 36)),
              _IconItem(
                  name: 'Instagram', icon: NativeIcons.instagram(size: 36)),
              _IconItem(
                  name: 'Twitter / X', icon: NativeIcons.twitterX(size: 36)),
              _IconItem(name: 'LinkedIn', icon: NativeIcons.linkedin(size: 36)),
              _IconItem(name: 'TikTok', icon: NativeIcons.tiktok(size: 36)),
              _IconItem(name: 'WhatsApp', icon: NativeIcons.whatsapp(size: 36)),
              _IconItem(name: 'YouTube', icon: NativeIcons.youtube(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('💳 Pasarelas de Pago'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Visa', icon: NativeIcons.visa(size: 40)),
              _IconItem(
                  name: 'Mastercard', icon: NativeIcons.mastercard(size: 40)),
              _IconItem(name: 'PayPal', icon: NativeIcons.paypal(size: 40)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🏗️ Ingeniería y Construcción'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Ingeniero', icon: NativeIcons.hardhatWorker(size: 36)),
              _IconItem(
                  name: 'Cuadrilla', icon: NativeIcons.workCrew(size: 36)),
              _IconItem(
                  name: 'Excavadora', icon: NativeIcons.excavator(size: 36)),
              _IconItem(
                  name: 'Volqueta', icon: NativeIcons.dumpTruck(size: 36)),
              _IconItem(name: 'Tractor', icon: NativeIcons.tractor(size: 36)),
              _IconItem(
                  name: 'Herramientas',
                  icon: NativeIcons.engineeringTools(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🎵 Música y Audio'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Partitura', icon: NativeIcons.musicSheet(size: 36)),
              _IconItem(
                  name: 'Acordes', icon: NativeIcons.musicChords(size: 36)),
              _IconItem(name: 'Play', icon: NativeIcons.playControl(size: 36)),
              _IconItem(
                  name: 'Pause', icon: NativeIcons.pauseControl(size: 36)),
              _IconItem(name: 'Stop', icon: NativeIcons.stopControl(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('⚽ Fútbol y Deportes'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Balón', icon: NativeIcons.soccerBall(size: 36)),
              _IconItem(
                  name: 'Jugador', icon: NativeIcons.soccerPlayer(size: 36)),
              _IconItem(name: 'Equipo', icon: NativeIcons.soccerTeam(size: 36)),
              _IconItem(
                  name: 'T. Amarilla', icon: NativeIcons.yellowCard(size: 36)),
              _IconItem(name: 'T. Roja', icon: NativeIcons.redCard(size: 36)),
              _IconItem(
                  name: 'Doble Tarjeta',
                  icon: NativeIcons.refereeCard(size: 36)),
              _IconItem(
                  name: 'Silbato', icon: NativeIcons.refereeWhistle(size: 36)),
              _IconItem(
                  name: 'Calendario',
                  icon: NativeIcons.matchCalendar(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('💊 Farmacia y Salud'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Pastilla', icon: NativeIcons.pill(size: 36)),
              _IconItem(name: 'Jeringa', icon: NativeIcons.syringe(size: 36)),
              _IconItem(
                  name: 'Estetoscopio',
                  icon: NativeIcons.stethoscope(size: 36)),
              _IconItem(
                  name: 'Botiquín', icon: NativeIcons.firstAidKit(size: 36)),
              _IconItem(
                  name: 'Hospital',
                  icon: NativeIcons.hospitalBuilding(size: 36)),
              _IconItem(
                  name: 'Medicina', icon: NativeIcons.medicineBottle(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🛒 Comercio Electrónico'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Bolsa', icon: NativeIcons.shoppingBag(size: 36)),
              _IconItem(
                  name: 'Carrito', icon: NativeIcons.shoppingCart(size: 36)),
              _IconItem(
                  name: 'Descuento', icon: NativeIcons.tagDiscount(size: 36)),
              _IconItem(
                  name: 'Camión Envío',
                  icon: NativeIcons.deliveryTruck(size: 36)),
              _IconItem(
                  name: 'Código QR', icon: NativeIcons.barcodeQr(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🍔 Gastronomía y Delivery'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Restaurante',
                  icon: NativeIcons.restaurantPlate(size: 36)),
              _IconItem(
                  name: 'Comida', icon: NativeIcons.burgerPizza(size: 36)),
              _IconItem(name: 'Café', icon: NativeIcons.coffeeCup(size: 36)),
              _IconItem(
                  name: 'Moto Reparto',
                  icon: NativeIcons.deliveryMotorcycle(size: 36)),
              _IconItem(name: 'Chef', icon: NativeIcons.chefHat(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('💼 Finanzas y Cripto'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Billetera', icon: NativeIcons.wallet(size: 36)),
              _IconItem(
                  name: 'Alcancía', icon: NativeIcons.piggyBank(size: 36)),
              _IconItem(
                  name: 'Bitcoin', icon: NativeIcons.bitcoinCrypto(size: 36)),
              _IconItem(
                  name: 'Tendencia', icon: NativeIcons.trendingChart(size: 36)),
              _IconItem(
                  name: 'Banco', icon: NativeIcons.bankBuilding(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('✈️ Viajes y Turismo'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Avión', icon: NativeIcons.airplane(size: 36)),
              _IconItem(name: 'Maleta', icon: NativeIcons.suitcase(size: 36)),
              _IconItem(name: 'Ubicación', icon: NativeIcons.mapPin(size: 36)),
              _IconItem(name: 'Brújula', icon: NativeIcons.compass(size: 36)),
              _IconItem(name: 'Hotel', icon: NativeIcons.hotelBed(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🎓 Educación y Cursos'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(
                  name: 'Birrete', icon: NativeIcons.graduationCap(size: 36)),
              _IconItem(name: 'Libro', icon: NativeIcons.bookOpen(size: 36)),
              _IconItem(
                  name: 'Certificado',
                  icon: NativeIcons.certificateAward(size: 36)),
              _IconItem(
                  name: 'Idea Foco', icon: NativeIcons.ideaBulb(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🚗 Automotriz y Movilidad'),
            const SizedBox(height: 12),
            _buildIconGrid([
              _IconItem(name: 'Automóvil', icon: NativeIcons.car(size: 36)),
              _IconItem(name: 'Gasolina', icon: NativeIcons.fuelGas(size: 36)),
              _IconItem(
                  name: 'Velocímetro', icon: NativeIcons.speedometer(size: 36)),
              _IconItem(
                  name: 'Llave Coche', icon: NativeIcons.carKey(size: 36)),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildDxBanner(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .primaryContainer
            .withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.tips_and_updates, color: Color(0xFF216971)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildIconGrid(List<_IconItem> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.icon,
              const SizedBox(height: 8),
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExampleAnimacionesScreen extends StatefulWidget {
  const ExampleAnimacionesScreen({super.key});

  @override
  State<ExampleAnimacionesScreen> createState() =>
      _ExampleAnimacionesScreenState();
}

class _ExampleAnimacionesScreenState extends State<ExampleAnimacionesScreen> {
  Key _checkmarkKey = UniqueKey();
  Key _crossKey = UniqueKey();

  void _replayCheckmark() {
    setState(() {
      _checkmarkKey = UniqueKey();
    });
  }

  void _replayCross() {
    setState(() {
      _crossKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Catálogo NativeAnimations (32 Animaciones)')),
      body: ListView(
        addAutomaticKeepAlives: false,
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.tips_and_updates, color: Color(0xFF216971)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '💡 Tip de DX: Usa NativeAnimations.nombre(...) para autocompletado en el IDE.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '🤖 IA, Seguridad, Pagos y Logística Nativas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 16,
                runSpacing: 16,
                children: [
                  _AnimContainer(
                    title: 'IA Pensando',
                    widget: NativeAnimations.aiThinkingOrbit(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Láser Huella',
                    widget: NativeAnimations.fingerprintScan(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Tarjeta NFC',
                    widget:
                        NativeAnimations.creditCardNfc(width: 56, height: 38),
                  ),
                  _AnimContainer(
                    title: 'Gota Ola Agua',
                    widget: NativeAnimations.waterWaveFill(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Camión Envío',
                    widget: NativeAnimations.truckMoving(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Radar Pin GPS',
                    widget: NativeAnimations.radarPin(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Anillo Progreso',
                    widget: NativeAnimations.ringProgress(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Escribiendo...',
                    widget: NativeAnimations.typingIndicator(size: 32),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '🔥 Firebase & Sincronización en Nube',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 16,
                runSpacing: 16,
                children: [
                  _AnimContainer(
                    title: 'Sincronizando',
                    widget: NativeAnimations.cloudSync(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Guardando Datos',
                    widget: NativeAnimations.dataUpload(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Descargando Datos',
                    widget: NativeAnimations.dataDownload(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Base Desactivada',
                    widget: NativeAnimations.databaseOffline(size: 48),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '🏗️ 🎵 ⚽ 💊 🛒 🍔 💼 ✈️ 🎓 Animaciones Temáticas Industriales',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 16,
                runSpacing: 16,
                children: [
                  _AnimContainer(
                    title: 'Excavando',
                    widget: NativeAnimations.excavatorDigging(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Ecualizador',
                    widget:
                        NativeAnimations.audioEqualizer(width: 48, height: 36),
                  ),
                  _AnimContainer(
                    title: 'Rebote Balón',
                    widget: NativeAnimations.soccerBallBounce(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Pulso ECG',
                    widget:
                        NativeAnimations.heartbeatPulse(width: 54, height: 36),
                  ),
                  _AnimContainer(
                    title: 'Píldora Halo',
                    widget: NativeAnimations.pillDrip(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Badge Carrito',
                    widget: NativeAnimations.cartBadgePulse(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Vapor Café',
                    widget: NativeAnimations.coffeeSteam(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Grafica Cripto',
                    widget:
                        NativeAnimations.cryptoChartUp(width: 54, height: 36),
                  ),
                  _AnimContainer(
                    title: 'Despegue Avión',
                    widget: NativeAnimations.flightTakeoff(size: 48),
                  ),
                  _AnimContainer(
                    title: 'Foco Idea',
                    widget: NativeAnimations.ideaBulbGlow(size: 48),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Cargadores y Esferas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 16,
                runSpacing: 16,
                children: [
                  _AnimContainer(
                    title: 'Spinner Arc',
                    widget: NativeAnimations.loadingSpinner(size: 40),
                  ),
                  _AnimContainer(
                    title: 'Corazón Latiente',
                    widget: NativeAnimations.pulsingHeart(size: 44),
                  ),
                  _AnimContainer(
                    title: 'Radar Ripple',
                    widget: NativeAnimations.pulseRipple(size: 48),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Retroalimentación y Estado (Feedback)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 16,
                runSpacing: 16,
                children: [
                  GestureDetector(
                    onTap: _replayCheckmark,
                    child: _AnimContainer(
                      title: 'Éxito (Toca aquí)',
                      widget: NativeAnimations.successCheckmark(
                        key: _checkmarkKey,
                        size: 48,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _replayCross,
                    child: _AnimContainer(
                      title: 'Error (Toca aquí)',
                      widget:
                          NativeAnimations.errorCross(key: _crossKey, size: 48),
                    ),
                  ),
                  _AnimContainer(
                    title: 'Ondas Audio',
                    widget: NativeAnimations.waveBars(height: 32),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Indicadores de UI y Botones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _AnimContainer(
                        title: 'Puntos Escribiendo',
                        widget: NativeAnimations.bouncingDots(size: 10),
                      ),
                      _AnimContainer(
                        title: 'Badge con Halo',
                        widget: NativeAnimations.pulseBadge(
                          count: '9+',
                          child: Icon(Icons.notifications_active, size: 32),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Botón con Destello Metallic Shimmer',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  NativeAnimations.shimmerButton(
                    text: 'Procesar Transacción',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Carga de Contenido Esqueleto (Skeleton)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  NativeAnimations.skeletonShimmer(
                    width: 54,
                    height: 54,
                    borderRadius: 27,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NativeAnimations.skeletonShimmer(
                          width: double.infinity,
                          height: 14,
                        ),
                        SizedBox(height: 10),
                        NativeAnimations.skeletonShimmer(
                            width: 160, height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconItem {
  final String name;
  final Widget icon;

  const _IconItem({required this.name, required this.icon});
}

class _AnimContainer extends StatelessWidget {
  final String title;
  final Widget widget;

  const _AnimContainer({required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: [
          SizedBox(height: 56, child: Center(child: widget)),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
