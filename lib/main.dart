import "package:flutter/material.dart";
import 'cubit/todo_cubit.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_application_1/views/todoPage.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (_) => ToDoCubit(),
      child: ToDoPage(),
    ));
  }
}
