import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'Todo/todoList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Layout(
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Color(0xffE0C9A6),
              ),
              scaffoldBackgroundColor: const Color(0xffF0E4D3),
              primarySwatch: Colors.blue,
            ),
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: child!),
                ],
              );
            },
            home: const MyHomePage(title: 'Flutter Demo Home Page')));
  }
}

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          // child: Margin(
          //     margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          //     child: Column(children: const [
          //       TextField(
          //         decoration: InputDecoration(
          //             focusColor: Color(0xff867964),
          //             focusedBorder: UnderlineInputBorder(
          //                 borderSide:
          //                     BorderSide(width: 3, color: Color(0xff867964))),
          //             labelText: "Search",
          //             labelStyle: TextStyle(color: Color(0xff867964)),
          //             border: UnderlineInputBorder(
          //                 borderSide:
          //                     BorderSide(width: 3, color: Color(0xff867964)))),
          //       )
          //     ])),
          child: TodoList()),
      floatingActionButton: ElevatedButton(
          onPressed: _incrementCounter,
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
  }
}
