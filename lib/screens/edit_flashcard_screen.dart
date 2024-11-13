import 'package:flutter/material.dart';
import 'package:flashcard_app/models/flashcard.dart';

class EditFlashcardScreen extends StatefulWidget {
  final Flashcard flashcard;

  EditFlashcardScreen({required this.flashcard});

  @override
  _EditFlashcardScreenState createState() => _EditFlashcardScreenState();
}

class _EditFlashcardScreenState extends State<EditFlashcardScreen> {
  final _formKey = GlobalKey<FormState>();
  late String question;
  late String answer;

  @override
  void initState() {
    super.initState();
    question = widget.flashcard.question;
    answer = widget.flashcard.answer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Flashcard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: question,
                decoration: InputDecoration(labelText: 'Question'),
                validator: (value) => value!.isEmpty ? 'Please enter a question' : null,
                onSaved: (value) => question = value!,
              ),
              TextFormField(
                initialValue: answer,
                decoration: InputDecoration(labelText: 'Answer'),
                onSaved: (value) => answer = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, Flashcard(question: question, answer: answer));
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
