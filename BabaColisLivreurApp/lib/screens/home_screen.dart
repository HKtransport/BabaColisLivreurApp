import 'dart:async';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/gps_service.dart';
import 'course_request_screen.dart';
import 'historique_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? gpsTimer;
  Timer? courseTimer;

  @override
  void initState() {
    super.initState();

    gpsTimer = Timer.periodic(const Duration(seconds: 10), (_) async {
      final pos = await GpsService.getPosition();
      await ApiService.updatePosition(pos.latitude, pos.longitude);
    });

    courseTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      final data = await ApiService.getCourse();
      if (data != null && data["success"] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CourseRequestScreen(course: data["course"]),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    gpsTimer?.cancel();
    courseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Livreur – En ligne")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("En attente de courses..."),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HistoriqueScreen()),
              ),
              child: const Text("Historique"),
            ),
          ],
        ),
      ),
    );
  }
}
