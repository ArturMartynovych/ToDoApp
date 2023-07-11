import 'package:flutter/material.dart';
import 'package:todoapp/models/note.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final List<Note> _enteredNote = [];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        "Brak notatek",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: Column(
        children: [
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
