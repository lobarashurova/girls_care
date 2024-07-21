// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashBuildable {}

/// @nodoc
abstract class $SplashBuildableCopyWith<$Res> {
  factory $SplashBuildableCopyWith(
          SplashBuildable value, $Res Function(SplashBuildable) then) =
      _$SplashBuildableCopyWithImpl<$Res, SplashBuildable>;
}

/// @nodoc
class _$SplashBuildableCopyWithImpl<$Res, $Val extends SplashBuildable>
    implements $SplashBuildableCopyWith<$Res> {
  _$SplashBuildableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SplashBuildableImplCopyWith<$Res> {
  factory _$$SplashBuildableImplCopyWith(_$SplashBuildableImpl value,
          $Res Function(_$SplashBuildableImpl) then) =
      __$$SplashBuildableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashBuildableImplCopyWithImpl<$Res>
    extends _$SplashBuildableCopyWithImpl<$Res, _$SplashBuildableImpl>
    implements _$$SplashBuildableImplCopyWith<$Res> {
  __$$SplashBuildableImplCopyWithImpl(
      _$SplashBuildableImpl _value, $Res Function(_$SplashBuildableImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SplashBuildableImpl implements _SplashBuildable {
  const _$SplashBuildableImpl();

  @override
  String toString() {
    return 'SplashBuildable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashBuildableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _SplashBuildable implements SplashBuildable {
  const factory _SplashBuildable() = _$SplashBuildableImpl;
}

/// @nodoc
mixin _$SplashListenable {
  SplashEffect get effect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashListenableCopyWith<SplashListenable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashListenableCopyWith<$Res> {
  factory $SplashListenableCopyWith(
          SplashListenable value, $Res Function(SplashListenable) then) =
      _$SplashListenableCopyWithImpl<$Res, SplashListenable>;
  @useResult
  $Res call({SplashEffect effect});
}

/// @nodoc
class _$SplashListenableCopyWithImpl<$Res, $Val extends SplashListenable>
    implements $SplashListenableCopyWith<$Res> {
  _$SplashListenableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effect = null,
  }) {
    return _then(_value.copyWith(
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as SplashEffect,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashListenableImplCopyWith<$Res>
    implements $SplashListenableCopyWith<$Res> {
  factory _$$SplashListenableImplCopyWith(_$SplashListenableImpl value,
          $Res Function(_$SplashListenableImpl) then) =
      __$$SplashListenableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SplashEffect effect});
}

/// @nodoc
class __$$SplashListenableImplCopyWithImpl<$Res>
    extends _$SplashListenableCopyWithImpl<$Res, _$SplashListenableImpl>
    implements _$$SplashListenableImplCopyWith<$Res> {
  __$$SplashListenableImplCopyWithImpl(_$SplashListenableImpl _value,
      $Res Function(_$SplashListenableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effect = null,
  }) {
    return _then(_$SplashListenableImpl(
      null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as SplashEffect,
    ));
  }
}

/// @nodoc

class _$SplashListenableImpl implements _SplashListenable {
  const _$SplashListenableImpl(this.effect);

  @override
  final SplashEffect effect;

  @override
  String toString() {
    return 'SplashListenable(effect: $effect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashListenableImpl &&
            (identical(other.effect, effect) || other.effect == effect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, effect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashListenableImplCopyWith<_$SplashListenableImpl> get copyWith =>
      __$$SplashListenableImplCopyWithImpl<_$SplashListenableImpl>(
          this, _$identity);
}

abstract class _SplashListenable implements SplashListenable {
  const factory _SplashListenable(final SplashEffect effect) =
      _$SplashListenableImpl;

  @override
  SplashEffect get effect;
  @override
  @JsonKey(ignore: true)
  _$$SplashListenableImplCopyWith<_$SplashListenableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
