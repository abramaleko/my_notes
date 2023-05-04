import 'package:my_notes/note_provide.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class NavigationContainer extends StatelessWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    void onTapMenu(int value) {
      //update page
      noteProvider.updatePage(value);
      
      switch (noteProvider.currentIndex) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/create-note');
          break;
        default:
      }
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Notes'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_outlined), label: 'New note'),
      ],
      currentIndex: noteProvider.currentIndex,
      selectedItemColor: const Color.fromARGB(255, 15, 183, 195),
      onTap: onTapMenu,
    );
  }
}
