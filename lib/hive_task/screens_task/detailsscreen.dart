import 'package:flutter/material.dart';
import 'package:hive_database/hive_task/screens_task/model_task/model_data_task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class details_screen extends StatefulWidget {
  final String title;
  final String discription;
  const details_screen(
      {super.key, required this.discription, required this.title});

  @override
  State<details_screen> createState() => _details_screenState();
}

class _details_screenState extends State<details_screen> {
  late Datas mydetails;
  late Box box;
  @override
  void initState() {
    box = Hive.box<Datas>("database_hive");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive_user_details"),
        backgroundColor: Colors.purple,
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return ListView(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Full details",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.blue.shade900, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Name   : ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.purple, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${widget.title}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Discription   : ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.purple, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${widget.discription}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
