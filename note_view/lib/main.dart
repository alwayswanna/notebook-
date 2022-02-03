import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_view/models/notes_model.dart';
import 'package:window_size/window_size.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("NoteBook~");
  }
  runApp(NoteApp());
}


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
