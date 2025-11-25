// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WishlistEntity {

 String get id; String get userId; String get nameAr; String get nameEn; DateTime get createdAt; DateTime get updatedAt; bool get isDefault; bool get isPublic; List<WishlistItem> get items;
/// Create a copy of WishlistEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishlistEntityCopyWith<WishlistEntity> get copyWith => _$WishlistEntityCopyWithImpl<WishlistEntity>(this as WishlistEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,nameAr,nameEn,createdAt,updatedAt,isDefault,isPublic,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'WishlistEntity(id: $id, userId: $userId, nameAr: $nameAr, nameEn: $nameEn, createdAt: $createdAt, updatedAt: $updatedAt, isDefault: $isDefault, isPublic: $isPublic, items: $items)';
}


}

/// @nodoc
abstract mixin class $WishlistEntityCopyWith<$Res>  {
  factory $WishlistEntityCopyWith(WishlistEntity value, $Res Function(WishlistEntity) _then) = _$WishlistEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String nameAr, String nameEn, DateTime createdAt, DateTime updatedAt, bool isDefault, bool isPublic, List<WishlistItem> items
});




}
/// @nodoc
class _$WishlistEntityCopyWithImpl<$Res>
    implements $WishlistEntityCopyWith<$Res> {
  _$WishlistEntityCopyWithImpl(this._self, this._then);

  final WishlistEntity _self;
  final $Res Function(WishlistEntity) _then;

/// Create a copy of WishlistEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? nameAr = null,Object? nameEn = null,Object? createdAt = null,Object? updatedAt = null,Object? isDefault = null,Object? isPublic = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,nameAr: null == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<WishlistItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [WishlistEntity].
extension WishlistEntityPatterns on WishlistEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishlistEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishlistEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishlistEntity value)  $default,){
final _that = this;
switch (_that) {
case _WishlistEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishlistEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WishlistEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String nameAr,  String nameEn,  DateTime createdAt,  DateTime updatedAt,  bool isDefault,  bool isPublic,  List<WishlistItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishlistEntity() when $default != null:
return $default(_that.id,_that.userId,_that.nameAr,_that.nameEn,_that.createdAt,_that.updatedAt,_that.isDefault,_that.isPublic,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String nameAr,  String nameEn,  DateTime createdAt,  DateTime updatedAt,  bool isDefault,  bool isPublic,  List<WishlistItem> items)  $default,) {final _that = this;
switch (_that) {
case _WishlistEntity():
return $default(_that.id,_that.userId,_that.nameAr,_that.nameEn,_that.createdAt,_that.updatedAt,_that.isDefault,_that.isPublic,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String nameAr,  String nameEn,  DateTime createdAt,  DateTime updatedAt,  bool isDefault,  bool isPublic,  List<WishlistItem> items)?  $default,) {final _that = this;
switch (_that) {
case _WishlistEntity() when $default != null:
return $default(_that.id,_that.userId,_that.nameAr,_that.nameEn,_that.createdAt,_that.updatedAt,_that.isDefault,_that.isPublic,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _WishlistEntity extends WishlistEntity {
  const _WishlistEntity({required this.id, required this.userId, required this.nameAr, required this.nameEn, required this.createdAt, required this.updatedAt, this.isDefault = false, this.isPublic = false, final  List<WishlistItem> items = const []}): _items = items,super._();
  

@override final  String id;
@override final  String userId;
@override final  String nameAr;
@override final  String nameEn;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool isDefault;
@override@JsonKey() final  bool isPublic;
 final  List<WishlistItem> _items;
@override@JsonKey() List<WishlistItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of WishlistEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishlistEntityCopyWith<_WishlistEntity> get copyWith => __$WishlistEntityCopyWithImpl<_WishlistEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishlistEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,nameAr,nameEn,createdAt,updatedAt,isDefault,isPublic,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'WishlistEntity(id: $id, userId: $userId, nameAr: $nameAr, nameEn: $nameEn, createdAt: $createdAt, updatedAt: $updatedAt, isDefault: $isDefault, isPublic: $isPublic, items: $items)';
}


}

/// @nodoc
abstract mixin class _$WishlistEntityCopyWith<$Res> implements $WishlistEntityCopyWith<$Res> {
  factory _$WishlistEntityCopyWith(_WishlistEntity value, $Res Function(_WishlistEntity) _then) = __$WishlistEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String nameAr, String nameEn, DateTime createdAt, DateTime updatedAt, bool isDefault, bool isPublic, List<WishlistItem> items
});




}
/// @nodoc
class __$WishlistEntityCopyWithImpl<$Res>
    implements _$WishlistEntityCopyWith<$Res> {
  __$WishlistEntityCopyWithImpl(this._self, this._then);

  final _WishlistEntity _self;
  final $Res Function(_WishlistEntity) _then;

/// Create a copy of WishlistEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? nameAr = null,Object? nameEn = null,Object? createdAt = null,Object? updatedAt = null,Object? isDefault = null,Object? isPublic = null,Object? items = null,}) {
  return _then(_WishlistEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,nameAr: null == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<WishlistItem>,
  ));
}


}

// dart format on
