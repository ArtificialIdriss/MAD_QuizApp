// premade_flashcards.dart
Map<String, List<Map<String, String>>> premadeFlashcards = {
  'Math': [
    {'question': '2 + 2', 'answer': '4'},
    {'question': '3 * 3', 'answer': '9'},
    // Add more math questions here
  ],
  'World History': [
    {'question': 'Who was the first Emperor of Rome?', 'answer': 'Augustus'},
    {'question': 'What year did the Berlin Wall fall?', 'answer': '1989'},
  ],
  'Literature': [
    {'question': 'Who wrote "To Kill a Mockingbird"?', 'answer': 'Harper Lee'},
    {
      'question': 'What is the name of the wizard in "The Hobbit"?',
      'answer': 'Gandalf'
    },
  ],
  'Science': [
    {'question': 'What is the chemical symbol for gold?', 'answer': 'Au'},
    {'question': 'How many planets are in the Solar System?', 'answer': '8'},
  ],
  // Add other categories with their flashcards here
};
List<String> categories = premadeFlashcards.keys.toList();
