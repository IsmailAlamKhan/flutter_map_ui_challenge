// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'adventure_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdventureItem _$AdventureItemFromJson(Map<String, dynamic> json) {
  return _AdventureItem.fromJson(json);
}

/// @nodoc
mixin _$AdventureItem {
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdventureItemCopyWith<AdventureItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdventureItemCopyWith<$Res> {
  factory $AdventureItemCopyWith(
          AdventureItem value, $Res Function(AdventureItem) then) =
      _$AdventureItemCopyWithImpl<$Res>;
  $Res call(
      {String image,
      String name,
      String location,
      String title,
      String description});
}

/// @nodoc
class _$AdventureItemCopyWithImpl<$Res>
    implements $AdventureItemCopyWith<$Res> {
  _$AdventureItemCopyWithImpl(this._value, this._then);

  final AdventureItem _value;
  // ignore: unused_field
  final $Res Function(AdventureItem) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AdventureItemCopyWith<$Res>
    implements $AdventureItemCopyWith<$Res> {
  factory _$$_AdventureItemCopyWith(
          _$_AdventureItem value, $Res Function(_$_AdventureItem) then) =
      __$$_AdventureItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String image,
      String name,
      String location,
      String title,
      String description});
}

/// @nodoc
class __$$_AdventureItemCopyWithImpl<$Res>
    extends _$AdventureItemCopyWithImpl<$Res>
    implements _$$_AdventureItemCopyWith<$Res> {
  __$$_AdventureItemCopyWithImpl(
      _$_AdventureItem _value, $Res Function(_$_AdventureItem) _then)
      : super(_value, (v) => _then(v as _$_AdventureItem));

  @override
  _$_AdventureItem get _value => super._value as _$_AdventureItem;

  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_AdventureItem(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdventureItem extends _AdventureItem {
  _$_AdventureItem(
      {required this.image,
      required this.name,
      required this.location,
      required this.title,
      required this.description})
      : super._();

  factory _$_AdventureItem.fromJson(Map<String, dynamic> json) =>
      _$$_AdventureItemFromJson(json);

  @override
  final String image;
  @override
  final String name;
  @override
  final String location;
  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'AdventureItem(image: $image, name: $name, location: $location, title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdventureItem &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_AdventureItemCopyWith<_$_AdventureItem> get copyWith =>
      __$$_AdventureItemCopyWithImpl<_$_AdventureItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdventureItemToJson(this);
  }
}

abstract class _AdventureItem extends AdventureItem {
  factory _AdventureItem(
      {required final String image,
      required final String name,
      required final String location,
      required final String title,
      required final String description}) = _$_AdventureItem;
  _AdventureItem._() : super._();

  factory _AdventureItem.fromJson(Map<String, dynamic> json) =
      _$_AdventureItem.fromJson;

  @override
  String get image => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AdventureItemCopyWith<_$_AdventureItem> get copyWith =>
      throw _privateConstructorUsedError;
}
