import 'package:flutter/material.dart';
import 'package:note_view/dto/note.dart';
import 'package:note_view/utils/request.dart';

import 'notes_model.dart';

class ViewNote extends StatelessWidget {
  ViewNote(this.note);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View note'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(9),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  note.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                            offset: Offset(10, 10),
                            blurRadius: 3,
                            color: Colors.lightBlueAccent)
                      ]),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Description:',
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
          ),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(note.description,
                    style: TextStyle(color: Colors.black, fontSize: 18))),
          ),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Full text:',
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
          ),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(note.payload,
                    style: TextStyle(color: Colors.black, fontSize: 18))),
          ),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: Text(
                    'Edit',
                    style: TextStyle(fontSize: 15),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Request request = Request();
                    request.deleteNoteById(note.id);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => NoteList()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: const Icon(Icons.remove),
                  label: Text(
                    'Remove',
                    style: TextStyle(fontSize: 15),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
