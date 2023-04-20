import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/Todo/todo.dart';

class TodoModel extends ChangeNotifier {
  final List<Todo> _todoList = [
    Todo(title: "LOL", text: 'Laugh Out Loud', isChecked: true),
    Todo(title: "WTF", text: 'Welcome to Facebook', isChecked: false)
  ];

  UnmodifiableListView<Todo> get items => UnmodifiableListView(_todoList);

  void add(Todo todo) {
    if (_todoList.any((e) => e.title == todo.title)) {
    } else {
      _todoList.add(todo);
      notifyListeners();
    }
  }

  void remove(index) {
    Todo removedTodo = _todoList.removeAt(index);
    notifyListeners();
  }

  void update(Todo todo) {
    _todoList[_todoList.indexWhere((e) => e.title == todo.title)] = todo;
    notifyListeners();
  }
}
