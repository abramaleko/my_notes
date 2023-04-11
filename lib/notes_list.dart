import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesList extends StatefulWidget {
  final List<Map> notes;
  final Function(int) updatePage;

  const NotesList({super.key, required this.notes, required this.updatePage});

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
          title: const Text('My notes'),
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
                      startActionPane: const ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ListTile(
                        tileColor: const Color.fromARGB(255, 230, 226, 226),
                        title: Text(
                          note['topic'],
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 31, 30, 30)),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 1,
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
              setState(() { }); //updates the ui
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
