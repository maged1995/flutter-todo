import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  Todo({required this.title, required this.text, this.isChecked = false});

  @HiveField(0)
  String title;

  @HiveField(1)
  String text;

  @HiveField(2)
  bool isChecked;

  setIsChecked(value) {
    isChecked = value;
  }

  update(title, text) {
    this.title = title;
    this.text = text;
  }
}
