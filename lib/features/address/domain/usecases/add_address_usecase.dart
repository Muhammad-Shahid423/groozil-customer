import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddAddressUseCase implements UseCase<Address, AddAddressParams> {
  AddAddressUseCase(this._repository);
  final AddressRepository _repository;

  @override
  Future<Either<Failure, Address>> call(AddAddressParams params) {
    return _repository.addAddress(params.params);
  }
}

class AddAddressParams extends Equatable {
  const AddAddressParams({required this.params});
  
  final AddressParams params;

  @override
  List<Object?> get props => [params];
}
