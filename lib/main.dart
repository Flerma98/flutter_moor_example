import 'package:flutter/material.dart';
import 'package:flutter_moor_example/databases/moor_database.dart';
import 'package:flutter_moor_example/pages/students_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [Provider(create: (_) => SchoolDatabase())], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moor',
        home: StudentsListPage());
  }
}

void snackMessage(
    {required final String message,
    required final BuildContext context,
    final bool isError = false}) {
  final SnackBar snackBar = SnackBar(
      duration: Duration(seconds: isError ? 1 : 3),
      backgroundColor: isError ? Colors.red[700] : Colors.green[500],
      content: Text("$message",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
