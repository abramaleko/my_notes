import 'package:flutter/material.dart';
import 'my_notes.dart';
import 'notes_list.dart';
import 'note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationContainer(),
    );
  }
}

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int currentIndex = 0; //stores the index of the home page
  List<Map> notes = [];
  Map note = {};

//updates page depending on index
  void updatePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void showNote(Map note, index) {
    setState(() {
      this.note = note;
      showNotePage();
    });
  }

  void showNotePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Note(note: note, deleteNote: deleteNote)),
    );
  }

  void addNote(note) {
    setState(() {
      notes.add(note);
    });
  }

  void deleteNote(int id) {
    setState(() {
      notes.removeWhere((note) => note['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (currentIndex) {
      case 0:
        page =
            NotesList(notes: notes, updatePage: updatePage, showNote: showNote,deleteNote: deleteNote);
        break;
      case 1:
        page = MyNotes(addNote: addNote, updatePage: updatePage);
        break;
      case 2:
        page = const Text('Saved Notes');
        break;
      default:
        throw UnimplementedError('no widget for $currentIndex');
    }

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Notes',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_chart_outlined),
            label: 'New Note',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          )
        ],
      ),
      body: Container(child: page),
    );
  }
}
