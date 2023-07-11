import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/notes_list/notes_item.dart';
import 'package:todoapp/models/note.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.notes,
    required this.onRemoveNote,
  });

  final List<Note> notes;
  final void Function(Note note) onRemoveNote;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(notes[index]),
        onDismissed: (direction) {
          onRemoveNote(notes[index]);
        },
        child: NoteItem(notes[index]),
      ),
    );
  }
}
