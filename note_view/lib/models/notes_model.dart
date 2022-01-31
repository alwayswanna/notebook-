import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_view/dto/note.dart';
import 'package:note_view/models/add_note.dart';
import 'package:note_view/utils/request.dart';
import 'package:intl/intl.dart';

import 'note_view.dart';

class _NoteListState extends State<NoteList> {
  late List<Note> futureNote;

  @override
  void initState() {
    futureNote = List.empty();
    Future.delayed(Duration(microseconds: 100), () {
      _loadAsyncData();
    });
    super.initState();
  }

  _loadAsyncData() async {
    Request request = new Request();
    request.fetchAllNotes().then((value) {
      setState(() {
        futureNote = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
        appBar: AppBar(
          title: Text('NoteBook~'),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddNote()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 29,
          ),
          backgroundColor: Colors.black,
          tooltip: 'Add note',
          elevation: 5,
          splashColor: Colors.grey,
        ),
        body: GridView.count(
          restorationId: 'grid_view_demo_grid_offset',
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          padding: const EdgeInsets.all(15),
          childAspectRatio: 1,
          crossAxisCount: 8,
          children: futureNote.map<Widget>((note) {
            return _GridNoteItem(note: note);
          }).toList()
        ));
  }
}

class _GridNoteItem extends StatelessWidget {
  const _GridNoteItem({required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        setImageByWeekDay(note.attributes),
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: Colors.black12,
            title: _GridTitleText(note.title),
            subtitle: _GridTitleText(note.attributes['time'].toString().substring(0, 10)),
          ),
          shadowColor: Colors.black12,
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ViewNote(note)));
          },
          child: image,
        ));
  }

  setImageByWeekDay(Map<String, dynamic> attr){
    var dateString = attr['time'].toString();
    var date = new DateFormat("yyyy-MM-dd").parse(dateString.substring(0, 10));
    var currentDay = DateFormat('EEEE').format(date);
    switch(currentDay){
      case 'Monday':
        return 'assets/images/monday.jpg';
      case 'Tuesday':
        return 'assets/images/tuesday.jpg';
      case 'Wednesday':
        return 'assets/images/wednesday.jpg';
      case 'Thursday':
        return 'assets/images/thursday.jpg';
      case 'Friday':
        return 'assets/images/friday.jpg';
      case 'Saturday':
        return 'assets/images/saturday.jpg';
      case 'Sunday':
        return 'assets/images/sunday.jpg';
      default:
        return 'assets/images/background_note.jpg';
    }
  }

}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class NoteList extends StatefulWidget {
  createState() => _NoteListState();
}
