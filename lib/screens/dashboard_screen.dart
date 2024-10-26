// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'courses_screen.dart'; // Import your screens here
import 'recommendations_screen.dart';
import 'quizzes_screen.dart';
import 'announcements_screen.dart';
import 'feedback_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youth Skill App'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to profile screen or show profile options
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Profile'),
                  content: Text('User Profile and Logout option'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Perform logout logic
                        Navigator.pop(context); // Close dialog
                        Navigator.pop(context); // Navigate back to login
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        children: [
          // Courses
          DashboardOption(
            icon: Icons.book,
            label: 'Courses',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesScreen()),
              );
            },
          ),
          // Recommendations
          DashboardOption(
            icon: Icons.recommend,
            label: 'Recommendations',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecommendationsScreen()),
              );
            },
          ),
          // Quizzes
          DashboardOption(
            icon: Icons.quiz,
            label: 'Quizzes',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizzesScreen()),
              );
            },
          ),
          // Announcements
          DashboardOption(
            icon: Icons.announcement,
            label: 'Announcements',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnnouncementsScreen()),
              );
            },
          ),
          // Feedback
          DashboardOption(
            icon: Icons.feedback,
            label: 'Feedback',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackScreen()),
              );
            },
          ),
          // Settings
          DashboardOption(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DashboardOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DashboardOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
