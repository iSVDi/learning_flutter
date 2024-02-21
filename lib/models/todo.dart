import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';


@freezed
class ToDo with _$ToDo {
  factory ToDo({
    required final String title,
    @Default(false) bool isDone,
  }) = _ToDo;

}

