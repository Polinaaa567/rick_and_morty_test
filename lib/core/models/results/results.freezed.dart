// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Results {

 int? get id; String? get name; String? get status; String? get species; String? get type; String? get gender; Origin? get origin; Location? get location; String? get image; List<String>? get episode; String? get url; String? get created; bool get isFavorite;
/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultsCopyWith<Results> get copyWith => _$ResultsCopyWithImpl<Results>(this as Results, _$identity);

  /// Serializes this Results to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Results&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.episode, episode)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,origin,location,image,const DeepCollectionEquality().hash(episode),url,created,isFavorite);

@override
String toString() {
  return 'Results(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $ResultsCopyWith<$Res>  {
  factory $ResultsCopyWith(Results value, $Res Function(Results) _then) = _$ResultsCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? status, String? species, String? type, String? gender, Origin? origin, Location? location, String? image, List<String>? episode, String? url, String? created, bool isFavorite
});


$OriginCopyWith<$Res>? get origin;$LocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$ResultsCopyWithImpl<$Res>
    implements $ResultsCopyWith<$Res> {
  _$ResultsCopyWithImpl(this._self, this._then);

  final Results _self;
  final $Res Function(Results) _then;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? status = freezed,Object? species = freezed,Object? type = freezed,Object? gender = freezed,Object? origin = freezed,Object? location = freezed,Object? image = freezed,Object? episode = freezed,Object? url = freezed,Object? created = freezed,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,origin: freezed == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as Origin?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,episode: freezed == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as List<String>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OriginCopyWith<$Res>? get origin {
    if (_self.origin == null) {
    return null;
  }

  return $OriginCopyWith<$Res>(_self.origin!, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [Results].
extension ResultsPatterns on Results {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Results value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Results value)  $default,){
final _that = this;
switch (_that) {
case _Results():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Results value)?  $default,){
final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? status,  String? species,  String? type,  String? gender,  Origin? origin,  Location? location,  String? image,  List<String>? episode,  String? url,  String? created,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episode,_that.url,_that.created,_that.isFavorite);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? status,  String? species,  String? type,  String? gender,  Origin? origin,  Location? location,  String? image,  List<String>? episode,  String? url,  String? created,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _Results():
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episode,_that.url,_that.created,_that.isFavorite);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? status,  String? species,  String? type,  String? gender,  Origin? origin,  Location? location,  String? image,  List<String>? episode,  String? url,  String? created,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episode,_that.url,_that.created,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Results implements Results {
  const _Results({this.id, this.name, this.status, this.species, this.type, this.gender, this.origin, this.location, this.image, final  List<String>? episode, this.url, this.created, this.isFavorite = false}): _episode = episode;
  factory _Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? status;
@override final  String? species;
@override final  String? type;
@override final  String? gender;
@override final  Origin? origin;
@override final  Location? location;
@override final  String? image;
 final  List<String>? _episode;
@override List<String>? get episode {
  final value = _episode;
  if (value == null) return null;
  if (_episode is EqualUnmodifiableListView) return _episode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? url;
@override final  String? created;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultsCopyWith<_Results> get copyWith => __$ResultsCopyWithImpl<_Results>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Results&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._episode, _episode)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,origin,location,image,const DeepCollectionEquality().hash(_episode),url,created,isFavorite);

@override
String toString() {
  return 'Results(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ResultsCopyWith<$Res> implements $ResultsCopyWith<$Res> {
  factory _$ResultsCopyWith(_Results value, $Res Function(_Results) _then) = __$ResultsCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? status, String? species, String? type, String? gender, Origin? origin, Location? location, String? image, List<String>? episode, String? url, String? created, bool isFavorite
});


@override $OriginCopyWith<$Res>? get origin;@override $LocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$ResultsCopyWithImpl<$Res>
    implements _$ResultsCopyWith<$Res> {
  __$ResultsCopyWithImpl(this._self, this._then);

  final _Results _self;
  final $Res Function(_Results) _then;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? status = freezed,Object? species = freezed,Object? type = freezed,Object? gender = freezed,Object? origin = freezed,Object? location = freezed,Object? image = freezed,Object? episode = freezed,Object? url = freezed,Object? created = freezed,Object? isFavorite = null,}) {
  return _then(_Results(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,origin: freezed == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as Origin?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,episode: freezed == episode ? _self._episode : episode // ignore: cast_nullable_to_non_nullable
as List<String>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OriginCopyWith<$Res>? get origin {
    if (_self.origin == null) {
    return null;
  }

  return $OriginCopyWith<$Res>(_self.origin!, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
