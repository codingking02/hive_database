import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './model_task/model_data_task.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './detailsscreen.dart';

class readhive extends StatefulWidget {
  const readhive({super.key});

  @override
  State<readhive> createState() => _readhiveState();
}

class _readhiveState extends State<readhive> {
  late TextEditingController _titleEditingController = TextEditingController();
  late TextEditingController _discEditingController = TextEditingController();
  late Box box;
  late Datas mydata;

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

  _deleteData(int index) {
    box.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: CircularPercentIndicator(
                radius: 20,
                animation: true,
                backgroundColor: Colors.grey,
                progressColor: Colors.purple,
                // percent:  == true ? 0.25 : 0.0,
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "To Do",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: Container(
            margin: EdgeInsets.only(left: 47),
            child: Icon(
              Icons.circle,
              color: Colors.purple,
            ),
          )),
      backgroundColor: Colors.white,
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
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.only(left: 25, top: 20),
            width: MediaQuery.of(context).size.width - 50,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (b) {
                      return details_screen(
                        title: mydata.title,
                        discription: mydata.discription,
                      );
                    },
                  ),
                );
              },
              child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  mydata = value.getAt(index);
                  List<Datas> mylist = List.generate(
                    value.length,
                    (index) => Datas(
                      title: mydata.title,
                      discription: mydata.discription,
                    ),
                  );

                  return Dismissible(
                    onDismissed: (direction) {
                      _deleteData(index);
                    },
                    key: Key(mylist[index].title),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      width: MediaQuery.of(context).size.width - 70,
                      color: Colors.grey.withOpacity(.1),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 100),
                            child: Text(
                              "this data is deleted",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: CheckboxListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text("${mylist[index].title}"),
                          subtitle: Text(
                              "${mylist[index].discription}, ${mylist[index].ischecked.toString()}"),
                          value: mylist[index].ischecked,
                          onChanged: (bool? value) {
                            setState(() {
                              mylist[index].ischecked = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
