// lib/services/api_service.dart
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:youth_skill_app/models/course_module.dart'; // Adjust path if necessary

class ApiService {
  Future<Map<String, List<CourseModule>>> fetchCourses() async {
    final rawData = await rootBundle.loadString('assets/courses.csv');
    List<List<dynamic>> rows = const CsvToListConverter().convert(rawData);

    final sectors = <String, List<CourseModule>>{};

    for (var i = 1; i < rows.length; i++) {
      var row = rows[i];
      String sector = row[0].toString(); // Ensure sector is a string
      String courseName = row[1].toString(); // Ensure courseName is a string
      String topicName = row[3].toString(); // Ensure topicName is a string
      String url = row[4].toString(); // Ensure URL is a string
      String moduleName = row[5].toString(); // Ensure moduleName is a string
      int moduleNo = int.tryParse(row[6].toString()) ?? 0; // Safely parse to int

      final module = CourseModule(
        courseName: courseName,
        topicName: topicName,
        url: url,
        moduleName: moduleName,
        moduleNo: moduleNo,
      );

      if (!sectors.containsKey(sector)) {
        sectors[sector] = [];
      }
      sectors[sector]!.add(module);
    }

    return sectors;
  }
}
