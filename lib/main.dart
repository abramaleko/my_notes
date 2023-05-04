import 'package:flutter/material.dart';
import 'package:my_notes/note.dart';
import 'package:my_notes/note_provide.dart';
import 'package:provider/provider.dart';
import 'my_notes.dart';
import 'notes_list.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NotesList(),
    ),
    GoRoute(
      path: '/create-note',
      builder: (context, state) => const MyNotes(),
    ),
    GoRoute(
      path: '/note/:noteId',
      name: 'note',
      builder: (context, state) =>  Note(noteId:state.params['noteId']),
      ),
  ],
);

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NoteProvider>(create: (context) => NoteProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My notes',
      routerConfig: _router,
    );
  }
}

