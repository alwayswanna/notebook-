import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_view/models/notes_model.dart';

void main() => runApp(NoteApp());

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Document Viewer",
      initialRoute: '',
      routes: {
        '': (context) => NoteList(),
      },
    );
  }
}
