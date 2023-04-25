import 'package:flutter/material.dart';
import 'note.dart';

class NoteProvider with ChangeNotifier {
  int currentIndex = 0; //stores the index of the home page
  List<Map> notes = [];
  Map note = {};

  //updates page depending on index
  void updatePage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void addNote(note) {
    notes.add(note); //add note to the list
    updatePage(0); //shows the note list page
    notifyListeners();
  }

  void showNotePage(BuildContext context,note) {
    Navigator.push(context,MaterialPageRoute(
          builder: (context) => Note(note: note)),
    );
  }

  void deleteNote(int id) {
      notes.removeWhere((note) => note['id'] == id);
      updatePage(0); //shows the note list page
      notifyListeners();
  }
}
