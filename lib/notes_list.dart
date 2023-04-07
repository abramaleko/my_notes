import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
    final List<Map> notes;

   const NotesList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length ,
    itemBuilder: (BuildContext context, int index) {
    final note = notes[index];
    return ListTile(
      title: Text(note['topic']),
      subtitle: Text(note['content']),
    );
  },
      );
  }
}
