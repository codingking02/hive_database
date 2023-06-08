import 'package:hive_flutter/hive_flutter.dart';
part 'model_data_task.g.dart';

@HiveType(typeId: 9)
class Datas {
  @HiveField(9)
  String title;
  @HiveField(10)
  String discription;
  @HiveField(11)
  bool ischecked = false;
  Datas({
    required this.title,
    required this.discription,
  });
}
