import 'package:flutter/material.dart';
//import 'create_flascards_screen.dart';
//import 'screens/browse_flashcards_screen.dart';
//import 'screens/quiz_mode_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(FlashcardQuizApp());
}

class FlashcardQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
