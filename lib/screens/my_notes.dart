import 'dart:math';
import 'package:go_router/go_router.dart';
import 'package:my_notes/provider/note_provide.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../util/navigation_container.dart';

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    final formKey = GlobalKey<FormState>();
    final topic = TextEditingController();
    final content = TextEditingController();

    saveInfo() {
      if (formKey.currentState!.validate()) {
        var id = Random().nextInt(100);
        var data = {
          'id': id,
          'topic': topic.text,
          'content': content.text,
        };

        topic.clear();
        content.clear();
        noteProvider.addNote(data); //add note to the list
        context.go('/');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
      ),
      bottomNavigationBar: const NavigationContainer(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 640,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 8, 0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: topic,
                      decoration: const InputDecoration(
                          labelText: 'Subject',
                          labelStyle: TextStyle(fontSize: 18.0),
                          hintText: 'i.e learn Flutter'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the subject header';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: content,
                      maxLines: 20,
                      decoration: const InputDecoration(
                          hintText: 'i.e what do you want to write about'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the content';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 20)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                      ),
                      onPressed: saveInfo,
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
