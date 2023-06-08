import 'package:flutter/material.dart';
import 'package:hive_database/hive_task/screens_task/model_task/model_data_task.dart';
import 'package:hive_database/hive_task/screens_task/read_screen_task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class hivescreen extends StatefulWidget {
  const hivescreen({super.key});

  @override
  State<hivescreen> createState() => _hivescreenState();
}

class _hivescreenState extends State<hivescreen> {
  late TextEditingController _titleEditingController = TextEditingController();
  late TextEditingController _discEditingController = TextEditingController();
  late Datas mydata;
  late Box box;

  @override
  void initState() {
    box = Hive.box<Datas>("database_hive");
    super.initState();
  }

  _createData() {
    box.add(
      Datas(
        title: _titleEditingController.text,
        discription: _discEditingController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.0),
              ),
            ),
            context: context,
            builder: (context) {
              return SizedBox(
                height: 600,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "Add Task",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Title",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: _titleEditingController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Title',
                              labelText: 'Title',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Discription",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          controller: _discEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Description',
                            labelText: 'Description',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: ElevatedButton(
                          onPressed: () {
                            _createData();
                            print(box.values);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (b) {
                                  return readhive();
                                },
                              ),
                            );
                          },
                          child: Text("Add"),
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.purple),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
            width: double.infinity,
            child: Image.asset(
              'assets/userlist.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Text(
            "Nothing to do ......",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
          )
        ],
      ),
    );
  }
}
