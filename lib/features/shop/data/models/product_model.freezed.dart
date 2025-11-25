// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 String get id; String get sku; String get nameEn; String get nameAr; String get categoryId; String get price; int get stock; String get unit; DateTime get createdAt; DateTime get updatedAt; String? get descriptionEn; String? get descriptionAr; String? get subcategoryId; String? get partnerStoreId; String? get comparePrice; String? get brand; List<String>? get images; bool get isFeatured; bool get isActive; String get rating; int get reviewCount; CategoryModel? get category; CategoryModel? get subcategory;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.subcategoryId, subcategoryId) || other.subcategoryId == subcategoryId)&&(identical(other.partnerStoreId, partnerStoreId) || other.partnerStoreId == partnerStoreId)&&(identical(other.comparePrice, comparePrice) || other.comparePrice == comparePrice)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sku,nameEn,nameAr,categoryId,price,stock,unit,createdAt,updatedAt,descriptionEn,descriptionAr,subcategoryId,partnerStoreId,comparePrice,brand,const DeepCollectionEquality().hash(images),isFeatured,isActive,rating,reviewCount,category,subcategory]);

@override
String toString() {
  return 'ProductModel(id: $id, sku: $sku, nameEn: $nameEn, nameAr: $nameAr, categoryId: $categoryId, price: $price, stock: $stock, unit: $unit, createdAt: $createdAt, updatedAt: $updatedAt, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, subcategoryId: $subcategoryId, partnerStoreId: $partnerStoreId, comparePrice: $comparePrice, brand: $brand, images: $images, isFeatured: $isFeatured, isActive: $isActive, rating: $rating, reviewCount: $reviewCount, category: $category, subcategory: $subcategory)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 String id, String sku, String nameEn, String nameAr, String categoryId, String price, int stock, String unit, DateTime createdAt, DateTime updatedAt, String? descriptionEn, String? descriptionAr, String? subcategoryId, String? partnerStoreId, String? comparePrice, String? brand, List<String>? images, bool isFeatured, bool isActive, String rating, int reviewCount, CategoryModel? category, CategoryModel? subcategory
});


$CategoryModelCopyWith<$Res>? get category;$CategoryModelCopyWith<$Res>? get subcategory;

}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? nameEn = null,Object? nameAr = null,Object? categoryId = null,Object? price = null,Object? stock = null,Object? unit = null,Object? createdAt = null,Object? updatedAt = null,Object? descriptionEn = freezed,Object? descriptionAr = freezed,Object? subcategoryId = freezed,Object? partnerStoreId = freezed,Object? comparePrice = freezed,Object? brand = freezed,Object? images = freezed,Object? isFeatured = null,Object? isActive = null,Object? rating = null,Object? reviewCount = null,Object? category = freezed,Object? subcategory = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameAr: null == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionAr: freezed == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String?,subcategoryId: freezed == subcategoryId ? _self.subcategoryId : subcategoryId // ignore: cast_nullable_to_non_nullable
as String?,partnerStoreId: freezed == partnerStoreId ? _self.partnerStoreId : partnerStoreId // ignore: cast_nullable_to_non_nullable
as String?,comparePrice: freezed == comparePrice ? _self.comparePrice : comparePrice // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,subcategory: freezed == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get subcategory {
    if (_self.subcategory == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.subcategory!, (value) {
    return _then(_self.copyWith(subcategory: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sku,  String nameEn,  String nameAr,  String categoryId,  String price,  int stock,  String unit,  DateTime createdAt,  DateTime updatedAt,  String? descriptionEn,  String? descriptionAr,  String? subcategoryId,  String? partnerStoreId,  String? comparePrice,  String? brand,  List<String>? images,  bool isFeatured,  bool isActive,  String rating,  int reviewCount,  CategoryModel? category,  CategoryModel? subcategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.sku,_that.nameEn,_that.nameAr,_that.categoryId,_that.price,_that.stock,_that.unit,_that.createdAt,_that.updatedAt,_that.descriptionEn,_that.descriptionAr,_that.subcategoryId,_that.partnerStoreId,_that.comparePrice,_that.brand,_that.images,_that.isFeatured,_that.isActive,_that.rating,_that.reviewCount,_that.category,_that.subcategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sku,  String nameEn,  String nameAr,  String categoryId,  String price,  int stock,  String unit,  DateTime createdAt,  DateTime updatedAt,  String? descriptionEn,  String? descriptionAr,  String? subcategoryId,  String? partnerStoreId,  String? comparePrice,  String? brand,  List<String>? images,  bool isFeatured,  bool isActive,  String rating,  int reviewCount,  CategoryModel? category,  CategoryModel? subcategory)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.sku,_that.nameEn,_that.nameAr,_that.categoryId,_that.price,_that.stock,_that.unit,_that.createdAt,_that.updatedAt,_that.descriptionEn,_that.descriptionAr,_that.subcategoryId,_that.partnerStoreId,_that.comparePrice,_that.brand,_that.images,_that.isFeatured,_that.isActive,_that.rating,_that.reviewCount,_that.category,_that.subcategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sku,  String nameEn,  String nameAr,  String categoryId,  String price,  int stock,  String unit,  DateTime createdAt,  DateTime updatedAt,  String? descriptionEn,  String? descriptionAr,  String? subcategoryId,  String? partnerStoreId,  String? comparePrice,  String? brand,  List<String>? images,  bool isFeatured,  bool isActive,  String rating,  int reviewCount,  CategoryModel? category,  CategoryModel? subcategory)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.sku,_that.nameEn,_that.nameAr,_that.categoryId,_that.price,_that.stock,_that.unit,_that.createdAt,_that.updatedAt,_that.descriptionEn,_that.descriptionAr,_that.subcategoryId,_that.partnerStoreId,_that.comparePrice,_that.brand,_that.images,_that.isFeatured,_that.isActive,_that.rating,_that.reviewCount,_that.category,_that.subcategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel extends ProductModel {
  const _ProductModel({required this.id, required this.sku, required this.nameEn, required this.nameAr, required this.categoryId, required this.price, required this.stock, required this.unit, required this.createdAt, required this.updatedAt, this.descriptionEn, this.descriptionAr, this.subcategoryId, this.partnerStoreId, this.comparePrice, this.brand, final  List<String>? images, this.isFeatured = false, this.isActive = true, this.rating = '0.00', this.reviewCount = 0, this.category, this.subcategory}): _images = images,super._();
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  String id;
@override final  String sku;
@override final  String nameEn;
@override final  String nameAr;
@override final  String categoryId;
@override final  String price;
@override final  int stock;
@override final  String unit;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? descriptionEn;
@override final  String? descriptionAr;
@override final  String? subcategoryId;
@override final  String? partnerStoreId;
@override final  String? comparePrice;
@override final  String? brand;
 final  List<String>? _images;
@override List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool isFeatured;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  String rating;
@override@JsonKey() final  int reviewCount;
@override final  CategoryModel? category;
@override final  CategoryModel? subcategory;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.subcategoryId, subcategoryId) || other.subcategoryId == subcategoryId)&&(identical(other.partnerStoreId, partnerStoreId) || other.partnerStoreId == partnerStoreId)&&(identical(other.comparePrice, comparePrice) || other.comparePrice == comparePrice)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sku,nameEn,nameAr,categoryId,price,stock,unit,createdAt,updatedAt,descriptionEn,descriptionAr,subcategoryId,partnerStoreId,comparePrice,brand,const DeepCollectionEquality().hash(_images),isFeatured,isActive,rating,reviewCount,category,subcategory]);

@override
String toString() {
  return 'ProductModel(id: $id, sku: $sku, nameEn: $nameEn, nameAr: $nameAr, categoryId: $categoryId, price: $price, stock: $stock, unit: $unit, createdAt: $createdAt, updatedAt: $updatedAt, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, subcategoryId: $subcategoryId, partnerStoreId: $partnerStoreId, comparePrice: $comparePrice, brand: $brand, images: $images, isFeatured: $isFeatured, isActive: $isActive, rating: $rating, reviewCount: $reviewCount, category: $category, subcategory: $subcategory)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String sku, String nameEn, String nameAr, String categoryId, String price, int stock, String unit, DateTime createdAt, DateTime updatedAt, String? descriptionEn, String? descriptionAr, String? subcategoryId, String? partnerStoreId, String? comparePrice, String? brand, List<String>? images, bool isFeatured, bool isActive, String rating, int reviewCount, CategoryModel? category, CategoryModel? subcategory
});


@override $CategoryModelCopyWith<$Res>? get category;@override $CategoryModelCopyWith<$Res>? get subcategory;

}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? nameEn = null,Object? nameAr = null,Object? categoryId = null,Object? price = null,Object? stock = null,Object? unit = null,Object? createdAt = null,Object? updatedAt = null,Object? descriptionEn = freezed,Object? descriptionAr = freezed,Object? subcategoryId = freezed,Object? partnerStoreId = freezed,Object? comparePrice = freezed,Object? brand = freezed,Object? images = freezed,Object? isFeatured = null,Object? isActive = null,Object? rating = null,Object? reviewCount = null,Object? category = freezed,Object? subcategory = freezed,}) {
  return _then(_ProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameAr: null == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionAr: freezed == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String?,subcategoryId: freezed == subcategoryId ? _self.subcategoryId : subcategoryId // ignore: cast_nullable_to_non_nullable
as String?,partnerStoreId: freezed == partnerStoreId ? _self.partnerStoreId : partnerStoreId // ignore: cast_nullable_to_non_nullable
as String?,comparePrice: freezed == comparePrice ? _self.comparePrice : comparePrice // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,subcategory: freezed == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get subcategory {
    if (_self.subcategory == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.subcategory!, (value) {
    return _then(_self.copyWith(subcategory: value));
  });
}
}

// dart format on
