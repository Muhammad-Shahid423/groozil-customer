import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    bool? success,
    int? statusCode,
    String? message,
    String? error,
    String? timestamp,
    String? path,
    T? data,
    Map<String, dynamic>? pagination,
    List<String>? errors,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @Default(0) int page,
    @Default(0) int limit,
    @Default(0) int total,
    @Default(0) int totalPages,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}
