import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetDefaultAddressUseCase implements UseCase<void, SetDefaultAddressParams> {
  SetDefaultAddressUseCase(this._repository);
  final AddressRepository _repository;

  @override
  Future<Either<Failure, void>> call(SetDefaultAddressParams params) {
    return _repository.setDefaultAddress(params.id);
  }
}

class SetDefaultAddressParams extends Equatable {
  const SetDefaultAddressParams({required this.id});
  
  final String id;

  @override
  List<Object?> get props => [id];
}
