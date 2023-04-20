import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/todoModel.dart';
import 'pages/home.dart';
import 'pages/createUpdate.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => TodoModel(),
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
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
    )));

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
