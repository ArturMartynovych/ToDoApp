import 'package:flutter/material.dart';
import 'package:todoapp/models/note.dart';

class NewNote extends StatefulWidget {
  const NewNote({
    super.key,
    required this.onAddNewNote,
  });

  final void Function(Note note) onAddNewNote;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 30,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextFormField(
            controller: _noteController,
            decoration: const InputDecoration(
              label: Text('Notes'),
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
          )
        ],
      ),
    );
  }
}
