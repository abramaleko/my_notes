import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/provider/note_provide.dart';
import 'package:provider/provider.dart';
import '../util/navigation_container.dart';
import 'dart:core';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    final router = GoRouter.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Lists'),
      ),
      bottomNavigationBar: const NavigationContainer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No notes found ',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final note = snapshot.data!.docs[index];
               return Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(
                          note['title'],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 41, 40, 40)),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            note['content'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        onTap: () {
                          // router.goNamed('note',
                          //     params: {'noteId': note['id'].toString()});
                        },
                      ),
                    ),
                  ),
                );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            noteProvider.updatePage(1);
            context.go('/create-note');
          },
          child: const Icon(Icons.add)),
    );
  }
}
