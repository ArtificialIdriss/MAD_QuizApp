import 'package:flutter/material.dart';
import 'package:flash_card_app/screens/premade_flashcards.dart';

class QuizModeScreen extends StatefulWidget {
  final String? selectedCategory;

  const QuizModeScreen({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  _QuizModeScreenState createState() => _QuizModeScreenState();
}

class _QuizModeScreenState extends State<QuizModeScreen> {
  int _currentIndex = 0;
  bool _showAnswer = false;

  List<Map<String, String>> get flashcards {
    return premadeFlashcards[widget.selectedCategory] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    // Check if there are any flashcards to display
    if (flashcards.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Quiz Mode'),
        ),
        body: Center(
          child: Text('No flashcards available for this category.'),
        ),
      );
    }

    final flashcard = flashcards[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Mode - ${widget.selectedCategory}'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showAnswer = !_showAnswer;
          });
        },
        child: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _showAnswer ? flashcard['answer']! : flashcard['question']!,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_currentIndex < flashcards.length - 1) {
              _currentIndex++;
            } else {
              _currentIndex = 0; // Reset to first flashcard
            }
            _showAnswer = false; // Reset to show question
          });
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
