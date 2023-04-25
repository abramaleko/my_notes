import 'package:flutter/material.dart';
import 'package:my_notes/note_provide.dart';
import 'package:provider/provider.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    var notes = noteProvider.notes;

    return MaterialApp(
      title: 'My notes',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Note Lists'),
        ),
        body: Builder(builder: (BuildContext context) {
          if (notes.isEmpty) {
            return const Center(
              child: Text(
                'No notes found ',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                final note = notes[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(
                          note['topic'],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 41, 40, 40)),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            note['content'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        onTap: () {
                          noteProvider.showNotePage(context,note);
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              noteProvider.updatePage(1);
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
