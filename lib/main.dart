import "package:flutter/material.dart";
import 'package:flutter_application_1/block/todo_bloc.dart';
import 'package:flutter_application_1/block/todo_page.dart';
import "package:flutter_bloc/flutter_bloc.dart";

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (_) => ToDoBloc(),
      child: ToDoPage(),
    ));
  }
}
