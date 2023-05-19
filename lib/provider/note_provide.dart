import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteProvider with ChangeNotifier {
  int currentIndex = 0; //stores the index of the home page
  CollectionReference notesList =
      FirebaseFirestore.instance.collection('notes');

  //updates page depending on index
  void updatePage(int index) {
    currentIndex = index;
    notifyListeners();
  }


  Future<void> addNewNote(data) {
    return notesList.add({'title': data['topic'], 'content': data['content']});
  }
}
