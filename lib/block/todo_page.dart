import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'todo_bloc.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: const Text('ToDo')),
            body: _getBody(context),
            floatingActionButton: _getFloatingButtons(context));
      },
    );
  }

  Widget _getBody(BuildContext context) {
    var state = context.read<ToDoBloc>().state;
    if (state is PresentCreateToDoDialogState) {
      return _getAlertDialog(context);
    }
    return Center(child: _getListTodos(context, state));
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
              var newTodo = ToDo(value);
              context.read<ToDoBloc>().add(AddToDoEvent(todo: newTodo));
            }
          },
        ),
      ),
    );
  }

  ListView _getListTodos(BuildContext context, ToDoState state) {
    return ListView(
        children: context.read<ToDoBloc>().state.todos.map((todo) {
      return ToDoItem(todo);
    }).toList());
  }

  Widget? _getFloatingButtons(BuildContext context) {
    if (context.read<ToDoBloc>().state is PresentCreateToDoDialogState) {
      return null;
    }
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            context.read<ToDoBloc>().add(PresentCreateToDoDialogEvent()));
  }
}

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
          context.read<ToDoBloc>().add(TapOnToDoEvent(todo: data));
          ;
        });
  }

  Text _getTextWidget() {
    var style = data.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;
    return Text(data.title, style: style);
  }
}
