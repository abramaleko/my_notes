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
                return Column(
                  children: [
                    Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              widget.deleteNote(note['id']);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          title: Text(
                            note['topic'],
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 31, 30, 30)),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              note['content'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          onTap: () {
                            widget.showNote(note, 3);
                          },
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 15,
                    ),
                  ],
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
