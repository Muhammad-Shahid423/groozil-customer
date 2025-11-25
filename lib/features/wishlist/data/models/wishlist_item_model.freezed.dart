// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishlistItemModel {

 String get id; String get wishlistId; String get productId; String get priceWhenAdded; String get currentPrice; DateTime get addedAt; String? get notes; int get priority; bool get notifyOnDiscount; bool get notifyOnStock; ProductModel? get product;
/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishlistItemModelCopyWith<WishlistItemModel> get copyWith => _$WishlistItemModelCopyWithImpl<WishlistItemModel>(this as WishlistItemModel, _$identity);

  /// Serializes this WishlistItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.wishlistId, wishlistId) || other.wishlistId == wishlistId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.priceWhenAdded, priceWhenAdded) || other.priceWhenAdded == priceWhenAdded)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.notifyOnDiscount, notifyOnDiscount) || other.notifyOnDiscount == notifyOnDiscount)&&(identical(other.notifyOnStock, notifyOnStock) || other.notifyOnStock == notifyOnStock)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,wishlistId,productId,priceWhenAdded,currentPrice,addedAt,notes,priority,notifyOnDiscount,notifyOnStock,product);

@override
String toString() {
  return 'WishlistItemModel(id: $id, wishlistId: $wishlistId, productId: $productId, priceWhenAdded: $priceWhenAdded, currentPrice: $currentPrice, addedAt: $addedAt, notes: $notes, priority: $priority, notifyOnDiscount: $notifyOnDiscount, notifyOnStock: $notifyOnStock, product: $product)';
}


}

/// @nodoc
abstract mixin class $WishlistItemModelCopyWith<$Res>  {
  factory $WishlistItemModelCopyWith(WishlistItemModel value, $Res Function(WishlistItemModel) _then) = _$WishlistItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String wishlistId, String productId, String priceWhenAdded, String currentPrice, DateTime addedAt, String? notes, int priority, bool notifyOnDiscount, bool notifyOnStock, ProductModel? product
});


$ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$WishlistItemModelCopyWithImpl<$Res>
    implements $WishlistItemModelCopyWith<$Res> {
  _$WishlistItemModelCopyWithImpl(this._self, this._then);

  final WishlistItemModel _self;
  final $Res Function(WishlistItemModel) _then;

/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? wishlistId = null,Object? productId = null,Object? priceWhenAdded = null,Object? currentPrice = null,Object? addedAt = null,Object? notes = freezed,Object? priority = null,Object? notifyOnDiscount = null,Object? notifyOnStock = null,Object? product = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,wishlistId: null == wishlistId ? _self.wishlistId : wishlistId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,priceWhenAdded: null == priceWhenAdded ? _self.priceWhenAdded : priceWhenAdded // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,notifyOnDiscount: null == notifyOnDiscount ? _self.notifyOnDiscount : notifyOnDiscount // ignore: cast_nullable_to_non_nullable
as bool,notifyOnStock: null == notifyOnStock ? _self.notifyOnStock : notifyOnStock // ignore: cast_nullable_to_non_nullable
as bool,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,
  ));
}
/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [WishlistItemModel].
extension WishlistItemModelPatterns on WishlistItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishlistItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishlistItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishlistItemModel value)  $default,){
final _that = this;
switch (_that) {
case _WishlistItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishlistItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _WishlistItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String wishlistId,  String productId,  String priceWhenAdded,  String currentPrice,  DateTime addedAt,  String? notes,  int priority,  bool notifyOnDiscount,  bool notifyOnStock,  ProductModel? product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishlistItemModel() when $default != null:
return $default(_that.id,_that.wishlistId,_that.productId,_that.priceWhenAdded,_that.currentPrice,_that.addedAt,_that.notes,_that.priority,_that.notifyOnDiscount,_that.notifyOnStock,_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String wishlistId,  String productId,  String priceWhenAdded,  String currentPrice,  DateTime addedAt,  String? notes,  int priority,  bool notifyOnDiscount,  bool notifyOnStock,  ProductModel? product)  $default,) {final _that = this;
switch (_that) {
case _WishlistItemModel():
return $default(_that.id,_that.wishlistId,_that.productId,_that.priceWhenAdded,_that.currentPrice,_that.addedAt,_that.notes,_that.priority,_that.notifyOnDiscount,_that.notifyOnStock,_that.product);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String wishlistId,  String productId,  String priceWhenAdded,  String currentPrice,  DateTime addedAt,  String? notes,  int priority,  bool notifyOnDiscount,  bool notifyOnStock,  ProductModel? product)?  $default,) {final _that = this;
switch (_that) {
case _WishlistItemModel() when $default != null:
return $default(_that.id,_that.wishlistId,_that.productId,_that.priceWhenAdded,_that.currentPrice,_that.addedAt,_that.notes,_that.priority,_that.notifyOnDiscount,_that.notifyOnStock,_that.product);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WishlistItemModel implements WishlistItemModel {
  const _WishlistItemModel({required this.id, required this.wishlistId, required this.productId, required this.priceWhenAdded, required this.currentPrice, required this.addedAt, this.notes, this.priority = 0, this.notifyOnDiscount = false, this.notifyOnStock = false, this.product});
  factory _WishlistItemModel.fromJson(Map<String, dynamic> json) => _$WishlistItemModelFromJson(json);

@override final  String id;
@override final  String wishlistId;
@override final  String productId;
@override final  String priceWhenAdded;
@override final  String currentPrice;
@override final  DateTime addedAt;
@override final  String? notes;
@override@JsonKey() final  int priority;
@override@JsonKey() final  bool notifyOnDiscount;
@override@JsonKey() final  bool notifyOnStock;
@override final  ProductModel? product;

/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishlistItemModelCopyWith<_WishlistItemModel> get copyWith => __$WishlistItemModelCopyWithImpl<_WishlistItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishlistItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishlistItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.wishlistId, wishlistId) || other.wishlistId == wishlistId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.priceWhenAdded, priceWhenAdded) || other.priceWhenAdded == priceWhenAdded)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.notifyOnDiscount, notifyOnDiscount) || other.notifyOnDiscount == notifyOnDiscount)&&(identical(other.notifyOnStock, notifyOnStock) || other.notifyOnStock == notifyOnStock)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,wishlistId,productId,priceWhenAdded,currentPrice,addedAt,notes,priority,notifyOnDiscount,notifyOnStock,product);

@override
String toString() {
  return 'WishlistItemModel(id: $id, wishlistId: $wishlistId, productId: $productId, priceWhenAdded: $priceWhenAdded, currentPrice: $currentPrice, addedAt: $addedAt, notes: $notes, priority: $priority, notifyOnDiscount: $notifyOnDiscount, notifyOnStock: $notifyOnStock, product: $product)';
}


}

/// @nodoc
abstract mixin class _$WishlistItemModelCopyWith<$Res> implements $WishlistItemModelCopyWith<$Res> {
  factory _$WishlistItemModelCopyWith(_WishlistItemModel value, $Res Function(_WishlistItemModel) _then) = __$WishlistItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String wishlistId, String productId, String priceWhenAdded, String currentPrice, DateTime addedAt, String? notes, int priority, bool notifyOnDiscount, bool notifyOnStock, ProductModel? product
});


@override $ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class __$WishlistItemModelCopyWithImpl<$Res>
    implements _$WishlistItemModelCopyWith<$Res> {
  __$WishlistItemModelCopyWithImpl(this._self, this._then);

  final _WishlistItemModel _self;
  final $Res Function(_WishlistItemModel) _then;

/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? wishlistId = null,Object? productId = null,Object? priceWhenAdded = null,Object? currentPrice = null,Object? addedAt = null,Object? notes = freezed,Object? priority = null,Object? notifyOnDiscount = null,Object? notifyOnStock = null,Object? product = freezed,}) {
  return _then(_WishlistItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,wishlistId: null == wishlistId ? _self.wishlistId : wishlistId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,priceWhenAdded: null == priceWhenAdded ? _self.priceWhenAdded : priceWhenAdded // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,notifyOnDiscount: null == notifyOnDiscount ? _self.notifyOnDiscount : notifyOnDiscount // ignore: cast_nullable_to_non_nullable
as bool,notifyOnStock: null == notifyOnStock ? _self.notifyOnStock : notifyOnStock // ignore: cast_nullable_to_non_nullable
as bool,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,
  ));
}

/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
