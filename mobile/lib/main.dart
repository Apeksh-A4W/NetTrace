import 'package:flutter/material.dart';
import 'screens/location_details_screen.dart';
import 'services/location_service.dart';
import 'package:geolocator/geolocator.dart';
void main() {
  runApp(const NetTraceApp());
}

// ============================================================
// APP
// ============================================================

class NetTraceApp extends StatelessWidget {
  const NetTraceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NetTrace',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF06131D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00D9FF),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color bg = Color(0xFF06131D);
const Color card = Color(0xFF0D202C);
const Color cyan = Color(0xFF00D9FF);
const Color blue = Color(0xFF1688FF);
const Color green = Color(0xFF31E875);
const Color yellow = Color(0xFFFFC928);
const Color red = Color(0xFFFF404A);

// ============================================================
// 1. SPLASH SCREEN
// ============================================================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF061722),
              Color(0xFF031018),
              Color(0xFF020A10),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Network tower icon
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cyan.withOpacity(0.08),
                    border: Border.all(
                      color: cyan.withOpacity(0.3),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: cyan.withOpacity(0.25),
                        blurRadius: 35,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.cell_tower,
                    size: 65,
                    color: cyan,
                  ),
                ),

                const SizedBox(height: 30),

                // Logo
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Net',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Trace',
                        style: TextStyle(
                          color: cyan,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Find. Track. Stay Connected.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 60),

                const Text(
                  'Real-time network map',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Outage alerts',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Works offline',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Powered by people nearby',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 2. ONBOARDING
// ============================================================

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              const Text(
                'Know Your\nNetwork Better',
                style: TextStyle(
                  fontSize: 31,
                  height: 1.1,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'See live network conditions,\noutage alerts and nearby\nconnected areas.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // Phone / map illustration
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF0B3347),
                        const Color(0xFF061722),
                      ],
                    ),
                    border: Border.all(
                      color: cyan.withOpacity(0.15),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      Positioned(
                        top: 40,
                        left: 20,
                        child: Icon(
                          Icons.location_on,
                          color: blue.withOpacity(0.5),
                          size: 38,
                        ),
                      ),

                      Positioned(
                        top: 120,
                        right: 30,
                        child: Icon(
                          Icons.location_on,
                          color: red.withOpacity(0.7),
                          size: 40,
                        ),
                      ),

                      Positioned(
                        bottom: 90,
                        left: 35,
                        child: Icon(
                          Icons.location_on,
                          color: green.withOpacity(0.7),
                          size: 35,
                        ),
                      ),

                      Container(
                        width: 190,
                        height: 350,
                        decoration: BoxDecoration(
                          color: const Color(0xFF08151F),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(
                            color: cyan.withOpacity(0.5),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: cyan.withOpacity(0.18),
                              blurRadius: 35,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [

                            const SizedBox(height: 25),

                            const Icon(
                              Icons.cell_tower,
                              color: cyan,
                              size: 45,
                            ),

                            const SizedBox(height: 18),

                            Container(
                              margin: const EdgeInsets.all(15),
                              height: 210,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: const Color(0xFF102C35),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.map,
                                  color: Colors.white24,
                                  size: 100,
                                ),
                              ),
                            ),

                            const Text(
                              'NETWORK',
                              style: TextStyle(
                                color: cyan,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Dot(active: true),
                  _Dot(active: false),
                  _Dot(active: false),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PermissionScreen(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeMapScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: cyan,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// DOT
// ============================================================

class _Dot extends StatelessWidget {
  final bool active;

  const _Dot({
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 22 : 7,
      height: 7,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white30,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// ============================================================
// 3. PERMISSION SCREEN
// ============================================================

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 35, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Allow Permissions',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'We need these permissions\nto collect network data and\nshow it on the map.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              const PermissionCard(
                icon: Icons.location_on,
                iconColor: green,
                title: 'Location',
                description: 'To show network map\nnear you',
              ),

              const SizedBox(height: 12),

              const PermissionCard(
                icon: Icons.wifi,
                iconColor: blue,
                title: 'Network Access',
                description: 'To measure speed,\nsignal and connectivity',
              ),

              const SizedBox(height: 12),

              const PermissionCard(
                icon: Icons.people_alt,
                iconColor: Colors.deepPurpleAccent,
                title: 'Nearby Devices',
                description: 'For offline sharing\n(Wi-Fi Direct)',
              ),

              const SizedBox(height: 12),

              const PermissionCard(
                icon: Icons.battery_saver,
                iconColor: Colors.orange,
                title: 'Background Activity',
                description: 'To collect data even\nwhen app is closed',
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeMapScreen(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Allow All',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeMapScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Maybe Later',
                    style: TextStyle(
                      color: cyan,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PERMISSION CARD
// ============================================================

class PermissionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const PermissionCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
      ),
      child: Row(
        children: [

          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 27,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 4. HOME / LIVE NETWORK MAP
// ============================================================

class HomeMapScreen extends StatefulWidget {
  const HomeMapScreen({super.key});

  @override
  State<HomeMapScreen> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> {
  Position? currentPosition;
  bool loadingLocation = false;
  int selectedTab = 0;
  @override
  void initState() {
    super.initState();
    loadCurrentLocation();
  }
  Future<void> loadCurrentLocation() async {
    setState(() {
      loadingLocation = true;
    });

    final position = await LocationService.getCurrentLocation();

    if (!mounted) return;

    setState(() {
      currentPosition = position;
      loadingLocation = false;
    });

    if (position != null) {
      debugPrint(
        'NetTrace Location: '
            '${position.latitude}, ${position.longitude}',
      );
    } else {
      debugPrint('NetTrace: Location unavailable');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Stack(
          children: [

            // MAP
            Positioned.fill(
              child: _FakeNetworkMap(),
            ),

            // TOP BAR
            Positioned(
              top: 12,
              left: 15,
              right: 15,
              child: Row(
                children: [

                  // LOGO
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Net',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Trace',
                          style: TextStyle(
                            color: cyan,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xCC081923),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // SEARCH
            Positioned(
              top: 67,
              left: 15,
              right: 15,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xE6091821),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
                child: const Row(
                  children: [

                    SizedBox(width: 15),

                    Icon(
                      Icons.search,
                      color: Colors.white70,
                    ),

                    SizedBox(width: 10),

                    Text(
                      'Search location, area or place...',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // MAP LAYER BUTTON
            Positioned(
              top: 125,
              right: 15,
              child: _MapButton(
                icon: Icons.layers_outlined,
                onTap: () {},
              ),
            ),

            // CENTER LOCATION BUTTON
            Positioned(
              top: 180,
              right: 15,
              child: _MapButton(
                icon: Icons.my_location,
                onTap: () {},
              ),
            ),

            // LOCATION LABEL
            Positioned(
              top: 155,
              left: 15,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xDD091923),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: red,
                      size: 17,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'BTM Layout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // USER LOCATION
            Positioned(
              top: 340,
              left: MediaQuery.of(context).size.width / 2 - 60,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationDetailsScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: blue.withOpacity(0.5),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.navigation,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'You are here',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // MAP LEGEND
            Positioned(
              bottom: 72,
              left: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xED081923),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    LegendItem(
                      color: green,
                      text: 'Good',
                      subText: '>10 Mbps',
                    ),

                    LegendItem(
                      color: yellow,
                      text: 'Weak',
                      subText: '1–10 Mbps',
                    ),

                    LegendItem(
                      color: red,
                      text: 'No Network',
                      subText: '0 Mbps',
                    ),

                    LegendItem(
                      color: Colors.white54,
                      text: 'Unknown',
                      subText: 'No data',
                    ),
                  ],
                ),
              ),
            ),

            // BOTTOM NAVIGATION
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 68,
                decoration: const BoxDecoration(
                  color: Color(0xF50A1923),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    BottomItem(
                      icon: Icons.map,
                      label: 'Map',
                      selected: selectedTab == 0,
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },
                    ),

                    BottomItem(
                      icon: Icons.network_check,
                      label: 'Status',
                      selected: selectedTab == 1,
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },
                    ),

                    BottomItem(
                      icon: Icons.report_problem_outlined,
                      label: 'Report',
                      selected: selectedTab == 2,
                      onTap: () {
                        setState(() {
                          selectedTab = 2;
                        });
                      },
                    ),

                    BottomItem(
                      icon: Icons.cloud_off,
                      label: 'Offline',
                      selected: selectedTab == 3,
                      onTap: () {
                        setState(() {
                          selectedTab = 3;
                        });
                      },
                    ),

                    BottomItem(
                      icon: Icons.more_horiz,
                      label: 'More',
                      selected: selectedTab == 4,
                      onTap: () {
                        setState(() {
                          selectedTab = 4;
                        });
                      },
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

// ============================================================
// FAKE MAP
// ============================================================

class _FakeNetworkMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0A1B25),
      child: Stack(
        children: [

          // Road/grid effect
          Positioned.fill(
            child: CustomPaint(
              painter: MapGridPainter(),
            ),
          ),

          // GREEN ZONE
          Positioned(
            top: 220,
            left: 40,
            child: _HeatSpot(
              color: green,
              size: 110,
            ),
          ),

          // RED ZONE
          Positioned(
            top: 250,
            left: 150,
            child: _HeatSpot(
              color: red,
              size: 150,
            ),
          ),

          // YELLOW ZONE
          Positioned(
            top: 330,
            right: 70,
            child: _HeatSpot(
              color: yellow,
              size: 110,
            ),
          ),

          // GREEN ZONE
          Positioned(
            top: 420,
            right: 20,
            child: _HeatSpot(
              color: green,
              size: 120,
            ),
          ),

          // ROAD LABELS
          const Positioned(
            top: 225,
            left: 65,
            child: Text(
              'Jayanagar',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),

          const Positioned(
            top: 300,
            right: 80,
            child: Text(
              'HSR Layout',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),

          const Positioned(
            bottom: 210,
            left: 160,
            child: Text(
              'Electronic City',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),

          // MARKERS
          const Positioned(
            top: 190,
            left: 85,
            child: MapMarker(color: red),
          ),

          const Positioned(
            top: 265,
            left: 50,
            child: MapMarker(color: yellow),
          ),

          const Positioned(
            top: 300,
            left: 210,
            child: MapMarker(color: green),
          ),

          const Positioned(
            top: 370,
            right: 90,
            child: MapMarker(color: green),
          ),

          const Positioned(
            bottom: 230,
            right: 45,
            child: MapMarker(color: green),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MAP GRID
// ============================================================

class MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.035)
      ..strokeWidth = 1;

    for (double x = 0; x < size.width; x += 45) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + 100, size.height),
        paint,
      );
    }

    for (double y = 0; y < size.height; y += 55) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y + 80),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ============================================================
// HEAT SPOT
// ============================================================

class _HeatSpot extends StatelessWidget {
  final Color color;
  final double size;

  const _HeatSpot({
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.65),
            color.withOpacity(0.25),
            color.withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MAP MARKER
// ============================================================

class MapMarker extends StatelessWidget {
  final Color color;

  const MapMarker({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: 12,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MAP BUTTON
// ============================================================

class _MapButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _MapButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xDD081923),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ============================================================
// LEGEND
// ============================================================

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final String subText;

  const LegendItem({
    super.key,
    required this.color,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),

            const SizedBox(width: 5),

            Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 3),

        Text(
          subText,
          style: const TextStyle(
            color: Color(0x73FFFFFF),
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// BOTTOM NAV ITEM
// ============================================================

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const BottomItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 62,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              size: 23,
              color: selected ? cyan : Colors.white54,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                color: selected ? cyan : Colors.white54,
                fontSize: 10,
                fontWeight:
                selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}