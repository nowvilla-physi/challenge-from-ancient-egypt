// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mystery_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MysteryItem _$MysteryItemFromJson(Map<String, dynamic> json) {
  return _MysteryItem.fromJson(json);
}

/// @nodoc
class _$MysteryItemTearOff {
  const _$MysteryItemTearOff();

  _MysteryItem call(
      {required int id,
      required String kind,
      required bool isResolved,
      required String imagePath}) {
    return _MysteryItem(
      id: id,
      kind: kind,
      isResolved: isResolved,
      imagePath: imagePath,
    );
  }

  MysteryItem fromJson(Map<String, Object?> json) {
    return MysteryItem.fromJson(json);
  }
}

/// @nodoc
const $MysteryItem = _$MysteryItemTearOff();

/// @nodoc
mixin _$MysteryItem {
  int get id => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  bool get isResolved => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MysteryItemCopyWith<MysteryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MysteryItemCopyWith<$Res> {
  factory $MysteryItemCopyWith(
          MysteryItem value, $Res Function(MysteryItem) then) =
      _$MysteryItemCopyWithImpl<$Res>;
  $Res call({int id, String kind, bool isResolved, String imagePath});
}

/// @nodoc
class _$MysteryItemCopyWithImpl<$Res> implements $MysteryItemCopyWith<$Res> {
  _$MysteryItemCopyWithImpl(this._value, this._then);

  final MysteryItem _value;
  // ignore: unused_field
  final $Res Function(MysteryItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? kind = freezed,
    Object? isResolved = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      isResolved: isResolved == freezed
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MysteryItemCopyWith<$Res>
    implements $MysteryItemCopyWith<$Res> {
  factory _$MysteryItemCopyWith(
          _MysteryItem value, $Res Function(_MysteryItem) then) =
      __$MysteryItemCopyWithImpl<$Res>;
  @override
  $Res call({int id, String kind, bool isResolved, String imagePath});
}

/// @nodoc
class __$MysteryItemCopyWithImpl<$Res> extends _$MysteryItemCopyWithImpl<$Res>
    implements _$MysteryItemCopyWith<$Res> {
  __$MysteryItemCopyWithImpl(
      _MysteryItem _value, $Res Function(_MysteryItem) _then)
      : super(_value, (v) => _then(v as _MysteryItem));

  @override
  _MysteryItem get _value => super._value as _MysteryItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? kind = freezed,
    Object? isResolved = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_MysteryItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      isResolved: isResolved == freezed
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MysteryItem with DiagnosticableTreeMixin implements _MysteryItem {
  const _$_MysteryItem(
      {required this.id,
      required this.kind,
      required this.isResolved,
      required this.imagePath});

  factory _$_MysteryItem.fromJson(Map<String, dynamic> json) =>
      _$$_MysteryItemFromJson(json);

  @override
  final int id;
  @override
  final String kind;
  @override
  final bool isResolved;
  @override
  final String imagePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MysteryItem(id: $id, kind: $kind, isResolved: $isResolved, imagePath: $imagePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MysteryItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('kind', kind))
      ..add(DiagnosticsProperty('isResolved', isResolved))
      ..add(DiagnosticsProperty('imagePath', imagePath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MysteryItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.kind, kind) &&
            const DeepCollectionEquality()
                .equals(other.isResolved, isResolved) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(kind),
      const DeepCollectionEquality().hash(isResolved),
      const DeepCollectionEquality().hash(imagePath));

  @JsonKey(ignore: true)
  @override
  _$MysteryItemCopyWith<_MysteryItem> get copyWith =>
      __$MysteryItemCopyWithImpl<_MysteryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MysteryItemToJson(this);
  }
}

abstract class _MysteryItem implements MysteryItem {
  const factory _MysteryItem(
      {required int id,
      required String kind,
      required bool isResolved,
      required String imagePath}) = _$_MysteryItem;

  factory _MysteryItem.fromJson(Map<String, dynamic> json) =
      _$_MysteryItem.fromJson;

  @override
  int get id;
  @override
  String get kind;
  @override
  bool get isResolved;
  @override
  String get imagePath;
  @override
  @JsonKey(ignore: true)
  _$MysteryItemCopyWith<_MysteryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
