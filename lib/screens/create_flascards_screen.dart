import 'package:flutter/material.dart';

class CreateFlashcardScreen extends StatefulWidget {
  final String categoryName;

  const CreateFlashcardScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  _CreateFlashcardScreenState createState() => _CreateFlashcardScreenState();
}

class _CreateFlashcardScreenState extends State<CreateFlashcardScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            // Wrap your form fields in a Card widget
            Card(
              elevation: 4.0, // Adjust elevation for depth effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Round corners
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
                            vertical: 10.0, horizontal: 10.0), // Adjust padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Round corners of the input field
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
                            vertical: 10.0, horizontal: 10.0), // Adjust padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Round corners of the input field
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to handle save action
                },
                child: Text('Save and Create New Flashcard'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
