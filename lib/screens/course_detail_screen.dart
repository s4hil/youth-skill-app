import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youth_skill_app/models/course_module.dart';
// Ensure this import matches your project structure

class CourseDetailScreen extends StatelessWidget {
  final CourseModule course;

  const CourseDetailScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Topic: ${course.topicName}'),
            SizedBox(height: 10),
            Text('Module: ${course.moduleName}'),
            SizedBox(height: 10),
            Text('Duration: ${course.moduleNo}'), // Replace with actual duration if available
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Open the URL in a browser
                launch(course.url);
              },
              child: const Text('Watch Video'),
            ),
          ],
        ),
      ),
    );
  }
}
