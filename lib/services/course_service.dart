// // services/course_service.dart
// import 'dart:convert';
// // import 'package:http/http.dart' as http;

// class CourseService {
//   final String baseUrl = 'http://127.0.0.1:8000/api/sectors/';

//   Future<Map<String, dynamic>> fetchCoursesBySector(String sector) async {
//     final response = await http.get(Uri.parse('$baseUrl/$sector/'));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     }
//     throw Exception('Failed to load courses');
//   }
// }
