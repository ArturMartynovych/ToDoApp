import 'package:flutter/material.dart';
import 'package:todoapp/models/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem(this.notes, {super.key});

  final Note notes;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              notes.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(notes.note),
          ],
        ),
      ),
    );
  }
}
