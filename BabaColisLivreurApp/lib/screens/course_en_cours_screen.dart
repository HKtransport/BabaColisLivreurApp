import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'course_done_screen.dart';

class CourseEnCoursScreen extends StatelessWidget {
  final Map course;

  const CourseEnCoursScreen({super.key, required this.course});

  finishCourse(BuildContext context) async {
    await ApiService.updateCourseStatus(course['id'], "livre");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => CourseDoneScreen(course: course),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Course en cours")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => finishCourse(context),
          child: const Text("Marquer comme livrée"),
        ),
      ),
    );
  }
}
