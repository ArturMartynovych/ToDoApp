import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/Widgets/new_note.dart';
import 'package:todoapp/Widgets/notes_list/notes_list.dart';
import 'package:todoapp/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> with WidgetsBindingObserver {
  List<Note> _enteredNote = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    loadNotes();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      saveNotes();
    } else if (state == AppLifecycleState.resumed) {
      loadNotes();
    }
  }

  Future<void> saveNotes() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    List<Map<String, String>> savedNotes = _enteredNote.map((note) {
      return {
        'title': note.title,
        'note': note.note,
      };
    }).toList();

    await preferences.setString('notes', jsonEncode(savedNotes));
  }

  Future<void> loadNotes() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? savedNotesInJSON = preferences.getString('notes');

    if (savedNotesInJSON != null) {
      List<Map<String, dynamic>> savedNotes =
          List<Map<String, dynamic>>.from(jsonDecode(savedNotesInJSON));
      setState(() {
        _enteredNote = savedNotes.map((noteMap) {
          return Note(title: noteMap['title'], note: noteMap['note']);
        }).toList();
      });
    }
  }

  void _openNewNotePage() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: NewNote(onAddNewNote: _addNewNote),
          ),
        ),
      ),
    );
  }

  void _addNewNote(Note note) {
    setState(() {
      _enteredNote.add(note);
    });
  }

  void _removeNote(Note note) {
    final noteIndex = _enteredNote.indexOf(note);
    setState(() {
      _enteredNote.remove(note);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Notatka została usunięta',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Theme.of(context).textTheme.labelSmall!.color,
              fontSize: 16,
            ),
          ),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Theme.of(context).cardColor,
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 16),
        action: SnackBarAction(
          label: 'Cofnij',
          backgroundColor: Theme.of(context).textTheme.titleLarge!.color,
          textColor: Theme.of(context).cardColor,
          onPressed: () {
            setState(() {
              _enteredNote.insert(noteIndex, note);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('lib/assets/no_notes.png'),
          ),
          Text(
            "Brak notatek",
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 36,
                  ),
            ),
          ),
          const SizedBox(height: 70),
        ],
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
          style: GoogleFonts.nunito(
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openNewNotePage,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
