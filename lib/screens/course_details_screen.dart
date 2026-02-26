import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'course_en_cours_screen.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Map course;

  const CourseDetailsScreen({super.key, required this.course});

  startCourse(BuildContext context) async {
    await ApiService.updateCourseStatus(course['id'], "en_cours");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => CourseEnCoursScreen(course: course),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Détails de la course")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Départ : ${course['depart']}"),
            Text("Arrivée : ${course['arrivee']}"),
            Text("Distance : ${course['distance_km']} km"),
            Text("Prix : ${course['prix']} FCFA"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => startCourse(context),
              child: const Text("Commencer la course"),
            )
          ],
        ),
      ),
    );
  }
}
