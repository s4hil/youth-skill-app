// lib/screens/feedback_screen.dart
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Center(
        child: Text('Feedback Screen - Feedback form will be displayed here.'),
      ),
    );
  }
}
