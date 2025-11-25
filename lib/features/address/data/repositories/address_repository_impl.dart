import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/network/handlers/request_handler.dart';
import 'package:groozil_app/features/address/data/datasources/address_remote_datasource.dart';
import 'package:groozil_app/features/address/data/mappers/address_mapper.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddressRepository)
class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl(this._remoteDataSource, this._requestHandler);

  final AddressRemoteDataSource _remoteDataSource;
  final RequestHandler _requestHandler;

  @override
  Future<Either<Failure, List<Address>>> getAddresses() async {
    return _requestHandler.handle<List<Address>>(
      () async {
        final models = await _remoteDataSource.getAddresses();
        return models.map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, Address>> getAddressById(String id) async {
    return _requestHandler.handle<Address>(
      () async {
        final model = await _remoteDataSource.getAddressById(id);
        return model.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, Address>> addAddress(AddressParams params) async {
    return _requestHandler.handle<Address>(
      () async {
        final model = await _remoteDataSource.addAddress(params);
        return model.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, Address>> updateAddress(
    String id,
    AddressParams params,
  ) async {
    return _requestHandler.handle<Address>(
      () async {
        final model = await _remoteDataSource.updateAddress(id, params);
        return model.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, void>> deleteAddress(String id) async {
    return _requestHandler.handle<void>(
      () async {
        await _remoteDataSource.deleteAddress(id);
      },
    );
  }

  @override
  Future<Either<Failure, void>> setDefaultAddress(String id) async {
    return _requestHandler.handle<void>(
      () async {
        await _remoteDataSource.setDefaultAddress(id);
      },
    );
  }
}
