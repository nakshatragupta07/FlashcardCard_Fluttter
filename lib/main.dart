import 'package:flutter/material.dart';
import 'screens/flashcard_list_screen.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlashcardListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
