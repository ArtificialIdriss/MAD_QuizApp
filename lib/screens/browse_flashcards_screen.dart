import 'package:flutter/material.dart';

class BrowseFlashcardsScreen extends StatefulWidget {
  final String? selectedCategory;

  const BrowseFlashcardsScreen({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  _BrowseFlashcardsScreenState createState() => _BrowseFlashcardsScreenState();
}

class _BrowseFlashcardsScreenState extends State<BrowseFlashcardsScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Create Flashcards For ${widget.selectedCategory} Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
// class BrowseFlashcardsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Browse Flashcards'),
//       ),
//       body: Center(
//         child: Text('Browse Flashcards Screen'),
//       ),
//     );
//   }
// }
}
