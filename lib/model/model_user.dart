import 'package:hive/hive.dart';

part 'model_user_g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  User({required this.name, required this.email});
}
