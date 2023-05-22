import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/provider/note_provide.dart';
import 'package:provider/provider.dart';

class Note extends StatelessWidget {
  var noteId;

  Note({Key? key, required this.noteId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('notes').doc(noteId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator if the data is not yet available
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          // Handle any potential error that occurred during the fetch
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          // Handle the case when the document does not exist
          return const Text('Document does not exist');
        }
        final note = snapshot.data!.data() as Map<String, dynamic>;
        
        // Return your desired widget here using the note data
        return Scaffold(
          appBar: AppBar(
            title: const Text('My note'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            note['title'],
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance.collection('notes').doc(noteId).delete()
                                .then((value) =>
                                  context.go('/note-list')
                                 );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          note['content'],
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
