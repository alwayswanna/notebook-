import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:note_view/dto/note.dart';

const SERVER_URI = "http://localhost:7075/api";

class Request {
  Future<List<Note>> fetchAllNotes() async {
    final response = await http.get(Uri.parse(SERVER_URI + "/note"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Note.fromJson(data)).toList();
    } else {
      throw new Exception('Failed to load note from server');
    }
  }

  Future<Note> fetchNoteById(String noteId) async {
    final response = await http.get(Uri.parse(SERVER_URI + "/note/" + noteId));
    if (response.statusCode == 200) {
      return Note.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed load note with [id]:" + noteId);
    }
  }

  Future<Note> createNewNote(String title, String description, String payload,
      Map<String, String> attributes) async {
    if(title.isEmpty || description.isEmpty){
      throw Exception("Can`t create note, title or description is null or empty");
    }
    final response = await http.post(
      Uri.parse(SERVER_URI + "/note"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'description': description,
        'payload': payload,
        'attributes': attributes
      }),
    );
    if (response.statusCode == 200) {
      return Note.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Can`t create note." + response.body.toString());
    }
  }

  Future<List<Note>> deleteNoteById(String id) async {
    final response = await http.delete(Uri.parse(SERVER_URI + "/note/" + id));
    if (response.statusCode == 200) {
      return fetchAllNotes();
    } else {
      throw Exception("Can`t delete note with [id]:" + id);
    }
  }

  Future<Note> editSelectedNote(Note note) async {
    final response = await http.put(
      Uri.parse(SERVER_URI + "/note"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': note.id,
        'title': note.title,
        'description': note.description,
        'payload': note.payload,
        'attributes': note.attributes
      }),
    );
    if (response.statusCode == 200) {
      return Note.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Can`t edit selected post.");
    }
  }
}
