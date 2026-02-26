import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'course_details_screen.dart';

class CourseRequestScreen extends StatelessWidget {
  final Map course;

  const CourseRequestScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Nouvelle course",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text("Départ : ${course['depart']}"),
              Text("Arrivée : ${course['arrivee']}"),
              Text("Prix : ${course['prix']} FCFA"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CourseDetailsScreen(course: course),
                        ),
                      );
                    },
                    child: const Text("Accepter"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Refuser"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
