import 'package:flutter/material.dart';

class CourseDoneScreen extends StatelessWidget {
  final Map course;

  const CourseDoneScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Course terminée")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            Text("Course livrée !"),
            Text("Gain : ${course['gain_livreur']} FCFA"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Retour"),
            )
          ],
        ),
      ),
    );
  }
}
