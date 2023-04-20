import 'package:flutter/material.dart';
import 'todo.dart';

class ListItem extends StatefulWidget {
  final Todo todo;

  const ListItem({Key? key, required this.todo}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(widget.todo.title),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(widget.todo.text)
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Checkbox(
                  checkColor: Colors.white,
                  // fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: widget.todo.isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.todo.setIsChecked(value);
                    });
                  },
                ),
              )
            ],
          )),
    );
  }
}
