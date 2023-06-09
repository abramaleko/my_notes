import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/profile.dart';
import 'firebase_options.dart';
import 'screens/Auth/login_screen.dart';
import 'screens/Auth/sign_up.dart';
import 'screens/note.dart';
import 'provider/note_provide.dart';
import 'package:provider/provider.dart';
import 'screens/my_notes.dart';
import 'screens/notes_list.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
        redirect: (context, state) {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            return '/note-list';
          }
        }),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: '/note-list',
      builder: (context, state) => const NotesList(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return null;
        } else {
          return '/';
        }
      },
    ),
    GoRoute(
      path: '/create-note',
      builder: (context, state) => const MyNotes(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return null;
        } else {
          return '/';
        }
      },
    ),
    GoRoute(
      path: '/note/:noteId',
      name: 'note',
      builder: (context, state) => Note(noteId: state.params['noteId']),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return null;
        } else {
          return '/';
        }
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) =>  Profile(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return null;
        } else {
          return '/';
        }
      },
    )
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
