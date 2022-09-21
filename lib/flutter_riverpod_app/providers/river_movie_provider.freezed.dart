// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'river_movie_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RiverMovieState {
  List<Movies> get movies => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RiverMovieStateCopyWith<RiverMovieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiverMovieStateCopyWith<$Res> {
  factory $RiverMovieStateCopyWith(
          RiverMovieState value, $Res Function(RiverMovieState) then) =
      _$RiverMovieStateCopyWithImpl<$Res>;
  $Res call({List<Movies> movies, bool isLoading});
}

/// @nodoc
class _$RiverMovieStateCopyWithImpl<$Res>
    implements $RiverMovieStateCopyWith<$Res> {
  _$RiverMovieStateCopyWithImpl(this._value, this._then);

  final RiverMovieState _value;
  // ignore: unused_field
  final $Res Function(RiverMovieState) _then;

  @override
  $Res call({
    Object? movies = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      movies: movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movies>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RiverMovieStateCopyWith<$Res>
    implements $RiverMovieStateCopyWith<$Res> {
  factory _$$_RiverMovieStateCopyWith(
          _$_RiverMovieState value, $Res Function(_$_RiverMovieState) then) =
      __$$_RiverMovieStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Movies> movies, bool isLoading});
}

/// @nodoc
class __$$_RiverMovieStateCopyWithImpl<$Res>
    extends _$RiverMovieStateCopyWithImpl<$Res>
    implements _$$_RiverMovieStateCopyWith<$Res> {
  __$$_RiverMovieStateCopyWithImpl(
      _$_RiverMovieState _value, $Res Function(_$_RiverMovieState) _then)
      : super(_value, (v) => _then(v as _$_RiverMovieState));

  @override
  _$_RiverMovieState get _value => super._value as _$_RiverMovieState;

  @override
  $Res call({
    Object? movies = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_RiverMovieState(
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movies>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RiverMovieState extends _RiverMovieState {
  const _$_RiverMovieState(
      {final List<Movies> movies = const [], this.isLoading = true})
      : _movies = movies,
        super._();

  final List<Movies> _movies;
  @override
  @JsonKey()
  List<Movies> get movies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'RiverMovieState(movies: $movies, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RiverMovieState &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_RiverMovieStateCopyWith<_$_RiverMovieState> get copyWith =>
      __$$_RiverMovieStateCopyWithImpl<_$_RiverMovieState>(this, _$identity);
}

abstract class _RiverMovieState extends RiverMovieState {
  const factory _RiverMovieState(
      {final List<Movies> movies, final bool isLoading}) = _$_RiverMovieState;
  const _RiverMovieState._() : super._();

  @override
  List<Movies> get movies;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_RiverMovieStateCopyWith<_$_RiverMovieState> get copyWith =>
      throw _privateConstructorUsedError;
}
