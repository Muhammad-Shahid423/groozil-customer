import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateAddressUseCase implements UseCase<Address, UpdateAddressParams> {
  UpdateAddressUseCase(this._repository);

  final AddressRepository _repository;

  @override
  Future<Either<Failure, Address>> call(UpdateAddressParams params) async {
    return _repository.updateAddress(params.id, params.params);
  }
}

class UpdateAddressParams {
  UpdateAddressParams({
    required this.id,
    required this.params,
  });

  final String id;
  final AddressParams params;
}
