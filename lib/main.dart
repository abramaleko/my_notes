import 'package:flutter/material.dart';
import 'my_notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationContainer(),
    );
  }
}

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int currentIndex = 0; //stores the index of the home page

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (currentIndex) {
      case 0:
        page = const Text('My Notes');
        break;
      case 1:
       page = const MyNotes();
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
