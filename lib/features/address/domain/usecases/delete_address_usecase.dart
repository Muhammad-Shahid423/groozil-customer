import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteAddressUseCase implements UseCase<void, DeleteAddressParams> {
  DeleteAddressUseCase(this._repository);
  final AddressRepository _repository;

  @override
  Future<Either<Failure, void>> call(DeleteAddressParams params) {
    return _repository.deleteAddress(params.id);
  }
}

class DeleteAddressParams extends Equatable {
  const DeleteAddressParams({required this.id});
  
  final String id;

  @override
  List<Object?> get props => [id];
}
