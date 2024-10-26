// lib/models/course.dart
class CourseModule {
  final String courseName;
  final String topicName;
  final String url;
  final String moduleName;
  final int moduleNo; // Ensure this is an int

  CourseModule({
    required this.courseName,
    required this.topicName,
    required this.url,
    required this.moduleName,
    required this.moduleNo,
  });

  factory CourseModule.fromJson(Map<String, dynamic> json) {
    return CourseModule(
      courseName: json['courseName'],
      topicName: json['topicName'],
      url: json['url'],
      moduleName: json['moduleName'],
      moduleNo: json['moduleNo'], // This should remain as int
    );
  }
}
