import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_application_1/cubit/todo_cubit.dart';
import 'package:flutter_application_1/models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo data;
  const ToDoItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [_getCheckBox(context), _getTextWidget()]);
  }

  Checkbox _getCheckBox(BuildContext context) {
    return Checkbox(
        checkColor: Colors.blue,
        value: data.isDone,
        onChanged: (_) {
          context.read<ToDoCubit>().changeToDosState(data);
        });
  }

  Text _getTextWidget() {
    var style = data.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;
    return Text(data.title, style: style);
  }
}