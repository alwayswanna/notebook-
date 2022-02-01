import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_view/utils/request.dart';

import 'notes_model.dart';

class AddNote extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final payloadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add note'),
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
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "What i must remember?"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Hm, shortly description"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: new ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 300),
                      child: TextField(
                        controller: payloadController,
                        maxLines: null,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            saveNewNote(
                                context,
                                titleController.text,
                                descriptionController.text,
                                payloadController.text);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          label: Text(
                            'Save note',
                            style: TextStyle(fontSize: 15),
                          )))
                ],
              ),
            ),
          ],
        ));
  }

  saveNewNote(context, title, desc, payload) {
    Map<String, String> attributes = new HashMap();
    Request().createNewNote(title, desc, payload, attributes);
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => NoteList()),
        (Route<dynamic> route) => false,
    );
  }
}
