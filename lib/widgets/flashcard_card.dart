import 'package:flutter/material.dart';
import 'package:flashcard_app/models/flashcard.dart';

class FlashcardCard extends StatelessWidget {
  final Flashcard flashcard;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  FlashcardCard({required this.flashcard, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(flashcard.question),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(flashcard.answer)),
          );
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
