import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class Todo {
  String title;
  bool isDone = false;
  Todo(this.title);
}

void main() {
  runApp(MaterialApp(
      home: ToDoList([
    Todo("1"),
    Todo("2"),
    Todo("3"),
    Todo("4"),
    Todo("5"),
    Todo("6"),
    Todo("7"),
    Todo("8"),
    Todo("9"),
    Todo("10")
  ])));
}

class ToDoList extends StatefulWidget {
  List<Todo> todos = [];

  ToDoList(this.todos, {super.key});

  @override
  State<ToDoList> createState() => _TodoListState();
}

class _TodoListState extends State<ToDoList> {
  bool isPresentAlertDialog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(),
        body: _getBody(),
        floatingActionButton: _getAddNewTodoButton());
  }

  void sortTodos() {
    setState(() {
      widget.todos.sort((a, b) {
        if (a.isDone && !b.isDone) {
          return 1; // b come before a
        }
        return -1; // a come before b
      });
    });
  }

  void insertNewTodo(Todo todo) {
    var indexFirstDoneTodo =
        widget.todos.indexWhere((element) => element.isDone);

    // there isn't done todo
    if (indexFirstDoneTodo == -1) {
      widget.todos.add(todo);
    } else {
      widget.todos.insert(indexFirstDoneTodo, todo);
    }
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Center(
        child: Text("ToDos"),
      ),
    );
  }

  Widget _getBody() {
    if (isPresentAlertDialog) {
      return AlertDialog(
        title: const Text("Input your task"),
        content: _getAlertDialog(),
      );
    }
    return _getListTodos();
  }

  Container _getAlertDialog() {
    return Container(
      width: 100,
      child: TextField(
        onSubmitted: (String? value) {
          setState(() {
            if (value != null) {
              insertNewTodo(Todo(value));
            }
            isPresentAlertDialog = false;
          });
        },
      ),
    );
  }

  ListView _getListTodos() {
    return ListView(
        children: widget.todos.map((todo) {
      return ToDoItem(todo, sortTodos);
    }).toList());
  }

  ElevatedButton _getAddNewTodoButton() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            isPresentAlertDialog = true;
          });
        },
        child: const Text("+"));
  }
}

class ToDoItem extends StatefulWidget {
  final Todo data;
  final Function handleChangeCompleteState;
  const ToDoItem(this.data, this.handleChangeCompleteState, {super.key});

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [_getCheckBox(), _getTextWidget()]);
  }

  Checkbox _getCheckBox() {
    return Checkbox(
        checkColor: Colors.blue,
        value: widget.data.isDone,
        onChanged: (bool? value) {
          setState(() {
            widget.data.isDone = value ?? false;
            widget.handleChangeCompleteState();
          });
        });
  }

  Text _getTextWidget() {
    var style = widget.data.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;
    return Text(widget.data.title, style: style);
  }
}


