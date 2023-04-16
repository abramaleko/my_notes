import 'dart:math';

import 'package:flutter/material.dart';

class MyNotes extends StatefulWidget {
  final Function(int) updatePage;
  final Function addNote;

  const MyNotes({super.key, required this.addNote, required this.updatePage});

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  final _formKey = GlobalKey<FormState>();
  final _topic = TextEditingController();
  final _content = TextEditingController();

  @override
  void dispose() {
    _topic.dispose();
    _content.dispose();
    super.dispose();
  }

  saveInfo() {
    if (_formKey.currentState!.validate()) {
      var id=Random().nextInt(100);
      var data = {
         'id' : id,
        'topic': _topic.text,
        'content': _content.text,
      };
      widget.addNote(data); //adds the notes to list
      _topic.clear();
      _content.clear();
      setState(() {});
      widget.updatePage(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notebook',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Note'),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: SingleChildScrollView(
            child: SizedBox(
            height: 640,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 8, 0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _topic,
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
                      controller: _content,
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
      ),
    );
  }
}
