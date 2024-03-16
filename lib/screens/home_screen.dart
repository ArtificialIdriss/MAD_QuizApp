import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'create_flascards_screen.dart';
import 'browse_flashcards_screen.dart';
import 'quiz_mode_screen.dart';
import 'package:flash_card_app/screens/premade_flashcards.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<String> categories = ['Math', 'World History', 'Literature', 'Science'];
  //Map<String, List<Map<String, String>>> premade = premadeFlashcards;
  //List<String> categories = premade.keys.toList();

  final user = FirebaseAuth.instance.currentUser!;

  //category updater:
  // void updateCategoriesList(String newCategory) {
  //   if (!categories.contains(newCategory)) {
  //     setState(() {
  //       categories.add(newCategory);
  //     });
  //   }
  // }

  // sign user out
  void signOutUser(BuildContext context) {
    FirebaseAuth.instance.signOut();
    // After signing out, navigate back to the sign-in screen
    Navigator.pushReplacementNamed(context, '/signin');
  }

  //pop-up for browse flashcard
  void showBrowseFlashcardDialog(BuildContext context) {
    // Example categories list
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? selectedCategory =
            null; // This holds the selected dropdown value
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Category'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory =
                              newValue; // Update the selected value
                        });
                      },
                      items: categories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text('Select a category'),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Continue'),
                  onPressed: () {
                    if (selectedCategory != null &&
                        premadeFlashcards.containsKey(selectedCategory)) {
                      // Since premadeFlashcards is already initialized and contains a list of maps for each category,
                      // you can directly use it to retrieve the flashcards for the selected category.
                      List<Map<String, String>> flashcards =
                          premadeFlashcards[selectedCategory]!;

                      // Now you can pass these flashcards to the BrowseFlashcardsScreen.
                      // This assumes BrowseFlashcardsScreen has been properly set up to accept and use
                      // both the 'selectedCategory' String and the 'flashcards' List<Map<String, String>>.
                      Navigator.of(context)
                          .pop(); // Close the current dialog first
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BrowseFlashcardsScreen(
                            //flashcards: premadeFlashcards[selectedCategory],
                            selectedCategory: selectedCategory,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  //quiz popup
  void showQuizModeDialog(BuildContext context) {
    // Example categories list
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? selectedCategory =
            null; // This holds the selected dropdown value
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Category'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory =
                              newValue; // Update the selected value
                        });
                      },
                      items: categories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text('Select a category'),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Continue'),
                  onPressed: () {
                    if (selectedCategory != null &&
                        premadeFlashcards.containsKey(selectedCategory)) {
                      // Since premadeFlashcards is already initialized and contains a list of maps for each category,
                      // you can directly use it to retrieve the flashcards for the selected category.
                      List<Map<String, String>> flashcards =
                          premadeFlashcards[selectedCategory]!;

                      // Now you can pass these flashcards to the BrowseFlashcardsScreen.
                      // This assumes BrowseFlashcardsScreen has been properly set up to accept and use
                      // both the 'selectedCategory' String and the 'flashcards' List<Map<String, String>>.
                      Navigator.of(context)
                          .pop(); // Close the current dialog first
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuizModeScreen(
                            //flashcards: premadeFlashcards[selectedCategory],
                            selectedCategory: selectedCategory,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  //popup for create flashcard
  void showCreateFlashcardsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? categoryName = null;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Create or Select Category'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => showAddCategoryDialog(
                          context, categories, () => setState(() {})),
                      child: const Text('Add New Category'),
                    ),
                    DropdownButton<String>(
                      value: categoryName,
                      onChanged: (String? newValue) {
                        setState(() {
                          categoryName = newValue;
                        });
                      },
                      items: categories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text('Select a category'),
                    ),
                    TextButton(
                      child: const Text('Continue'),
                      onPressed: () {
                        if (categoryName != null) {
                          // Perform navigation after state update and if a category is selected
                          Navigator.of(context).pop(); // Close the dialog first
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateFlashcardScreen(
                                categoryName: categoryName),
                          ));
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showAddCategoryDialog(
      BuildContext context, List<String> categories, VoidCallback onUpdated) {
    final TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Category"),
          content: TextField(
            controller: categoryController,
            decoration: const InputDecoration(hintText: "Enter category name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Add"),
              onPressed: () {
                final String categoryName = categoryController.text.trim();
                if (categoryName.isNotEmpty) {
                  categories.add(categoryName);
                  onUpdated();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        CreateFlashcardScreen(categoryName: categoryName),
                  ));
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      backgroundColor: const Color.fromARGB(255, 124, 168, 201),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Logged In As: ${user?.email ?? 'N/A'}",
                style: const TextStyle(fontSize: 18, color: Colors.black)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showCreateFlashcardsDialog(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 104, 255)),
              child: const Text('Create Flashcards',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            // Additional buttons here...
            ElevatedButton(
              onPressed: () => showBrowseFlashcardDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 77, 104, 255), // Match sign-in button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Match sign-in button border radius
                ),
              ),
              child: Text(
                'Browse Flashcards',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showQuizModeDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 77, 104, 255), // Match sign-in button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Match sign-in button border radius
                ),
              ),
              child: Text(
                'Quiz Mode',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => signOutUser(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 221, 46, 68), // Use consistent sign-out button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Match sign-in button border radius
                ),
              ),
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
