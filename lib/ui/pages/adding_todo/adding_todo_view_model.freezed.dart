// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adding_todo_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddingTodoState {
  /// タイトル
  String get title => throw _privateConstructorUsedError;

  /// 詳細
  DueDateTime? get dueDateTime => throw _privateConstructorUsedError;

  /// Create a copy of AddingTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddingTodoStateCopyWith<AddingTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddingTodoStateCopyWith<$Res> {
  factory $AddingTodoStateCopyWith(
          AddingTodoState value, $Res Function(AddingTodoState) then) =
      _$AddingTodoStateCopyWithImpl<$Res, AddingTodoState>;
  @useResult
  $Res call({String title, DueDateTime? dueDateTime});
}

/// @nodoc
class _$AddingTodoStateCopyWithImpl<$Res, $Val extends AddingTodoState>
    implements $AddingTodoStateCopyWith<$Res> {
  _$AddingTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddingTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? dueDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueDateTime: freezed == dueDateTime
          ? _value.dueDateTime
          : dueDateTime // ignore: cast_nullable_to_non_nullable
              as DueDateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddingTodoStateImplCopyWith<$Res>
    implements $AddingTodoStateCopyWith<$Res> {
  factory _$$AddingTodoStateImplCopyWith(_$AddingTodoStateImpl value,
          $Res Function(_$AddingTodoStateImpl) then) =
      __$$AddingTodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, DueDateTime? dueDateTime});
}

/// @nodoc
class __$$AddingTodoStateImplCopyWithImpl<$Res>
    extends _$AddingTodoStateCopyWithImpl<$Res, _$AddingTodoStateImpl>
    implements _$$AddingTodoStateImplCopyWith<$Res> {
  __$$AddingTodoStateImplCopyWithImpl(
      _$AddingTodoStateImpl _value, $Res Function(_$AddingTodoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddingTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? dueDateTime = freezed,
  }) {
    return _then(_$AddingTodoStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueDateTime: freezed == dueDateTime
          ? _value.dueDateTime
          : dueDateTime // ignore: cast_nullable_to_non_nullable
              as DueDateTime?,
    ));
  }
}

/// @nodoc

class _$AddingTodoStateImpl implements _AddingTodoState {
  const _$AddingTodoStateImpl({required this.title, required this.dueDateTime});

  /// タイトル
  @override
  final String title;

  /// 詳細
  @override
  final DueDateTime? dueDateTime;

  @override
  String toString() {
    return 'AddingTodoState(title: $title, dueDateTime: $dueDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddingTodoStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dueDateTime, dueDateTime) ||
                other.dueDateTime == dueDateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, dueDateTime);

  /// Create a copy of AddingTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddingTodoStateImplCopyWith<_$AddingTodoStateImpl> get copyWith =>
      __$$AddingTodoStateImplCopyWithImpl<_$AddingTodoStateImpl>(
          this, _$identity);
}

abstract class _AddingTodoState implements AddingTodoState {
  const factory _AddingTodoState(
      {required final String title,
      required final DueDateTime? dueDateTime}) = _$AddingTodoStateImpl;

  /// タイトル
  @override
  String get title;

  /// 詳細
  @override
  DueDateTime? get dueDateTime;

  /// Create a copy of AddingTodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddingTodoStateImplCopyWith<_$AddingTodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
