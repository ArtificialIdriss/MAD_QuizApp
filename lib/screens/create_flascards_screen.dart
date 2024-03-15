import 'package:flash_card_app/screens/browse_flashcards_screen.dart';
import 'package:flash_card_app/screens/home_screen.dart';
import 'package:flash_card_app/screens/premade_flashcards.dart';

import 'package:flutter/material.dart';

class CreateFlashcardScreen extends StatefulWidget {
  final String? categoryName;

  const CreateFlashcardScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  _CreateFlashcardScreenState createState() => _CreateFlashcardScreenState();
}

class _CreateFlashcardScreenState extends State<CreateFlashcardScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  // List to store flashcards
  List<Map<String, String>> flashcards = [];

  void saveFlashcard() {
    String? selectedCategory = '${widget.categoryName}';

    // Store question and answer in the flashcards list
    String question = _questionController.text.trim();
    String answer = _answerController.text.trim();

    if (question.isNotEmpty && answer.isNotEmpty) {
      if (!premadeFlashcards.containsKey(selectedCategory)) {
        premadeFlashcards[selectedCategory] = [];
      }
      premadeFlashcards[selectedCategory]!
          .add({"question": question, "answer": answer});

      // Clear the text fields for new input
      _questionController.clear();
      _answerController.clear();

      // Optional: Print flashcards to console for debugging
      print(premadeFlashcards[selectedCategory]);
    }
  }

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? selectedCategory = '${widget.categoryName}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Flashcards For ${widget.categoryName} Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Flashcard Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Question:', style: TextStyle(fontSize: 18)),
                    TextFormField(
                      controller: _questionController,
                      decoration: InputDecoration(
                        hintText: 'Enter question here',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Answer:', style: TextStyle(fontSize: 18)),
                    TextFormField(
                      controller: _answerController,
                      decoration: InputDecoration(
                        hintText: 'Enter answer here',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: saveFlashcard,
                        child: Text('Save Flashcard'),
                      ),
                    ),
                    SizedBox(
                        height:
                            20), // Add spacing before the 'Complete Flashcard Set' button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Your logic when the 'Complete Flashcard Set' is pressed
                          //print("Finished card set");
                          if (premadeFlashcards[selectedCategory]!.isNotEmpty) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                                // builder: (context) => BrowseFlashcardsScreen(
                                //     selectedCategory: selectedCategory,
                                //     flashcards: flashcards),
                              ),
                            );
                          } else {
                            // Optionally, show a message if there are no flashcards to browse
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'No flashcards to browse. Please add some first.')),
                            );
                          }
                        },
                        child: Text('Complete Flashcard Set'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
