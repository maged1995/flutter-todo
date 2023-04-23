import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/local_storage/contoller/todo_controller.dart';
import '../Todo/todo_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _goToCreateTodo() async {
    await Navigator.pushNamed(context, '/create-update');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoController>(builder: (context, todo, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo Home Page"),
        ),
        body: const Center(child: TodoList()),
        floatingActionButton: ElevatedButton(
            onPressed: _goToCreateTodo,
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xffF0E4D3)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: const BorderSide(
                            width: 2.0, color: Color(0xff867964))))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: Icon(
                Icons.add,
                color: Color(0xff867964),
              ),
            )), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
