import 'package:app/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();
  void openNoteBox(){
    showDialog(context: context, 
    builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [
        ElevatedButton(
        onPressed: () {
          firestoreService.addNote(textController.text);
          textController.clear();
          Navigator.pop(context);
        },
        child: const Text("Add"),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      )
    );
  }
}