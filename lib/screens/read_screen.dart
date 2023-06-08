import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/model_data.dart';
import '/screens/create_screen.dart';
import '/screens/update_screen.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  late Box box;
  @override
  void initState() {
    // box= Hive.box<Map<String , String>>("data_box1");
    box = Hive.box<Data>("notes_data");

    super.initState();
  }

  _deleteData(int index) {
    box.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateScreen(),
              ),
            ),
            icon: const Icon(Icons.add),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                box.clear();
              },
              child: Text("Remove all"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // print("hive keeys ");
                // print("------");
                // print(box.keys);
                // print("hive values ");
                // print("------");
                // print(box.values);
                // print("------");
                print("to map");
                print(box.toMap());

                // print("value_from_box_with_key");
                // print  (box.get("A"));
                // print (box.get("b"));
                print("------");
                print("value_from_box_with_index");
                //  print  (box.getAt(0));
                // print (box.getAt(1));
              },
              child: Text("getData")),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (BuildContext con, value, child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    Data data = value.getAt(index);
                    // var map = value.get(index ,defaultValue: {"" :""} );

                    return ListTile(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateScreen(
                                index: index,
                                data: data,
                                titleController: "${data.title} ",
                                descriptionController: "${data.description} ",
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      title: Text(
                        "${data.title}",
                      ),
                      subtitle: Text(
                        "${data.description} ",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _deleteData(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
