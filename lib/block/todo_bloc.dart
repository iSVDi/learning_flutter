import "package:flutter_bloc/flutter_bloc.dart";

// * ToDo
class ToDo {
  String title;
  bool isDone = false;
  ToDo(this.title);
}

// * Events
sealed class ToDoEvent {
  final ToDo? todo;
  ToDoEvent({required this.todo});
}

class TapOnToDoEvent extends ToDoEvent {
  TapOnToDoEvent({required super.todo});
}

class AddToDoEvent extends ToDoEvent {
  AddToDoEvent({required super.todo});
}

class PresentCreateToDoDialogEvent extends ToDoEvent {
  PresentCreateToDoDialogEvent() : super(todo: null);
}

// * States
sealed class ToDoState {
  final List<ToDo> todos;
  ToDoState({required this.todos});
}

class InitialState extends ToDoState {
  InitialState(List<ToDo> todos) : super(todos: todos);
}

class AddToDoState extends ToDoState {
  AddToDoState(List<ToDo> todos) : super(todos: todos);
}

class TapOnToState extends ToDoState {
  TapOnToState(List<ToDo> todos) : super(todos: todos);
}

class PresentCreateToDoDialogState extends ToDoState {
  PresentCreateToDoDialogState(List<ToDo> todos) : super(todos: todos);
}

// * Bloc
class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc()
      : super(InitialState([
          ToDo("1"),
          ToDo("2"),
          ToDo("3"),
          ToDo("4"),
          ToDo("5"),
          ToDo("6"),
          ToDo("7"),
          ToDo("8"),
          ToDo("9"),
          ToDo("10")
        ])) {
    on<TapOnToDoEvent>((event, emit) {
      var tappedTodo = event.todo;
      if (tappedTodo != null) {
        _changeToDoState(tappedTodo);
        return emit(TapOnToState(state.todos));
      }
    });

    on<PresentCreateToDoDialogEvent>((event, emit) {
      return emit(PresentCreateToDoDialogState(state.todos));
    });

    on<AddToDoEvent>((event, emit) {
      var newTodo = event.todo;
      if (newTodo != null) {
        insertNewTodo(newTodo);
        return emit(InitialState(state.todos));
      }
    });
  }

  void insertNewTodo(ToDo todo) {
    var indexFirstDoneTodo =
        state.todos.indexWhere((element) => element.isDone);

    // there isn't done todo
    if (indexFirstDoneTodo == -1) {
      state.todos.add(todo);
    } else {
      state.todos.insert(indexFirstDoneTodo, todo);
    }
  }

  void _changeToDoState(ToDo toDo) {
    var index = state.todos.indexWhere((element) {
      return element.title == toDo.title;
    });
    if (index != -1) {
      state.todos[index].isDone = !state.todos[index].isDone;
      _sortTodos();
    }
  }

  void _sortTodos() {
    state.todos.sort((a, b) {
      if (a.isDone && !b.isDone) {
        return 1; // b come before a
      }
      return -1; // a come before b
    });
  }
}
