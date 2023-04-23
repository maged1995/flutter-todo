import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/local_storage/contoller/todo_controller.dart';
import 'pages/home.dart';
import 'pages/create_update.dart';
import 'local_storage/models/todo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dbLoaded = false;
  initDB() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(TodoCategoryAdapter());
    // await Hive.openBox<TodoCategory>('todo_categories');
    Hive.registerAdapter(TodoAdapter());
    await Hive.openBox<Todo>('todos');
    setState(() {
      dbLoaded = true;
    });
  }

  closeDB() async {
    await Hive.close();
  }

  @override
  initState() {
    super.initState();
    initDB();
  }

  @override
  void dispose() {
    closeDB();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return dbLoaded
        ? ChangeNotifierProvider(
            create: (context) => TodoController(),
            child: MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) =>
                    const MyHomePage(title: 'Flutter Demo Home Page'),
                '/create-update': (context) =>
                    const CreateUpdatePage(title: 'Flutter Demo Create Page'),
              },
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: Color(0xffE0C9A6),
                    iconTheme: IconThemeData(color: Color(0xff867964))),
                scaffoldBackgroundColor: const Color(0xffF0E4D3),
                primarySwatch: Colors.blue,
              ),
            ))
        : Column();
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Layout(
//         child: MaterialApp(
//             title: 'Flutter Demo',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               appBarTheme: const AppBarTheme(
//                 color: Color(0xffE0C9A6),
//               ),
//               scaffoldBackgroundColor: const Color(0xffF0E4D3),
//               primarySwatch: Colors.blue,
//             ),
//             builder: (context, child) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Expanded(child: child!),
//                 ],
//               );
//             },
//             home: const MyHomePage(title: 'Flutter Demo Home Page')));
//   }
// }
