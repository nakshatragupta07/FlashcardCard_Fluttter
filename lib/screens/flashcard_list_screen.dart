import 'package:flutter/material.dart';
import 'package:flashcard_app/models/flashcard.dart';
import 'package:flashcard_app/screens/add_flashcard_screen.dart';
import 'package:flashcard_app/screens/edit_flashcard_screen.dart';
import 'package:flashcard_app/widgets/flashcard_card.dart';

class FlashcardListScreen extends StatefulWidget {
  @override
  _FlashcardListScreenState createState() => _FlashcardListScreenState();
}

class _FlashcardListScreenState extends State<FlashcardListScreen> {
  List<Flashcard> flashcards = [];

  void addFlashcard(Flashcard flashcard) {
    setState(() {
      flashcards.add(flashcard);
    });
  }

  void editFlashcard(int index, Flashcard flashcard) {
    setState(() {
      flashcards[index] = flashcard;
    });
  }

  void deleteFlashcard(int index) {
    setState(() {
      flashcards.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flashcards')),
      body: ListView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return FlashcardCard(
            flashcard: flashcards[index],
            onEdit: () async {
              final editedFlashcard = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditFlashcardScreen(flashcard: flashcards[index]),
                ),
              );
              if (editedFlashcard != null) {
                editFlashcard(index, editedFlashcard);
              }
            },
            onDelete: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Confirm Delete'),
                  content: Text('Are you sure you want to delete this flashcard?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        deleteFlashcard(index);
                        Navigator.pop(context);
                      },
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newFlashcard = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFlashcardScreen()),
          );
          if (newFlashcard != null) {
            addFlashcard(newFlashcard);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
