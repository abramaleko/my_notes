import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesList extends StatelessWidget {
  final List<Map> notes;

  const NotesList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My notes',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My notes'),
        ),
        body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            final note = notes[index];

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
                    tileColor:const Color.fromARGB(255, 230, 226, 226),
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

            // return ListTile(
            //   title: Text(),
            //   subtitle: Text(note['content']),
            // );
          },
        ),
      ),
    );
  }
}
