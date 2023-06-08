// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/model_data.dart';
import 'read_screen.dart';

class UpdateScreen extends StatefulWidget {
  final int index;
  final Data? data;
  final titleController;
  final descriptionController;

  const UpdateScreen({
    super.key,
    required this.index,
    this.data,
    this.titleController,
    this.descriptionController,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late Box box;

  @override
  void initState() {
    //  box = Hive.box<Map<String, String>>("data_box1");
    box = Hive.box<Data>("notes_data");

    super.initState();

    titleController = TextEditingController(text: widget.titleController);
    descriptionController =
        TextEditingController(text: widget.descriptionController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Update index ${widget.index}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title',
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Description',
                labelText: 'Description',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _updateData();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReadScreen(),
                ),
              );
            },
            child: const Text('UPDATE DATA'),
          ),
        ],
      ),
    );
  }

  _updateData() {
    /*box.putAt(widget.index, {
      "title": titleController.text,
      "description": descriptionController.text
    });*/
    Data data = Data(
        title: titleController.text, description: descriptionController.text);
    box.putAt(widget.index, data);
  }
}
