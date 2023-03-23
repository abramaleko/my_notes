import 'package:flutter/material.dart';

void main() {
  runApp(const MyNotes());
}

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notebook',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Notebook'),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Card(
            color: const Color.fromARGB(255, 255, 238, 234),
            child: SizedBox(
              height: 600,
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 8, 15),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Subject',
                            labelStyle: TextStyle(fontSize: 18.0),
                            hintText: 'i.e learn Flutter'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLines: 18,
                        decoration: const InputDecoration(
                            hintText: 'i.e what do you want to write about'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 20)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.fromLTRB(20, 15, 20, 15)),
                        ),
                        onPressed: () {},
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
