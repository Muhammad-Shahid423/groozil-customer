// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryEntity {

 String get id; String get nameEn; String get nameAr; String get icon; int get order; DateTime get createdAt; DateTime get updatedAt; String? get descriptionEn; String? get descriptionAr; String? get image; String? get parentId; bool get isActive; List<CategoryEntity>? get children; CategoryEntity? get parent;
/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<CategoryEntity> get copyWith => _$CategoryEntityCopyWithImpl<CategoryEntity>(this as CategoryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.image, image) || other.image == image)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.children, children)&&(identical(other.parent, parent) || other.parent == parent));
}


@override
int get hashCode => Object.hash(runtimeType,id,nameEn,nameAr,icon,order,createdAt,updatedAt,descriptionEn,descriptionAr,image,parentId,isActive,const DeepCollectionEquality().hash(children),parent);

@override
String toString() {
  return 'CategoryEntity(id: $id, nameEn: $nameEn, nameAr: $nameAr, icon: $icon, order: $order, createdAt: $createdAt, updatedAt: $updatedAt, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, image: $image, parentId: $parentId, isActive: $isActive, children: $children, parent: $parent)';
}


}

/// @nodoc
abstract mixin class $CategoryEntityCopyWith<$Res>  {
  factory $CategoryEntityCopyWith(CategoryEntity value, $Res Function(CategoryEntity) _then) = _$CategoryEntityCopyWithImpl;
@useResult
$Res call({
 String id, String nameEn, String nameAr, String icon, int order, DateTime createdAt, DateTime updatedAt, String? descriptionEn, String? descriptionAr, String? image, String? parentId, bool isActive, List<CategoryEntity>? children, CategoryEntity? parent
});


$CategoryEntityCopyWith<$Res>? get parent;

}
/// @nodoc
class _$CategoryEntityCopyWithImpl<$Res>
    implements $CategoryEntityCopyWith<$Res> {
  _$CategoryEntityCopyWithImpl(this._self, this._then);

  final CategoryEntity _self;
  final $Res Function(CategoryEntity) _then;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nameEn = null,Object? nameAr = null,Object? icon = null,Object? order = null,Object? createdAt = null,Object? updatedAt = null,Object? descriptionEn = freezed,Object? descriptionAr = freezed,Object? image = freezed,Object? parentId = freezed,Object? isActive = null,Object? children = freezed,Object? parent = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameAr: null == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionAr: freezed == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,children: freezed == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>?,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as CategoryEntity?,
  ));
}
/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<$Res>? get parent {
    if (_self.parent == null) {
    return null;
  }

  return $CategoryEntityCopyWith<$Res>(_self.parent!, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryEntity].
extension CategoryEntityPatterns on CategoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _CategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nameEn,  String nameAr,  String icon,  int order,  DateTime createdAt,  DateTime updatedAt,  String? descriptionEn,  String? descriptionAr,  String? image,  String? parentId,  bool isActive,  List<CategoryEntity>? children,  CategoryEntity? parent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryEntity() when $default != null:
return $default(_that.id,_that.nameEn,_that.nameAr,_that.icon,_that.order,_that.createdAt,_that.updatedAt,_that.descriptionEn,_that.descriptionAr,_that.image,_that.parentId,_that.isActive,_that.children,_that.parent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nameEn,  String nameAr,  String icon,  int order,  DateTime createdAt,  DateTime updatedAt,  String? descriptionEn,  String? descriptionAr,  String? image,  String? parentId,  bool isActive,  List<CategoryEntity>? children,  CategoryEntity? parent)  $default,) {final _that = this;
switch (_that) {
case _CategoryEntity():
return $default(_that.id,_that.nameEn,_that.nameAr,_that.icon,_that.order,_that.createdAt,_that.updatedAt,_that.descriptionEn,_that.descriptionAr,_that.image,_that.parentId,_that.isActive,_that.children,_that.parent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nameEn,  String nameAr,  String icon,  int order,  DateTime createdAt,  DateTime updatedAt,  String? descriptionEn,  String? descriptionAr,  String? image,  String? parentId,  bool isActive,  List<CategoryEntity>? children,  CategoryEntity? parent)?  $default,) {final _that = this;
switch (_that) {
case _CategoryEntity() when $default != null:
return $default(_that.id,_that.nameEn,_that.nameAr,_that.icon,_that.order,_that.createdAt,_that.updatedAt,_that.descriptionEn,_that.descriptionAr,_that.image,_that.parentId,_that.isActive,_that.children,_that.parent);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryEntity extends CategoryEntity {
  const _CategoryEntity({required this.id, required this.nameEn, required this.nameAr, required this.icon, required this.order, required this.createdAt, required this.updatedAt, this.descriptionEn, this.descriptionAr, this.image, this.parentId, this.isActive = true, final  List<CategoryEntity>? children, this.parent}): _children = children,super._();
  

@override final  String id;
@override final  String nameEn;
@override final  String nameAr;
@override final  String icon;
@override final  int order;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? descriptionEn;
@override final  String? descriptionAr;
@override final  String? image;
@override final  String? parentId;
@override@JsonKey() final  bool isActive;
 final  List<CategoryEntity>? _children;
@override List<CategoryEntity>? get children {
  final value = _children;
  if (value == null) return null;
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CategoryEntity? parent;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryEntityCopyWith<_CategoryEntity> get copyWith => __$CategoryEntityCopyWithImpl<_CategoryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.image, image) || other.image == image)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._children, _children)&&(identical(other.parent, parent) || other.parent == parent));
}


@override
int get hashCode => Object.hash(runtimeType,id,nameEn,nameAr,icon,order,createdAt,updatedAt,descriptionEn,descriptionAr,image,parentId,isActive,const DeepCollectionEquality().hash(_children),parent);

@override
String toString() {
  return 'CategoryEntity(id: $id, nameEn: $nameEn, nameAr: $nameAr, icon: $icon, order: $order, createdAt: $createdAt, updatedAt: $updatedAt, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, image: $image, parentId: $parentId, isActive: $isActive, children: $children, parent: $parent)';
}


}

/// @nodoc
abstract mixin class _$CategoryEntityCopyWith<$Res> implements $CategoryEntityCopyWith<$Res> {
  factory _$CategoryEntityCopyWith(_CategoryEntity value, $Res Function(_CategoryEntity) _then) = __$CategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String nameEn, String nameAr, String icon, int order, DateTime createdAt, DateTime updatedAt, String? descriptionEn, String? descriptionAr, String? image, String? parentId, bool isActive, List<CategoryEntity>? children, CategoryEntity? parent
});


@override $CategoryEntityCopyWith<$Res>? get parent;

}
/// @nodoc
class __$CategoryEntityCopyWithImpl<$Res>
    implements _$CategoryEntityCopyWith<$Res> {
  __$CategoryEntityCopyWithImpl(this._self, this._then);

  final _CategoryEntity _self;
  final $Res Function(_CategoryEntity) _then;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nameEn = null,Object? nameAr = null,Object? icon = null,Object? order = null,Object? createdAt = null,Object? updatedAt = null,Object? descriptionEn = freezed,Object? descriptionAr = freezed,Object? image = freezed,Object? parentId = freezed,Object? isActive = null,Object? children = freezed,Object? parent = freezed,}) {
  return _then(_CategoryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameAr: null == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionAr: freezed == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,children: freezed == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>?,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as CategoryEntity?,
  ));
}

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<$Res>? get parent {
    if (_self.parent == null) {
    return null;
  }

  return $CategoryEntityCopyWith<$Res>(_self.parent!, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}

// dart format on
