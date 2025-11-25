// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerEntity {

 String get id; String get titleAr; String get titleEn; String get imageUrl; BannerType get bannerType; BannerPosition get position; BannerAction get actionType; DateTime get createdAt; DateTime get updatedAt; String? get descriptionAr; String? get descriptionEn; String? get mobileImageUrl; String? get actionValue; DateTime? get startDate; DateTime? get endDate; bool get isActive; int get sortOrder; bool get showOnHomepage; bool get showOnCategories; bool get showOnCheckout; List<String> get targetCategories; List<String> get targetUserTiers; bool get newUsersOnly; int get impressions; int get clicks; double get ctr; Map<String, dynamic>? get metadata;
/// Create a copy of BannerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerEntityCopyWith<BannerEntity> get copyWith => _$BannerEntityCopyWithImpl<BannerEntity>(this as BannerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.titleAr, titleAr) || other.titleAr == titleAr)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bannerType, bannerType) || other.bannerType == bannerType)&&(identical(other.position, position) || other.position == position)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.mobileImageUrl, mobileImageUrl) || other.mobileImageUrl == mobileImageUrl)&&(identical(other.actionValue, actionValue) || other.actionValue == actionValue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.showOnHomepage, showOnHomepage) || other.showOnHomepage == showOnHomepage)&&(identical(other.showOnCategories, showOnCategories) || other.showOnCategories == showOnCategories)&&(identical(other.showOnCheckout, showOnCheckout) || other.showOnCheckout == showOnCheckout)&&const DeepCollectionEquality().equals(other.targetCategories, targetCategories)&&const DeepCollectionEquality().equals(other.targetUserTiers, targetUserTiers)&&(identical(other.newUsersOnly, newUsersOnly) || other.newUsersOnly == newUsersOnly)&&(identical(other.impressions, impressions) || other.impressions == impressions)&&(identical(other.clicks, clicks) || other.clicks == clicks)&&(identical(other.ctr, ctr) || other.ctr == ctr)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,titleAr,titleEn,imageUrl,bannerType,position,actionType,createdAt,updatedAt,descriptionAr,descriptionEn,mobileImageUrl,actionValue,startDate,endDate,isActive,sortOrder,showOnHomepage,showOnCategories,showOnCheckout,const DeepCollectionEquality().hash(targetCategories),const DeepCollectionEquality().hash(targetUserTiers),newUsersOnly,impressions,clicks,ctr,const DeepCollectionEquality().hash(metadata)]);

@override
String toString() {
  return 'BannerEntity(id: $id, titleAr: $titleAr, titleEn: $titleEn, imageUrl: $imageUrl, bannerType: $bannerType, position: $position, actionType: $actionType, createdAt: $createdAt, updatedAt: $updatedAt, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, mobileImageUrl: $mobileImageUrl, actionValue: $actionValue, startDate: $startDate, endDate: $endDate, isActive: $isActive, sortOrder: $sortOrder, showOnHomepage: $showOnHomepage, showOnCategories: $showOnCategories, showOnCheckout: $showOnCheckout, targetCategories: $targetCategories, targetUserTiers: $targetUserTiers, newUsersOnly: $newUsersOnly, impressions: $impressions, clicks: $clicks, ctr: $ctr, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $BannerEntityCopyWith<$Res>  {
  factory $BannerEntityCopyWith(BannerEntity value, $Res Function(BannerEntity) _then) = _$BannerEntityCopyWithImpl;
@useResult
$Res call({
 String id, String titleAr, String titleEn, String imageUrl, BannerType bannerType, BannerPosition position, BannerAction actionType, DateTime createdAt, DateTime updatedAt, String? descriptionAr, String? descriptionEn, String? mobileImageUrl, String? actionValue, DateTime? startDate, DateTime? endDate, bool isActive, int sortOrder, bool showOnHomepage, bool showOnCategories, bool showOnCheckout, List<String> targetCategories, List<String> targetUserTiers, bool newUsersOnly, int impressions, int clicks, double ctr, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$BannerEntityCopyWithImpl<$Res>
    implements $BannerEntityCopyWith<$Res> {
  _$BannerEntityCopyWithImpl(this._self, this._then);

  final BannerEntity _self;
  final $Res Function(BannerEntity) _then;

/// Create a copy of BannerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleAr = null,Object? titleEn = null,Object? imageUrl = null,Object? bannerType = null,Object? position = null,Object? actionType = null,Object? createdAt = null,Object? updatedAt = null,Object? descriptionAr = freezed,Object? descriptionEn = freezed,Object? mobileImageUrl = freezed,Object? actionValue = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? isActive = null,Object? sortOrder = null,Object? showOnHomepage = null,Object? showOnCategories = null,Object? showOnCheckout = null,Object? targetCategories = null,Object? targetUserTiers = null,Object? newUsersOnly = null,Object? impressions = null,Object? clicks = null,Object? ctr = null,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleAr: null == titleAr ? _self.titleAr : titleAr // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,bannerType: null == bannerType ? _self.bannerType : bannerType // ignore: cast_nullable_to_non_nullable
as BannerType,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as BannerPosition,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as BannerAction,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,descriptionAr: freezed == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String?,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,mobileImageUrl: freezed == mobileImageUrl ? _self.mobileImageUrl : mobileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,actionValue: freezed == actionValue ? _self.actionValue : actionValue // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,showOnHomepage: null == showOnHomepage ? _self.showOnHomepage : showOnHomepage // ignore: cast_nullable_to_non_nullable
as bool,showOnCategories: null == showOnCategories ? _self.showOnCategories : showOnCategories // ignore: cast_nullable_to_non_nullable
as bool,showOnCheckout: null == showOnCheckout ? _self.showOnCheckout : showOnCheckout // ignore: cast_nullable_to_non_nullable
as bool,targetCategories: null == targetCategories ? _self.targetCategories : targetCategories // ignore: cast_nullable_to_non_nullable
as List<String>,targetUserTiers: null == targetUserTiers ? _self.targetUserTiers : targetUserTiers // ignore: cast_nullable_to_non_nullable
as List<String>,newUsersOnly: null == newUsersOnly ? _self.newUsersOnly : newUsersOnly // ignore: cast_nullable_to_non_nullable
as bool,impressions: null == impressions ? _self.impressions : impressions // ignore: cast_nullable_to_non_nullable
as int,clicks: null == clicks ? _self.clicks : clicks // ignore: cast_nullable_to_non_nullable
as int,ctr: null == ctr ? _self.ctr : ctr // ignore: cast_nullable_to_non_nullable
as double,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerEntity].
extension BannerEntityPatterns on BannerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerEntity value)  $default,){
final _that = this;
switch (_that) {
case _BannerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BannerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titleAr,  String titleEn,  String imageUrl,  BannerType bannerType,  BannerPosition position,  BannerAction actionType,  DateTime createdAt,  DateTime updatedAt,  String? descriptionAr,  String? descriptionEn,  String? mobileImageUrl,  String? actionValue,  DateTime? startDate,  DateTime? endDate,  bool isActive,  int sortOrder,  bool showOnHomepage,  bool showOnCategories,  bool showOnCheckout,  List<String> targetCategories,  List<String> targetUserTiers,  bool newUsersOnly,  int impressions,  int clicks,  double ctr,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerEntity() when $default != null:
return $default(_that.id,_that.titleAr,_that.titleEn,_that.imageUrl,_that.bannerType,_that.position,_that.actionType,_that.createdAt,_that.updatedAt,_that.descriptionAr,_that.descriptionEn,_that.mobileImageUrl,_that.actionValue,_that.startDate,_that.endDate,_that.isActive,_that.sortOrder,_that.showOnHomepage,_that.showOnCategories,_that.showOnCheckout,_that.targetCategories,_that.targetUserTiers,_that.newUsersOnly,_that.impressions,_that.clicks,_that.ctr,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titleAr,  String titleEn,  String imageUrl,  BannerType bannerType,  BannerPosition position,  BannerAction actionType,  DateTime createdAt,  DateTime updatedAt,  String? descriptionAr,  String? descriptionEn,  String? mobileImageUrl,  String? actionValue,  DateTime? startDate,  DateTime? endDate,  bool isActive,  int sortOrder,  bool showOnHomepage,  bool showOnCategories,  bool showOnCheckout,  List<String> targetCategories,  List<String> targetUserTiers,  bool newUsersOnly,  int impressions,  int clicks,  double ctr,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _BannerEntity():
return $default(_that.id,_that.titleAr,_that.titleEn,_that.imageUrl,_that.bannerType,_that.position,_that.actionType,_that.createdAt,_that.updatedAt,_that.descriptionAr,_that.descriptionEn,_that.mobileImageUrl,_that.actionValue,_that.startDate,_that.endDate,_that.isActive,_that.sortOrder,_that.showOnHomepage,_that.showOnCategories,_that.showOnCheckout,_that.targetCategories,_that.targetUserTiers,_that.newUsersOnly,_that.impressions,_that.clicks,_that.ctr,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titleAr,  String titleEn,  String imageUrl,  BannerType bannerType,  BannerPosition position,  BannerAction actionType,  DateTime createdAt,  DateTime updatedAt,  String? descriptionAr,  String? descriptionEn,  String? mobileImageUrl,  String? actionValue,  DateTime? startDate,  DateTime? endDate,  bool isActive,  int sortOrder,  bool showOnHomepage,  bool showOnCategories,  bool showOnCheckout,  List<String> targetCategories,  List<String> targetUserTiers,  bool newUsersOnly,  int impressions,  int clicks,  double ctr,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _BannerEntity() when $default != null:
return $default(_that.id,_that.titleAr,_that.titleEn,_that.imageUrl,_that.bannerType,_that.position,_that.actionType,_that.createdAt,_that.updatedAt,_that.descriptionAr,_that.descriptionEn,_that.mobileImageUrl,_that.actionValue,_that.startDate,_that.endDate,_that.isActive,_that.sortOrder,_that.showOnHomepage,_that.showOnCategories,_that.showOnCheckout,_that.targetCategories,_that.targetUserTiers,_that.newUsersOnly,_that.impressions,_that.clicks,_that.ctr,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class _BannerEntity extends BannerEntity {
  const _BannerEntity({required this.id, required this.titleAr, required this.titleEn, required this.imageUrl, required this.bannerType, required this.position, required this.actionType, required this.createdAt, required this.updatedAt, this.descriptionAr, this.descriptionEn, this.mobileImageUrl, this.actionValue, this.startDate, this.endDate, this.isActive = true, this.sortOrder = 0, this.showOnHomepage = false, this.showOnCategories = false, this.showOnCheckout = false, final  List<String> targetCategories = const [], final  List<String> targetUserTiers = const [], this.newUsersOnly = false, this.impressions = 0, this.clicks = 0, this.ctr = 0.0, final  Map<String, dynamic>? metadata}): _targetCategories = targetCategories,_targetUserTiers = targetUserTiers,_metadata = metadata,super._();
  

@override final  String id;
@override final  String titleAr;
@override final  String titleEn;
@override final  String imageUrl;
@override final  BannerType bannerType;
@override final  BannerPosition position;
@override final  BannerAction actionType;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? descriptionAr;
@override final  String? descriptionEn;
@override final  String? mobileImageUrl;
@override final  String? actionValue;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  bool showOnHomepage;
@override@JsonKey() final  bool showOnCategories;
@override@JsonKey() final  bool showOnCheckout;
 final  List<String> _targetCategories;
@override@JsonKey() List<String> get targetCategories {
  if (_targetCategories is EqualUnmodifiableListView) return _targetCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetCategories);
}

 final  List<String> _targetUserTiers;
@override@JsonKey() List<String> get targetUserTiers {
  if (_targetUserTiers is EqualUnmodifiableListView) return _targetUserTiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetUserTiers);
}

@override@JsonKey() final  bool newUsersOnly;
@override@JsonKey() final  int impressions;
@override@JsonKey() final  int clicks;
@override@JsonKey() final  double ctr;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of BannerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerEntityCopyWith<_BannerEntity> get copyWith => __$BannerEntityCopyWithImpl<_BannerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.titleAr, titleAr) || other.titleAr == titleAr)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bannerType, bannerType) || other.bannerType == bannerType)&&(identical(other.position, position) || other.position == position)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.mobileImageUrl, mobileImageUrl) || other.mobileImageUrl == mobileImageUrl)&&(identical(other.actionValue, actionValue) || other.actionValue == actionValue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.showOnHomepage, showOnHomepage) || other.showOnHomepage == showOnHomepage)&&(identical(other.showOnCategories, showOnCategories) || other.showOnCategories == showOnCategories)&&(identical(other.showOnCheckout, showOnCheckout) || other.showOnCheckout == showOnCheckout)&&const DeepCollectionEquality().equals(other._targetCategories, _targetCategories)&&const DeepCollectionEquality().equals(other._targetUserTiers, _targetUserTiers)&&(identical(other.newUsersOnly, newUsersOnly) || other.newUsersOnly == newUsersOnly)&&(identical(other.impressions, impressions) || other.impressions == impressions)&&(identical(other.clicks, clicks) || other.clicks == clicks)&&(identical(other.ctr, ctr) || other.ctr == ctr)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,titleAr,titleEn,imageUrl,bannerType,position,actionType,createdAt,updatedAt,descriptionAr,descriptionEn,mobileImageUrl,actionValue,startDate,endDate,isActive,sortOrder,showOnHomepage,showOnCategories,showOnCheckout,const DeepCollectionEquality().hash(_targetCategories),const DeepCollectionEquality().hash(_targetUserTiers),newUsersOnly,impressions,clicks,ctr,const DeepCollectionEquality().hash(_metadata)]);

@override
String toString() {
  return 'BannerEntity(id: $id, titleAr: $titleAr, titleEn: $titleEn, imageUrl: $imageUrl, bannerType: $bannerType, position: $position, actionType: $actionType, createdAt: $createdAt, updatedAt: $updatedAt, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, mobileImageUrl: $mobileImageUrl, actionValue: $actionValue, startDate: $startDate, endDate: $endDate, isActive: $isActive, sortOrder: $sortOrder, showOnHomepage: $showOnHomepage, showOnCategories: $showOnCategories, showOnCheckout: $showOnCheckout, targetCategories: $targetCategories, targetUserTiers: $targetUserTiers, newUsersOnly: $newUsersOnly, impressions: $impressions, clicks: $clicks, ctr: $ctr, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$BannerEntityCopyWith<$Res> implements $BannerEntityCopyWith<$Res> {
  factory _$BannerEntityCopyWith(_BannerEntity value, $Res Function(_BannerEntity) _then) = __$BannerEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String titleAr, String titleEn, String imageUrl, BannerType bannerType, BannerPosition position, BannerAction actionType, DateTime createdAt, DateTime updatedAt, String? descriptionAr, String? descriptionEn, String? mobileImageUrl, String? actionValue, DateTime? startDate, DateTime? endDate, bool isActive, int sortOrder, bool showOnHomepage, bool showOnCategories, bool showOnCheckout, List<String> targetCategories, List<String> targetUserTiers, bool newUsersOnly, int impressions, int clicks, double ctr, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$BannerEntityCopyWithImpl<$Res>
    implements _$BannerEntityCopyWith<$Res> {
  __$BannerEntityCopyWithImpl(this._self, this._then);

  final _BannerEntity _self;
  final $Res Function(_BannerEntity) _then;

/// Create a copy of BannerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleAr = null,Object? titleEn = null,Object? imageUrl = null,Object? bannerType = null,Object? position = null,Object? actionType = null,Object? createdAt = null,Object? updatedAt = null,Object? descriptionAr = freezed,Object? descriptionEn = freezed,Object? mobileImageUrl = freezed,Object? actionValue = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? isActive = null,Object? sortOrder = null,Object? showOnHomepage = null,Object? showOnCategories = null,Object? showOnCheckout = null,Object? targetCategories = null,Object? targetUserTiers = null,Object? newUsersOnly = null,Object? impressions = null,Object? clicks = null,Object? ctr = null,Object? metadata = freezed,}) {
  return _then(_BannerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleAr: null == titleAr ? _self.titleAr : titleAr // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,bannerType: null == bannerType ? _self.bannerType : bannerType // ignore: cast_nullable_to_non_nullable
as BannerType,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as BannerPosition,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as BannerAction,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,descriptionAr: freezed == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String?,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,mobileImageUrl: freezed == mobileImageUrl ? _self.mobileImageUrl : mobileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,actionValue: freezed == actionValue ? _self.actionValue : actionValue // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,showOnHomepage: null == showOnHomepage ? _self.showOnHomepage : showOnHomepage // ignore: cast_nullable_to_non_nullable
as bool,showOnCategories: null == showOnCategories ? _self.showOnCategories : showOnCategories // ignore: cast_nullable_to_non_nullable
as bool,showOnCheckout: null == showOnCheckout ? _self.showOnCheckout : showOnCheckout // ignore: cast_nullable_to_non_nullable
as bool,targetCategories: null == targetCategories ? _self._targetCategories : targetCategories // ignore: cast_nullable_to_non_nullable
as List<String>,targetUserTiers: null == targetUserTiers ? _self._targetUserTiers : targetUserTiers // ignore: cast_nullable_to_non_nullable
as List<String>,newUsersOnly: null == newUsersOnly ? _self.newUsersOnly : newUsersOnly // ignore: cast_nullable_to_non_nullable
as bool,impressions: null == impressions ? _self.impressions : impressions // ignore: cast_nullable_to_non_nullable
as int,clicks: null == clicks ? _self.clicks : clicks // ignore: cast_nullable_to_non_nullable
as int,ctr: null == ctr ? _self.ctr : ctr // ignore: cast_nullable_to_non_nullable
as double,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
