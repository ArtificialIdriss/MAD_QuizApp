// premade_flashcards.dart
Map<String, List<Map<String, String>>> premadeFlashcards = {
  'Math': [
    {'question': '2 + 2', 'answer': '4'},
    {'question': '3 * 3', 'answer': '9'},
    {'question': 'Square root of 64', 'answer': '8'},
    {'question': '15 - 7', 'answer': '8'},
    {'question': '12 divided by 3', 'answer': '4'},
    {'question': '5 times 5', 'answer': '25'},
    {'question': '21 plus 79', 'answer': '100'},
    {'question': '90 minus 45', 'answer': '45'},
    {'question': '8 times 7', 'answer': '56'},
    {'question': '100 divided by 25', 'answer': '4'},
  ],
  'World History': [
    {'question': 'Who was the first Emperor of Rome?', 'answer': 'Augustus'},
    {'question': 'What year did the Berlin Wall fall?', 'answer': '1989'},
    {
      'question': 'Which country gifted the Statue of Liberty to the USA?',
      'answer': 'France'
    },
    {'question': 'Who discovered America?', 'answer': 'Christopher Columbus'},
    {
      'question': 'What was the main cause of World War I?',
      'answer': 'Assassination of Archduke Franz Ferdinand'
    },
    {
      'question': 'Which civilization built the pyramids?',
      'answer': 'Egyptian'
    },
    {'question': 'In what year did the Titanic sink?', 'answer': '1912'},
    {
      'question': 'Who was known as the Maid of Orleans?',
      'answer': 'Joan of Arc'
    },
    {
      'question': 'What was the longest dynasty in China?',
      'answer': 'Zhou Dynasty'
    },
    {
      'question': 'Who wrote the Declaration of Independence?',
      'answer': 'Thomas Jefferson'
    },
  ],
  'Literature': [
    {'question': 'Who wrote "To Kill a Mockingbird"?', 'answer': 'Harper Lee'},
    {
      'question': 'What is the name of the wizard in "The Hobbit"?',
      'answer': 'Gandalf'
    },
    {'question': 'Who is the author of "1984"?', 'answer': 'George Orwell'},
    {
      'question': 'Who wrote "Romeo and Juliet"?',
      'answer': 'William Shakespeare'
    },
    {
      'question': 'In which book does the character "Hannibal Lecter" appear?',
      'answer': 'The Silence of the Lambs'
    },
    {
      'question': 'Who wrote "The Great Gatsby"?',
      'answer': 'F. Scott Fitzgerald'
    },
    {
      'question': 'What is the title of the first Harry Potter book?',
      'answer': 'Harry Potter and the Philosopher\'s Stone'
    },
    {
      'question': 'Who created the detective Sherlock Holmes?',
      'answer': 'Arthur Conan Doyle'
    },
    {
      'question': 'Who is the author of "Pride and Prejudice"?',
      'answer': 'Jane Austen'
    },
    {
      'question':
          'In what narrative poem does Dante explore hell, purgatory, and paradise?',
      'answer': 'The Divine Comedy'
    },
  ],
  'Science': [
    {'question': 'What is the chemical symbol for gold?', 'answer': 'Au'},
    {'question': 'How many planets are in the Solar System?', 'answer': '8'},
    {
      'question': 'What is the process by which plants prepare their food?',
      'answer': 'Photosynthesis'
    },
    {
      'question': 'Who proposed the theory of relativity?',
      'answer': 'Albert Einstein'
    },
    {
      'question': 'What is the hardest natural substance on Earth?',
      'answer': 'Diamond'
    },
    {
      'question': 'What is the largest organ of the human body?',
      'answer': 'Skin'
    },
    {'question': 'Who discovered penicillin?', 'answer': 'Alexander Fleming'},
    {'question': 'What does DNA stand for?', 'answer': 'Deoxyribonucleic Acid'},
    {'question': 'What planet is known as the Red Planet?', 'answer': 'Mars'},
    {
      'question': 'What gas do living creatures need to breathe?',
      'answer': 'Oxygen'
    },
  ],
};

List<String> categories = premadeFlashcards.keys.toList();
