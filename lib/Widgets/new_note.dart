import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/Utils/color_utils.dart';
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
  late FocusNode _focusNode;

  void _saveNotes() {
    if (_noteController.text.trim().isEmpty ||
        _titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Dane wejściowe są puste',
            style: GoogleFonts.nunito(),
          ),
          content: Text(
            'Upewnij się, że tytuł i notatki zostały wprowadzone',
            style: GoogleFonts.nunito(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Dobrze',
                style: GoogleFonts.nunito(),
              ),
            )
          ],
        ),
      );
      return;
    }

    widget.onAddNewNote(
      Note(
        title: _titleController.text,
        note: _noteController.text,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _focusNode.dispose();
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
            focusNode: _focusNode,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: 'Tytuł',
              labelStyle: TextStyle(
                color: _focusNode.hasFocus
                    ? Theme.of(context).cardColor
                    : Theme.of(context).textTheme.titleLarge!.color,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: hexStringToColor('#C49653'),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: Theme.of(context).cardColor.withOpacity(0.7),
                ),
              ),
            ),
          ),
          TextFormField(
            controller: _noteController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              label: Text(
                'Notatki',
                style: GoogleFonts.nunito(),
              ),
              labelStyle: TextStyle(
                color: _focusNode.hasFocus
                    ? Theme.of(context).cardColor
                    : Theme.of(context).textTheme.titleLarge!.color,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: hexStringToColor('#C49653'),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: Theme.of(context).cardColor.withOpacity(0.7),
                ),
              ),
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: _saveNotes,
                child: Text(
                  'Zapisz',
                  style: GoogleFonts.nunito(),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Anuluj',
                  style: GoogleFonts.nunito(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
