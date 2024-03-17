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
  final _answerController = TextEditingController();
  List<String> _userAnswers = [];

  List<Map<String, String>> get flashcards {
    return premadeFlashcards[widget.selectedCategory] ?? [];
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  void _nextFlashcard() {
    if (_currentIndex < flashcards.length - 1) {
      setState(() {
        _recordAnswer();
        _currentIndex++;
      });
    } else {
      _recordAnswer();
      _showQuizResults();
    }
  }

  void _recordAnswer() {
    if (_answerController.text.trim().isNotEmpty) {
      if (_userAnswers.length > _currentIndex) {
        _userAnswers[_currentIndex] = _answerController.text.trim();
      } else {
        _userAnswers.add(_answerController.text.trim());
      }
      _answerController.clear();
    }
  }

  String calculateQuiz() {
    int numCorrect = 0;
    for (int i = 0; i < flashcards.length; i++) {
      if (_userAnswers.length > i &&
          _userAnswers[i] == flashcards[i]['answer']) {
        numCorrect++;
      }
    }
    return "($numCorrect/${flashcards.length})";
  }

  void _showQuizResults() {
    final quizResults = calculateQuiz();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Finished'),
        content: Text('Your score: $quizResults'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Go back to previous screen
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Mode - ${widget.selectedCategory}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: flashcards.isEmpty
            ? Center(child: Text('No flashcards available for this category.'))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Question ${_currentIndex + 1} of ${flashcards.length}',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text(flashcards[_currentIndex]['question']!,
                      style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  TextField(
                    controller: _answerController,
                    decoration: InputDecoration(hintText: 'Your Answer'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: _nextFlashcard, child: Text('Next')),
                ],
              ),
      ),
    );
  }
}
