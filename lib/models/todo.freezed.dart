// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ToDo {
  String get title => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoCopyWith<ToDo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoCopyWith<$Res> {
  factory $ToDoCopyWith(ToDo value, $Res Function(ToDo) then) =
      _$ToDoCopyWithImpl<$Res, ToDo>;
  @useResult
  $Res call({String title, bool isDone});
}

/// @nodoc
class _$ToDoCopyWithImpl<$Res, $Val extends ToDo>
    implements $ToDoCopyWith<$Res> {
  _$ToDoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isDone = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoImplCopyWith<$Res> implements $ToDoCopyWith<$Res> {
  factory _$$ToDoImplCopyWith(
          _$ToDoImpl value, $Res Function(_$ToDoImpl) then) =
      __$$ToDoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, bool isDone});
}

/// @nodoc
class __$$ToDoImplCopyWithImpl<$Res>
    extends _$ToDoCopyWithImpl<$Res, _$ToDoImpl>
    implements _$$ToDoImplCopyWith<$Res> {
  __$$ToDoImplCopyWithImpl(_$ToDoImpl _value, $Res Function(_$ToDoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isDone = null,
  }) {
    return _then(_$ToDoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToDoImpl implements _ToDo {
  _$ToDoImpl({required this.title, this.isDone = false});

  @override
  final String title;
  @override
  @JsonKey()
  final bool isDone;

  @override
  String toString() {
    return 'ToDo(title: $title, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, isDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoImplCopyWith<_$ToDoImpl> get copyWith =>
      __$$ToDoImplCopyWithImpl<_$ToDoImpl>(this, _$identity);
}

abstract class _ToDo implements ToDo {
  factory _ToDo({required final String title, final bool isDone}) = _$ToDoImpl;

  @override
  String get title;
  @override
  bool get isDone;
  @override
  @JsonKey(ignore: true)
  _$$ToDoImplCopyWith<_$ToDoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
