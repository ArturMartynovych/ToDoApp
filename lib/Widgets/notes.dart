import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/notes_list.dart';
import 'package:todoapp/models/note.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final List<Note> _enteredNote = [
    Note(
      title: 'University',
      note:
          'Presentation for diploma, Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna. Nunc viverra imperdiet enim. Fusce est.',
    ),
    Note(
      title: 'Work',
      note: 'Go to work',
    ),
    Note(
      title: 'Games',
      note: 'Buy that super game',
    ),
    Note(
      title: 'Home',
      note: 'Prepare dinner',
    ),
  ];

  void _removeNote(Note note) {
    setState(() {
      _enteredNote.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
        "Brak notatek",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 36,
            ),
      ),
    );

    if (_enteredNote.isNotEmpty) {
      mainContent = NotesList(
        notes: _enteredNote,
        onRemoveNote: _removeNote,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
