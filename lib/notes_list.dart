import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesList extends StatefulWidget {
  final List<Map> notes;
  final Function(int) updatePage;
  final Function(int) deleteNote;
  final Function showNote;

  const NotesList(
      {super.key,
      required this.notes,
      required this.updatePage,
      required this.showNote,
      required this.deleteNote});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My notes',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Note Lists'),
        ),
        body: Builder(builder: (BuildContext context) {
          if (widget.notes.isEmpty) {
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
              itemCount: widget.notes.length,
              itemBuilder: (BuildContext context, int index) {
                final note = widget.notes[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5,left: 10,right: 10),
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
                          widget.showNote(note, 3);
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
              widget.updatePage(1);
              setState(() {}); //updates the ui
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
