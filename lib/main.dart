import 'package:flutter/material.dart';
import 'package:my_notes/note_provide.dart';
import 'package:provider/provider.dart';
import 'my_notes.dart';
import 'notes_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<NoteProvider>(
          create: (context) => NoteProvider(),
          child: const NavigationContainer()),
    );
  }
}

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    Widget page;

    switch (noteProvider.currentIndex) {
      case 0:
        //tocheck
        page = const NotesList();
        break;
      case 1:
        page = const MyNotes();
        break;
      case 2:
        page = const Text('Saved Notes');
        break;
      default:
        throw UnimplementedError('no widget for ${noteProvider.currentIndex}');
    }

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          noteProvider.updatePage(index);
        },
        selectedIndex: noteProvider.currentIndex,
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
