import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/network/handlers/error_handler.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RequestHandler {

  RequestHandler(this._errorHandler);
  
  final ErrorHandler _errorHandler;

  /// Handle a single API request
  Future<Either<Failure, T>> handle<T>(
    Future<T> Function() request,
  ) async {
    try {
      final result = await request();
      return Right(result);
    } on Exception catch (e, stackTrace) {
      debugPrint('❌ 🔴 Request Error: $e');
      if (kDebugMode) {
        debugPrint('📍 Stack Trace: $stackTrace');
      }
      return Left(_errorHandler.handle(e));
    }
  }

  /// Handle multiple requests in parallel
  Future<Either<Failure, List<T>>> handleMultiple<T>(
      List<Future<T> Function()> requests,
      ) async {
    try {
      final results = await Future.wait(
        requests.map((request) => request()),
      );
      return Right(results);
    } on Exception catch (e, stackTrace) {
      debugPrint('❌ 🔴 Multiple Requests Error: $e');
      if (kDebugMode) {
        debugPrint('📍 Stack Trace: $stackTrace');
      }
      return Left(_errorHandler.handle(e));
    }
  }

  /// Handle request with retry logic
  Future<Either<Failure, T>> handleWithRetry<T>(
      Future<T> Function() request, {
        int maxRetries = 3,
        Duration delay = const Duration(seconds: 1),
      }) async {
    var attempt = 0;

    while (attempt < maxRetries) {
      try {
        final result = await request();
        return Right(result);
      } on Exception catch (e) {
        attempt++;

        if (attempt >= maxRetries) {
          debugPrint('❌ 🔴 Request failed after $maxRetries attempts: $e');
          return Left(_errorHandler.handle(e));
        }

        debugPrint('⚠️ Request failed (attempt $attempt/$maxRetries), retrying...');
        await Future<void>.delayed(delay * attempt);
      }
    }

    return const Left(UnknownFailure('Request failed after maximum retries'));
  }
}
