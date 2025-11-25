// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WishlistItem {

 String get id; String get wishlistId; String get productId; double get priceWhenAdded; double get currentPrice; DateTime get addedAt; String? get notes; int get priority; bool get notifyOnDiscount; bool get notifyOnStock; Product? get product;
/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishlistItemCopyWith<WishlistItem> get copyWith => _$WishlistItemCopyWithImpl<WishlistItem>(this as WishlistItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.wishlistId, wishlistId) || other.wishlistId == wishlistId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.priceWhenAdded, priceWhenAdded) || other.priceWhenAdded == priceWhenAdded)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.notifyOnDiscount, notifyOnDiscount) || other.notifyOnDiscount == notifyOnDiscount)&&(identical(other.notifyOnStock, notifyOnStock) || other.notifyOnStock == notifyOnStock)&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,id,wishlistId,productId,priceWhenAdded,currentPrice,addedAt,notes,priority,notifyOnDiscount,notifyOnStock,product);

@override
String toString() {
  return 'WishlistItem(id: $id, wishlistId: $wishlistId, productId: $productId, priceWhenAdded: $priceWhenAdded, currentPrice: $currentPrice, addedAt: $addedAt, notes: $notes, priority: $priority, notifyOnDiscount: $notifyOnDiscount, notifyOnStock: $notifyOnStock, product: $product)';
}


}

/// @nodoc
abstract mixin class $WishlistItemCopyWith<$Res>  {
  factory $WishlistItemCopyWith(WishlistItem value, $Res Function(WishlistItem) _then) = _$WishlistItemCopyWithImpl;
@useResult
$Res call({
 String id, String wishlistId, String productId, double priceWhenAdded, double currentPrice, DateTime addedAt, String? notes, int priority, bool notifyOnDiscount, bool notifyOnStock, Product? product
});


$ProductCopyWith<$Res>? get product;

}
/// @nodoc
class _$WishlistItemCopyWithImpl<$Res>
    implements $WishlistItemCopyWith<$Res> {
  _$WishlistItemCopyWithImpl(this._self, this._then);

  final WishlistItem _self;
  final $Res Function(WishlistItem) _then;

/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? wishlistId = null,Object? productId = null,Object? priceWhenAdded = null,Object? currentPrice = null,Object? addedAt = null,Object? notes = freezed,Object? priority = null,Object? notifyOnDiscount = null,Object? notifyOnStock = null,Object? product = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,wishlistId: null == wishlistId ? _self.wishlistId : wishlistId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,priceWhenAdded: null == priceWhenAdded ? _self.priceWhenAdded : priceWhenAdded // ignore: cast_nullable_to_non_nullable
as double,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,notifyOnDiscount: null == notifyOnDiscount ? _self.notifyOnDiscount : notifyOnDiscount // ignore: cast_nullable_to_non_nullable
as bool,notifyOnStock: null == notifyOnStock ? _self.notifyOnStock : notifyOnStock // ignore: cast_nullable_to_non_nullable
as bool,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,
  ));
}
/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [WishlistItem].
extension WishlistItemPatterns on WishlistItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishlistItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishlistItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishlistItem value)  $default,){
final _that = this;
switch (_that) {
case _WishlistItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishlistItem value)?  $default,){
final _that = this;
switch (_that) {
case _WishlistItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String wishlistId,  String productId,  double priceWhenAdded,  double currentPrice,  DateTime addedAt,  String? notes,  int priority,  bool notifyOnDiscount,  bool notifyOnStock,  Product? product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishlistItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String wishlistId,  String productId,  double priceWhenAdded,  double currentPrice,  DateTime addedAt,  String? notes,  int priority,  bool notifyOnDiscount,  bool notifyOnStock,  Product? product)  $default,) {final _that = this;
switch (_that) {
case _WishlistItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String wishlistId,  String productId,  double priceWhenAdded,  double currentPrice,  DateTime addedAt,  String? notes,  int priority,  bool notifyOnDiscount,  bool notifyOnStock,  Product? product)?  $default,) {final _that = this;
switch (_that) {
case _WishlistItem() when $default != null:
return $default(_that.id,_that.wishlistId,_that.productId,_that.priceWhenAdded,_that.currentPrice,_that.addedAt,_that.notes,_that.priority,_that.notifyOnDiscount,_that.notifyOnStock,_that.product);case _:
  return null;

}
}

}

/// @nodoc


class _WishlistItem extends WishlistItem {
  const _WishlistItem({required this.id, required this.wishlistId, required this.productId, required this.priceWhenAdded, required this.currentPrice, required this.addedAt, this.notes, this.priority = 0, this.notifyOnDiscount = false, this.notifyOnStock = false, this.product}): super._();
  

@override final  String id;
@override final  String wishlistId;
@override final  String productId;
@override final  double priceWhenAdded;
@override final  double currentPrice;
@override final  DateTime addedAt;
@override final  String? notes;
@override@JsonKey() final  int priority;
@override@JsonKey() final  bool notifyOnDiscount;
@override@JsonKey() final  bool notifyOnStock;
@override final  Product? product;

/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishlistItemCopyWith<_WishlistItem> get copyWith => __$WishlistItemCopyWithImpl<_WishlistItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishlistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.wishlistId, wishlistId) || other.wishlistId == wishlistId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.priceWhenAdded, priceWhenAdded) || other.priceWhenAdded == priceWhenAdded)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.notifyOnDiscount, notifyOnDiscount) || other.notifyOnDiscount == notifyOnDiscount)&&(identical(other.notifyOnStock, notifyOnStock) || other.notifyOnStock == notifyOnStock)&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,id,wishlistId,productId,priceWhenAdded,currentPrice,addedAt,notes,priority,notifyOnDiscount,notifyOnStock,product);

@override
String toString() {
  return 'WishlistItem(id: $id, wishlistId: $wishlistId, productId: $productId, priceWhenAdded: $priceWhenAdded, currentPrice: $currentPrice, addedAt: $addedAt, notes: $notes, priority: $priority, notifyOnDiscount: $notifyOnDiscount, notifyOnStock: $notifyOnStock, product: $product)';
}


}

/// @nodoc
abstract mixin class _$WishlistItemCopyWith<$Res> implements $WishlistItemCopyWith<$Res> {
  factory _$WishlistItemCopyWith(_WishlistItem value, $Res Function(_WishlistItem) _then) = __$WishlistItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String wishlistId, String productId, double priceWhenAdded, double currentPrice, DateTime addedAt, String? notes, int priority, bool notifyOnDiscount, bool notifyOnStock, Product? product
});


@override $ProductCopyWith<$Res>? get product;

}
/// @nodoc
class __$WishlistItemCopyWithImpl<$Res>
    implements _$WishlistItemCopyWith<$Res> {
  __$WishlistItemCopyWithImpl(this._self, this._then);

  final _WishlistItem _self;
  final $Res Function(_WishlistItem) _then;

/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? wishlistId = null,Object? productId = null,Object? priceWhenAdded = null,Object? currentPrice = null,Object? addedAt = null,Object? notes = freezed,Object? priority = null,Object? notifyOnDiscount = null,Object? notifyOnStock = null,Object? product = freezed,}) {
  return _then(_WishlistItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,wishlistId: null == wishlistId ? _self.wishlistId : wishlistId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,priceWhenAdded: null == priceWhenAdded ? _self.priceWhenAdded : priceWhenAdded // ignore: cast_nullable_to_non_nullable
as double,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,notifyOnDiscount: null == notifyOnDiscount ? _self.notifyOnDiscount : notifyOnDiscount // ignore: cast_nullable_to_non_nullable
as bool,notifyOnStock: null == notifyOnStock ? _self.notifyOnStock : notifyOnStock // ignore: cast_nullable_to_non_nullable
as bool,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,
  ));
}

/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
