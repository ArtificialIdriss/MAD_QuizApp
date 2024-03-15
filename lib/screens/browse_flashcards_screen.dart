import 'package:flutter/material.dart';
import 'package:flash_card_app/screens/premade_flashcards.dart';

class BrowseFlashcardsScreen extends StatefulWidget {
  final String? selectedCategory;

  const BrowseFlashcardsScreen({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  _BrowseFlashcardsScreenState createState() => _BrowseFlashcardsScreenState();
}

class _BrowseFlashcardsScreenState extends State<BrowseFlashcardsScreen> {
  int _currentIndex = 0;
  bool _showAnswer = false;

  List<Map<String, String>> get flashcards {
    return premadeFlashcards[widget.selectedCategory] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Flashcards in ${widget.selectedCategory} Category'),
        backgroundColor: Color.fromARGB(255, 77, 104, 255), // AppBar color
      ),
      body: Container(
        color:
            Color.fromARGB(255, 124, 168, 201), // Lighter blue background color
        child: flashcards.isEmpty
            ? Center(child: Text('No flashcards available for this category.'))
            : PageView.builder(
                itemCount: flashcards.length,
                controller: PageController(viewportFraction: 0.85),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                    _showAnswer =
                        false; // Reset the view to question when swiping to the next card
                  });
                },
                itemBuilder: (context, index) {
                  final flashcard = flashcards[index];
                  return GestureDetector(
                    onTap: () => setState(() {
                      _showAnswer =
                          !_showAnswer; // Toggle between question and answer on tap
                    }),
                    child: Card(
                      color: Colors.white, // Card background color
                      elevation: 4,
                      margin:
                          EdgeInsets.symmetric(vertical: 48, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            _showAnswer
                                ? flashcard['answer']!
                                : flashcard['question']!,
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
