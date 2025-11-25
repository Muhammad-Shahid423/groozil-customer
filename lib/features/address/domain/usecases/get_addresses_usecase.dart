import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAddressesUseCase implements UseCase<List<Address>, NoParams> {
  GetAddressesUseCase(this._repository);
  final AddressRepository _repository;

  @override
  Future<Either<Failure, List<Address>>> call(NoParams params) {
    return _repository.getAddresses();
  }
}
