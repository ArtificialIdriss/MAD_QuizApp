import 'package:flutter/material.dart';
import 'home_screen.dart';

class CreateFlashcardScreen extends StatefulWidget {
  final String categoryName;

  const CreateFlashcardScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  _NewCategoryScreenState createState() => _NewCategoryScreenState();
}

// Define the corresponding State class
class _NewCategoryScreenState extends State<CreateFlashcardScreen> {
  // Now you can use initState()
  @override
  void initState() {
    super.initState();
    // You can now use widget.categoryName to access the categoryName
    fetchDataForCategory(widget.categoryName);
  }

  void fetchDataForCategory(String categoryName) {
    // Placeholder for your actual data fetching logic
    print("Fetching data for $categoryName");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Category: ${widget.categoryName}'),
      ),
      body: Center(
        child: Text(
            'Here you can add details for the "${widget.categoryName}" category.'),
      ),
    );
  }
}
