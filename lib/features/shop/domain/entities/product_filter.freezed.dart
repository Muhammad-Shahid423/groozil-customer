// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductFilter {

 bool? get inStock; double? get minPrice; double? get maxPrice; String? get packSize; int? get minRating; String? get sortBy; String? get categoryId;
/// Create a copy of ProductFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFilterCopyWith<ProductFilter> get copyWith => _$ProductFilterCopyWithImpl<ProductFilter>(this as ProductFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFilter&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.packSize, packSize) || other.packSize == packSize)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,inStock,minPrice,maxPrice,packSize,minRating,sortBy,categoryId);

@override
String toString() {
  return 'ProductFilter(inStock: $inStock, minPrice: $minPrice, maxPrice: $maxPrice, packSize: $packSize, minRating: $minRating, sortBy: $sortBy, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $ProductFilterCopyWith<$Res>  {
  factory $ProductFilterCopyWith(ProductFilter value, $Res Function(ProductFilter) _then) = _$ProductFilterCopyWithImpl;
@useResult
$Res call({
 bool? inStock, double? minPrice, double? maxPrice, String? packSize, int? minRating, String? sortBy, String? categoryId
});




}
/// @nodoc
class _$ProductFilterCopyWithImpl<$Res>
    implements $ProductFilterCopyWith<$Res> {
  _$ProductFilterCopyWithImpl(this._self, this._then);

  final ProductFilter _self;
  final $Res Function(ProductFilter) _then;

/// Create a copy of ProductFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inStock = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? packSize = freezed,Object? minRating = freezed,Object? sortBy = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
inStock: freezed == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,packSize: freezed == packSize ? _self.packSize : packSize // ignore: cast_nullable_to_non_nullable
as String?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as int?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFilter].
extension ProductFilterPatterns on ProductFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFilter value)  $default,){
final _that = this;
switch (_that) {
case _ProductFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFilter value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? inStock,  double? minPrice,  double? maxPrice,  String? packSize,  int? minRating,  String? sortBy,  String? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFilter() when $default != null:
return $default(_that.inStock,_that.minPrice,_that.maxPrice,_that.packSize,_that.minRating,_that.sortBy,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? inStock,  double? minPrice,  double? maxPrice,  String? packSize,  int? minRating,  String? sortBy,  String? categoryId)  $default,) {final _that = this;
switch (_that) {
case _ProductFilter():
return $default(_that.inStock,_that.minPrice,_that.maxPrice,_that.packSize,_that.minRating,_that.sortBy,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? inStock,  double? minPrice,  double? maxPrice,  String? packSize,  int? minRating,  String? sortBy,  String? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ProductFilter() when $default != null:
return $default(_that.inStock,_that.minPrice,_that.maxPrice,_that.packSize,_that.minRating,_that.sortBy,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc


class _ProductFilter extends ProductFilter {
  const _ProductFilter({this.inStock, this.minPrice, this.maxPrice, this.packSize, this.minRating, this.sortBy, this.categoryId}): super._();
  

@override final  bool? inStock;
@override final  double? minPrice;
@override final  double? maxPrice;
@override final  String? packSize;
@override final  int? minRating;
@override final  String? sortBy;
@override final  String? categoryId;

/// Create a copy of ProductFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFilterCopyWith<_ProductFilter> get copyWith => __$ProductFilterCopyWithImpl<_ProductFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFilter&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.packSize, packSize) || other.packSize == packSize)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,inStock,minPrice,maxPrice,packSize,minRating,sortBy,categoryId);

@override
String toString() {
  return 'ProductFilter(inStock: $inStock, minPrice: $minPrice, maxPrice: $maxPrice, packSize: $packSize, minRating: $minRating, sortBy: $sortBy, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ProductFilterCopyWith<$Res> implements $ProductFilterCopyWith<$Res> {
  factory _$ProductFilterCopyWith(_ProductFilter value, $Res Function(_ProductFilter) _then) = __$ProductFilterCopyWithImpl;
@override @useResult
$Res call({
 bool? inStock, double? minPrice, double? maxPrice, String? packSize, int? minRating, String? sortBy, String? categoryId
});




}
/// @nodoc
class __$ProductFilterCopyWithImpl<$Res>
    implements _$ProductFilterCopyWith<$Res> {
  __$ProductFilterCopyWithImpl(this._self, this._then);

  final _ProductFilter _self;
  final $Res Function(_ProductFilter) _then;

/// Create a copy of ProductFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inStock = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? packSize = freezed,Object? minRating = freezed,Object? sortBy = freezed,Object? categoryId = freezed,}) {
  return _then(_ProductFilter(
inStock: freezed == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,packSize: freezed == packSize ? _self.packSize : packSize // ignore: cast_nullable_to_non_nullable
as String?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as int?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
