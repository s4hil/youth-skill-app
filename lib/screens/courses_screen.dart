// lib/screens/courses_screen.dart
import 'package:flutter/material.dart';
import 'package:youth_skill_app/services/api_service.dart';
import 'package:youth_skill_app/models/course_module.dart';
import 'course_detail_screen.dart'; // Ensure you have this import

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late Future<Map<String, List<CourseModule>>> _sectorsData;

  @override
  void initState() {
    super.initState();
    _sectorsData = ApiService().fetchCourses(); // Fetch the course data
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<CourseModule>>>(
      future: _sectorsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Courses'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Courses'),
            ),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          // Extract sector names for tabs
          List<String> sectorNames = snapshot.data!.keys.toList();
          return DefaultTabController(
            length: sectorNames.length, // Set the length to the number of sectors
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Courses'),
                bottom: TabBar(
                  tabs: sectorNames.map((sector) => Tab(text: sector)).toList(),
                ),
              ),
              body: TabBarView(
                children: sectorNames.map((sector) {
                  List<CourseModule> courses = snapshot.data![sector]!;
                  return ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(courses[index].courseName),
                        subtitle: Text(courses[index].topicName),
                        onTap: () {
                          // Navigate to course detail screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailScreen(course: courses[index]),
                            ),
                          );
                        },
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
