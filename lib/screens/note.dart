import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/provider/note_provide.dart';
import 'package:provider/provider.dart';

class Note extends StatelessWidget {
  var noteId;

  Note({super.key, required this.noteId});
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
    var note = noteProvider.notes
        .firstWhere((note) => note['id'] == int.parse(noteId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('My note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        note['topic'],
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            noteProvider.deleteNote(note['id']);
                            context.go('/note-list');
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      note['content'],
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
