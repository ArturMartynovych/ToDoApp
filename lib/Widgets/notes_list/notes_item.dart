import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/models/note.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({
    required this.notes,
    required this.note,
    required this.onRemoveNote,
    Key? key,
  }) : super(key: key);

  final List<Note> notes;
  final Note note;
  final Function(Note note) onRemoveNote;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isDeleting = false;
  late AnimationController _deleteAnimationController;

  @override
  void initState() {
    super.initState();
    _deleteAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _deleteAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.note.title,
                        style: GoogleFonts.nunito(
                          textStyle:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.note.note,
                        maxLines: _isExpanded ? null : 2,
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.nunito(),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                AnimatedOpacity(
                  opacity: _isDeleting ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () {
                      _startDeletingAnimation();
                    },
                    child: Icon(
                      Icons.delete,
                      color:
                          Theme.of(context).colorScheme.error.withOpacity(0.85),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startDeletingAnimation() {
    setState(() {
      _isDeleting = true;
    });

    _deleteAnimationController.forward().then((value) {
      widget.onRemoveNote(widget.note);
    });
  }
}
