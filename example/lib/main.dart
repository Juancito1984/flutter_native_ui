// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_native_ui/flutter_native_ui.dart';

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
                title: 'Ver Iconos',
                subtitle: 'Explora la colección de iconos vectoriales SVG',
                leadingWidget: const SparklesIcon(size: 38),
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
                title: 'Ver Animaciones',
                subtitle: 'Explora las animaciones nativas a 60-120 FPS',
                leadingWidget: const NativePulsingHeart(size: 38),
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
                  color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.4),
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
      appBar: AppBar(title: const Text('Catálogo de Iconos Vectoriales')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Mis botones'),
            ListTile(
              leading: FirebaseIcon(size: 30,),
              title: Text('Firebase'),
            ),

            _buildSectionTitle('🔥 Firebase & Nube'),
            const SizedBox(height: 12),
            _buildIconGrid(const [
              _IconItem(name: 'Firebase', icon: FirebaseIcon(size: 36)),
              _IconItem(name: 'Firestore', icon: FirestoreIcon(size: 36)),
              _IconItem(name: 'Auth', icon: FirebaseAuthIcon(size: 36)),
              _IconItem(name: 'Storage', icon: CloudStorageIcon(size: 36)),
              _IconItem(name: 'Base Offline', icon: DatabaseDisabledIcon(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('Redes Sociales y Autenticación'),
            const SizedBox(height: 12),
            _buildIconGrid(const [
              _IconItem(name: 'Google', icon: GoogleIcon(size: 36)),
              _IconItem(name: 'Facebook', icon: FacebookIcon(size: 36)),
              _IconItem(name: 'Apple', icon: AppleIcon(size: 36)),
              _IconItem(name: 'GitHub', icon: GitHubIcon(size: 36)),
              _IconItem(name: 'Instagram', icon: InstagramIcon(size: 36)),
              _IconItem(name: 'Twitter / X', icon: TwitterXIcon(size: 36)),
              _IconItem(name: 'LinkedIn', icon: LinkedInIcon(size: 36)),
              _IconItem(name: 'TikTok', icon: TikTokIcon(size: 36)),
              _IconItem(name: 'WhatsApp', icon: WhatsAppIcon(size: 36)),
              _IconItem(name: 'YouTube', icon: YouTubeIcon(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('Pagos y Comercio'),
            const SizedBox(height: 12),
            _buildIconGrid(const [
              _IconItem(name: 'Visa', icon: VisaIcon(size: 40)),
              _IconItem(name: 'Mastercard', icon: MastercardIcon(size: 40)),
              _IconItem(name: 'PayPal', icon: PayPalIcon(size: 40)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('UI y Sistema'),
            const SizedBox(height: 12),
            _buildIconGrid(const [
              _IconItem(name: 'Sparkles (IA)', icon: SparklesIcon(size: 36)),
              _IconItem(name: 'Seguridad', icon: ShieldCheckIcon(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🏗️ Ingeniería y Construcción'),
            const SizedBox(height: 12),
            _buildIconGrid(const [
              _IconItem(name: 'Ingeniero', icon: HardhatWorkerIcon(size: 36)),
              _IconItem(name: 'Cuadrilla', icon: WorkCrewIcon(size: 36)),
              _IconItem(name: 'Excavadora', icon: ExcavatorIcon(size: 36)),
              _IconItem(name: 'Volqueta', icon: DumpTruckIcon(size: 36)),
              _IconItem(name: 'Tractor', icon: TractorIcon(size: 36)),
              _IconItem(name: 'Herramientas', icon: EngineeringToolsIcon(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('🎵 Música y Audio'),
            const SizedBox(height: 12),
            _buildIconGrid(const [
              _IconItem(name: 'Partitura', icon: MusicSheetIcon(size: 36)),
              _IconItem(name: 'Acordes', icon: MusicChordsIcon(size: 36)),
              _IconItem(name: 'Play', icon: PlayControlIcon(size: 36)),
              _IconItem(name: 'Pause', icon: PauseControlIcon(size: 36)),
              _IconItem(name: 'Stop', icon: StopControlIcon(size: 36)),
            ]),
            const SizedBox(height: 24),
            _buildSectionTitle('⚽ Fútbol y Deportes'),
            const SizedBox(height: 12),
            _buildIconGrid(const [
              _IconItem(name: 'Balón', icon: SoccerBallIcon(size: 36)),
              _IconItem(name: 'Jugador', icon: SoccerPlayerIcon(size: 36)),
              _IconItem(name: 'Equipo', icon: SoccerTeamIcon(size: 36)),
              _IconItem(name: 'T. Amarilla', icon: YellowCardIcon(size: 36)),
              _IconItem(name: 'T. Roja', icon: RedCardIcon(size: 36)),
              _IconItem(name: 'Doble Tarjeta', icon: RefereeCardIcon(size: 36)),
              _IconItem(name: 'Silbato', icon: RefereeWhistleIcon(size: 36)),
              _IconItem(name: 'Calendario', icon: MatchCalendarIcon(size: 36)),
            ]),
          ],
        ),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.icon,
              const SizedBox(height: 8),
              Text(
                item.name,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
  State<ExampleAnimacionesScreen> createState() => _ExampleAnimacionesScreenState();
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
      appBar: AppBar(title: const Text('Catálogo de Animaciones Nativas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🔥 Firebase & Sincronización en Nube',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _AnimContainer(
                      title: 'Sincronizando',
                      widget: NativeCloudSync(size: 48),
                    ),
                    _AnimContainer(
                      title: 'Guardando Datos',
                      widget: NativeDataUpload(size: 48),
                    ),
                    _AnimContainer(
                      title: 'Descargando Datos',
                      widget: NativeDataDownload(size: 48),
                    ),
                    _AnimContainer(
                      title: 'Base Desactivada',
                      widget: NativeDatabaseOffline(size: 48),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '🏗️ 🎵 ⚽ Animaciones Temáticas por Categoría',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _AnimContainer(
                      title: 'Excavando',
                      widget: NativeExcavatorDigging(size: 48),
                    ),
                    _AnimContainer(
                      title: 'Ecualizador',
                      widget: NativeAudioEqualizer(width: 48, height: 36),
                    ),
                    _AnimContainer(
                      title: 'Rebote Balón',
                      widget: NativeSoccerBallBounce(size: 48),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _AnimContainer(
                      title: 'Spinner Arc',
                      widget: NativeLoadingSpinner(size: 40),
                    ),
                    _AnimContainer(
                      title: 'Corazón Latiente',
                      widget: NativePulsingHeart(size: 44),
                    ),
                    _AnimContainer(
                      title: 'Radar Ripple',
                      widget: NativePulseRipple(size: 48),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: _replayCheckmark,
                      child: _AnimContainer(
                        title: 'Éxito (Toca aquí)',
                        widget: NativeSuccessCheckmark(
                          key: _checkmarkKey,
                          size: 48,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _replayCross,
                      child: _AnimContainer(
                        title: 'Error (Toca aquí)',
                        widget: NativeErrorCross(
                          key: _crossKey,
                          size: 48,
                        ),
                      ),
                    ),
                    const _AnimContainer(
                      title: 'Ondas Audio',
                      widget: NativeWaveBars(height: 32),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _AnimContainer(
                          title: 'Puntos Escribiendo',
                          widget: NativeBouncingDots(size: 10),
                        ),
                        _AnimContainer(
                          title: 'Badge con Halo',
                          widget: NativePulseBadge(
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
                    NativeShimmerButton(
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
                    const NativeSkeletonShimmer(
                      width: 54,
                      height: 54,
                      borderRadius: 27,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          NativeSkeletonShimmer(
                            width: double.infinity,
                            height: 14,
                          ),
                          SizedBox(height: 10),
                          NativeSkeletonShimmer(
                            width: 160,
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

  const _AnimContainer({
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          child: Center(child: widget),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
