import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/local_storage/models/todo.dart';
import 'package:hive/hive.dart';

class TodoController extends ChangeNotifier {
  final todoBox = Hive.box<Todo>('todos');

  late List<Map> _todos;

  UnmodifiableListView get list => UnmodifiableListView(_todos);

  TodoController() {
    loadTodos();
  }

  void loadTodos() {
    _todos = [];
    todoBox.toMap().forEach((key, value) {
      _todos.add({'id': key, 'todo': value});
    });
    print(_todos);
    notifyListeners();
  }

  void add(Todo todo) {
    if (_todos.any((e) => e['todo'].title == todo.title)) {
    } else {
      _todos.add({'id': todoBox.add(todo), 'todo': todo});
      notifyListeners();
    }
  }

  void remove(index) async {
    await todoBox.delete(_todos.removeAt(index));
    notifyListeners();
  }

  void update(Todo todo) {
    int index = _todos.indexWhere((e) => e['todo'].title == todo.title);
    todoBox.put(_todos[index]['id'], todo);
    _todos[index]['todo'] = todo;
    notifyListeners();
  }

  // List<Todo> get list = box;
}
