
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_view/dto/note.dart';
import 'package:note_view/utils/request.dart';

import 'notes_model.dart';

class EditNote extends StatelessWidget{
  EditNote(this.note);
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final payloadController = TextEditingController();

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit note'),
        backgroundColor: Colors.black,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: note.title,
                          border: UnderlineInputBorder(),
                          labelText: "Title"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintText: note.description,
                          border: UnderlineInputBorder(),
                          labelText: 'Description'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: new ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 300),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: note.payload
                        ),
                        controller: payloadController,
                        maxLines: null,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            Request().editSelectedNote(new Note(
                                id: note.id,
                                title: titleController.text,
                                description: descriptionController.text,
                                payload: payloadController.text,
                                attributes: note.attributes));
                            Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => NoteList()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          label: Text(
                            'Edit note',
                            style: TextStyle(fontSize: 15),
                          )))
                ],
              ),
            ),
          ],
        ));
  }

}