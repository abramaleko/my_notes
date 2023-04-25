import 'package:flutter/material.dart';
import 'package:my_notes/note_provide.dart';
import 'package:provider/provider.dart';

class Note extends StatelessWidget {
  final Map note;

  const Note({super.key, required this.note});
  
  @override
  Widget build(BuildContext context) {
   final noteProvider = Provider.of<NoteProvider>(context,listen: false);

    // ignore: avoid_unnecessary_containers
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My note'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child:  Card(
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
      ),
    );
  }
}
