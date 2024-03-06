import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'create_flascards_screen.dart';
import 'browse_flashcards_screen.dart';
import 'quiz_mode_screen.dart';

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out
  void signOutUser(BuildContext context) {
    FirebaseAuth.instance.signOut();
    // After signing out, navigate back to the sign-in screen
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      backgroundColor:
          Color.fromARGB(255, 124, 168, 201), // Use consistent background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Logged In As: " + user.email!,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateFlashcardScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 77, 104, 255), // Match sign-in button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Match sign-in button border radius
                ),
              ),
              child: Text(
                'Create Flashcards',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BrowseFlashcardsScreen(),
                  ),
                );
              },
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizModeScreen(),
                  ),
                );
              },
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
