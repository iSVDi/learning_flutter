import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/cubit/todo.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoCubit extends Cubit<ToDoState> {
  bool get isPresentAlertDialog => state.isPresentAlertDialog;
  ToDoCubit()
      : super(ToDoState(todoList: [
          ToDo(title: "1"),
          ToDo(title: "2"),
          ToDo(title: "3"),
          ToDo(title: "4"),
          ToDo(title: "5"),
          ToDo(title: "6"),
          ToDo(title: "7"),
          ToDo(title: "8"),
          ToDo(title: "9"),
          ToDo(title: "10")
        ]));

  void addToDo(ToDo todo) {
    var firstNotCompleteToDoIndex = state.todoList.indexWhere((element) {
      return element.isDone == true;
    });
    if (firstNotCompleteToDoIndex != -1) {
      state.todoList.insert(firstNotCompleteToDoIndex, todo);
    } else {
      state.todoList.add(todo);
    }

    emit(ToDoState(todoList: state.todoList));
  }

  void changeToDosState(ToDo toDo) {
    var index = state.todoList.indexWhere((element) {
      return element.title == toDo.title;
    });

    if (index != -1) {
      state.todoList[index] = state.todoList[index]
          .copyWith(title: toDo.title, isDone: !toDo.isDone);
      _sortTodos();
      emit(ToDoState(todoList: state.todoList));
    }
  }

  void _sortTodos() {
    state.todoList.sort((a, b) {
      if (a.isDone && !b.isDone) {
        return 1; // b come before a
      }
      return -1; // a come before b
    });
  }

  void updatePresentAlertDialog() {
    emit(ToDoState(
        isPresentAlertDialog: !state.isPresentAlertDialog,
        todoList: state.todoList));
  }
}
