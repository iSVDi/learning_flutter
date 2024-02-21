import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application_1/models/todo.dart';
part 'todo.state.freezed.dart';

@unfreezed
class ToDoState with _$ToDoState {
  factory ToDoState(
      {@Default(false) bool isPresentAlertDialog,
      required List<ToDo> todoList}) = _ToDoState;
}
