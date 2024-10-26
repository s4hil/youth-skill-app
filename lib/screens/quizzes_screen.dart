// lib/screens/quizzes_screen.dart
import 'package:flutter/material.dart';

class QuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzes'),
      ),
      body: Center(
        child: Text('Quizzes Screen - List of Quizzes will be displayed here.'),
      ),
    );
  }
}
