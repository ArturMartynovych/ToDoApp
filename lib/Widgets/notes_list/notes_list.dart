import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/notes_list/notes_item.dart';
import 'package:todoapp/models/note.dart';

class NotesList extends StatefulWidget {
  const NotesList({
    super.key,
    required this.notes,
    required this.onRemoveNote,
  });

  final List<Note> notes;
  final void Function(Note note) onRemoveNote;

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _notes = widget.notes;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant NotesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _notes = widget.notes;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: GlobalKey<AnimatedListState>(),
      initialItemCount: _notes.length,
      itemBuilder: (context, index, animation) {
        return _buildItem(context, _notes[index], animation, index);
      },
    );
  }

  Widget _buildItem(
      BuildContext context, Note note, Animation<double> animation, int index) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(
          CurveTween(curve: Curves.easeOut),
        ),
      ),
      child: SizeTransition(
        sizeFactor: animation,
        child: Dismissible(
          key: ValueKey(widget.notes[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.85),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
          onDismissed: (direction) {
            _removeNote(index);
          },
          child: NoteItem(
            notes: _notes,
            note: _notes[index],
            onRemoveNote: widget.onRemoveNote,
          ),
        ),
      ),
    );
  }

  void _removeNote(int index) {
    setState(() {
      widget.onRemoveNote(widget.notes[index]);
    });

    final animatedListState =
        context.findAncestorStateOfType<AnimatedListState>();

    animatedListState?.removeItem(
      index,
      (context, animation) => const SizedBox.shrink(),
      duration: const Duration(milliseconds: 300),
    );
  }
}
