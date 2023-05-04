import 'package:flutter/material.dart';
import 'note.dart';

class NoteProvider with ChangeNotifier {
  int currentIndex = 0; //stores the index of the home page
  List<Map> notes = [];

  //updates page depending on index
  void updatePage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void addNote(note) {
    notes.add(note); //add note to the list
    updatePage(0); //shows the note list page
  }

  void deleteNote(int id) {
    notes.removeWhere((note) => note['id'] == id);
    notifyListeners();
  }
}
