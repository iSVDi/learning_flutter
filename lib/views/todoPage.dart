import "package:flutter/material.dart";
import "package:flutter_application_1/cubit/todo.state.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_application_1/cubit/todo_cubit.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/views/todoItem.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(title: const Text('ToDo')),
          body: _getBody(context),
          floatingActionButton: _getFloatingButtons(context));
    });
  }

  Widget _getBody(BuildContext context) {
    if (context.read<ToDoCubit>().isPresentAlertDialog) {
      return _getAlertDialog(context);
    }
    return Center(child: _getListTodos(context));
  }

  AlertDialog _getAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Input your task"),
      content: Container(
        width: 100,
        child: TextField(
          onSubmitted: (String? value) {
            //ToDo implement repository and validator
            if (value != null && value.isNotEmpty) {
              var newTodo = ToDo(title: value);
              context.read<ToDoCubit>().addToDo(newTodo);
            }
          },
        ),
      ),
    );
  }

  ListView _getListTodos(BuildContext context) {
    return ListView(
        children: context.read<ToDoCubit>().state.todoList.map((todo) {
      return ToDoItem(todo);
    }).toList());
  }

  Widget? _getFloatingButtons(BuildContext context) {
    if (context.read<ToDoCubit>().isPresentAlertDialog) {
      return null;
    }
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.read<ToDoCubit>().updatePresentAlertDialog());
  }
}


