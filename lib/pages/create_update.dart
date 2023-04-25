import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/local_storage/models/todo.dart';
import 'package:todo/local_storage/contoller/todo_controller.dart';

class CreateUpdatePage extends StatefulWidget {
  const CreateUpdatePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and6
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CreateUpdatePage> createState() => _CreateUpdatePageState();
}

class _CreateUpdatePageState extends State<CreateUpdatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  Todo? currentTodo;
  Map<dynamic, dynamic> data = {};

  @override
  void initState() {
    Provider.of<TodoController>(context, listen: false)
        .setSavable(false, false);

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  void shouldSave(str) {
    if (titleController.text.isNotEmpty &&
        textController.text.isNotEmpty &&
        (titleController.text != currentTodo?.title ||
            textController.text != currentTodo?.text)) {
      Provider.of<TodoController>(context, listen: false).setSavable(true);
    } else {
      Provider.of<TodoController>(context, listen: false).setSavable(false);
    }
  }

  void _addTodo() {
    currentTodo = Todo(title: titleController.text, text: textController.text);
    Provider.of<TodoController>(context, listen: false).add(currentTodo!);
    FocusScope.of(context).unfocus();
  }

  void _updateTodo() {
    currentTodo!.update(titleController.text, textController.text);
    Provider.of<TodoController>(context, listen: false).update(currentTodo!);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    if (args != null) {
      data = data.isNotEmpty
          ? data
          : ModalRoute.of(context)!.settings.arguments as Map;
      currentTodo = data['todo'];
      titleController.text = currentTodo!.title;
      textController.text = currentTodo!.text;
    }

    return Scaffold(
      appBar: AppBar(title: Text(currentTodo != null ? "Update" : "Create")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: <Widget>[
          Flexible(
              child: TextField(
            controller: titleController,
            onChanged: shouldSave,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter the Title',
            ),
          )),
          const Divider(color: Colors.black),
          Flexible(
              child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 3,
            controller: textController,
            onChanged: shouldSave,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter the Description',
            ),
          ))

          // TextField(
          //     // decoration: InputDecoration(
          //     // border: InputBorder.none,
          //     // labelText: 'Enter Name',
          //     // hintText: 'Enter Your Name'),
          //     )
          // defaultFormField(
          //   controller: titleController,
          //   type: TextInputType.text,
          //   validate: (String value) {
          //     if (value.isEmpty) {
          //       return 'title must not be Empty';
          //     } else {
          //       return null;
          //     }
          //   },
          //   label: 'Task Title',
          //   prefix: Icons.title,
          // ),
        ]),
      ),
      floatingActionButton: Consumer<TodoController>(
          builder: (context, todo, child) => ElevatedButton(
              onPressed: todo.savable
                  ? (currentTodo != null ? _updateTodo : _addTodo)
                  : null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                      (todo.savable
                              ? Theme.of(context).appBarTheme.iconTheme?.color
                              : Theme.of(context).scaffoldBackgroundColor)
                          as Color),
                  shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(
                      side: BorderSide(
                          width: 2.0,
                          color: todo.savable
                              ? const Color(0xff867964)
                              : const Color(0xffE0C9A6))))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 30.0),
                child: Icon(
                  Icons.save,
                  color: todo.savable
                      ? const Color(0xffF0E4D3)
                      : const Color(0xffE0C9A6),
                ),
              ))), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
