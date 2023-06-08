import 'package:flutter/material.dart';
import './read_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../model/model_data.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late Box box;

  @override
  void initState() {
    // box = Hive.box<Map<String, String>>("data_box1");
    box = Hive.box<Data>("notes_data");
    super.initState();
  }

  _createData() {
    // Map<String, String> myValue = {
    //   "title": _titleController.text,
    //   "description": _descriptionController.text
    // };
    //   box.add(myValue);
    // box.putAt(0,myValue);
    box.add(
      Data(
        title: _titleController.text,
        description: _descriptionController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Create Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _titleController,
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
              controller: _descriptionController,
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
              _createData();
              print(box.values);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReadScreen(),
                ),
              );
            },
            child: const Text('ADD DATA'),
          )
        ],
      ),
    );
  }
}
