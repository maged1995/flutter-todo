import 'package:flutter/material.dart';
import 'listItem.dart';
import 'todo.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todoList = [
    Todo(title: "LOL", text: 'Laugh Out Loud'),
    Todo(title: "WTF", text: 'Welcome to Facebook')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: todoList.map((td) => ListItem(todo: td)).toList(),
    );
  }
}
