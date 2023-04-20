import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/todoModel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'listItem.dart';
import 'todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void doNothing(context) {}

  void goToUpdatePage(context, todo) async {
    await Navigator.pushNamed(context, '/create-update',
        arguments: {'todo': todo});
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: todoList.map((td) => ListItem(todo: td)).toList(),
    // );
    // return ListView.builder(
    //     itemCount: todoList.length,
    //     itemBuilder: (context, index) {
    //       return ListItem(todo: todoList[index]);
    //     });
    return Consumer<TodoModel>(builder: (context, todo, child) {
      return ListView.builder(
          itemCount: todo.items.length,
          itemBuilder: (context, index) {
            Todo currentItem = todo.items[index];
            return Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        todo.remove(index);
                      },
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        goToUpdatePage(context, currentItem);
                      },
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                  ],
                ),
                child: ListItem(todo: currentItem));
          });
    });
  }
}
