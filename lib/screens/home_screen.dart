import 'package:flutter/material.dart';
import 'create_flascards_screen.dart';
import 'browse_flashcards_screen.dart';
import 'quiz_mode_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateFlashcardScreen()),
                );
              },
              child: Text('Create Flashcards'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BrowseFlashcardsScreen()),
                );
              },
              child: Text('Browse Flashcards'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizModeScreen()),
                );
              },
              child: Text('Quiz Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
