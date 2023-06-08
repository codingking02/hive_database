import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_database/hive_task/screens_task/hive_screen.dart';
import 'package:hive_database/hive_task/screens_task/model_task/model_data_task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 1-location of data base
  /*Directory directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path + "/hive_data");

  /// register
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(UserAdapter());
  // 2- create database
  await Hive.openBox<Map<String, String>>("data_box1");
  await Hive.openBox<Data>("notes_data");*/
  //location of second database
  Directory appdirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appdirectory.path + "/hive_data");
  // registeer adapter
  Hive.registerAdapter(DatasAdapter());
  //create box
  await Hive.openBox<Datas>("database_hive");

  runApp(const myhive());
}

class myhive extends StatefulWidget {
  const myhive({super.key});

  @override
  State<myhive> createState() => _myhiveState();
}

class _myhiveState extends State<myhive> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hivescreen(),
    );
  }
}
