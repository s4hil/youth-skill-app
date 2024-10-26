// lib/screens/announcements_screen.dart
import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
      ),
      body: Center(
        child: Text('Announcements Screen - Announcements will be displayed here.'),
      ),
    );
  }
}
