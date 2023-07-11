import 'package:flutter/material.dart';
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
        child: Card(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notes[index].title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(notes[index].note),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
