import 'package:flutter/material.dart';

class SpeedTestScreen extends StatefulWidget {
  const SpeedTestScreen({super.key});

  @override
  State<SpeedTestScreen> createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends State<SpeedTestScreen> {
  bool testing = false;
  bool completed = false;

  void startTest() {
    setState(() {
      testing = true;
      completed = false;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      setState(() {
        testing = false;
        completed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07111F),

      appBar: AppBar(
        backgroundColor: const Color(0xFF07111F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Network Speed Test',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            // Speed circle
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF0D1B2A),
                border: Border.all(
                  color: const Color(0xFF00D9FF),
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00D9FF).withOpacity(0.25),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      testing
                          ? Icons.sync
                          : Icons.speed,
                      color: const Color(0xFF00D9FF),
                      size: 45,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      testing
                          ? 'Testing...'
                          : completed
                          ? '82'
                          : '--',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      'Mbps',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            // Results
            Row(
              children: [

                Expanded(
                  child: _resultCard(
                    icon: Icons.download,
                    title: 'Download',
                    value: completed ? '82 Mbps' : '--',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _resultCard(
                    icon: Icons.upload,
                    title: 'Upload',
                    value: completed ? '18 Mbps' : '--',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            _resultCard(
              icon: Icons.timer,
              title: 'Latency',
              value: completed ? '38 ms' : '--',
            ),

            const Spacer(),

            // Start button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: testing ? null : startTest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D9FF),
                  foregroundColor: Colors.black,
                  disabledBackgroundColor:
                  Colors.white24,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  testing
                      ? 'TESTING...'
                      : completed
                      ? 'RUN AGAIN'
                      : 'START SPEED TEST',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _resultCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          Icon(
            icon,
            color: const Color(0xFF00D9FF),
            size: 26,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
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