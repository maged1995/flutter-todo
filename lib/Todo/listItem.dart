import 'package:flutter/material.dart';
import 'todo.dart';

class ListItem extends StatelessWidget {
  final Todo todo;

  const ListItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(todo.title),
            const SizedBox(
              width: 50.0,
              height: 5.0,
            ),
            Text(todo.text)
          ],
        ),
      ),
    );
  }
}
