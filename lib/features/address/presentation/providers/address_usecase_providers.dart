import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/features/address/domain/usecases/add_address_usecase.dart';
import 'package:groozil_app/features/address/domain/usecases/delete_address_usecase.dart';
import 'package:groozil_app/features/address/domain/usecases/get_addresses_usecase.dart';
import 'package:groozil_app/features/address/domain/usecases/set_default_address_usecase.dart';
import 'package:groozil_app/features/address/domain/usecases/update_address_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_usecase_providers.g.dart';

@riverpod
GetAddressesUseCase getAddressesUseCase(Ref ref) {
  return getIt<GetAddressesUseCase>();
}

@riverpod
AddAddressUseCase addAddressUseCase(Ref ref) {
  return getIt<AddAddressUseCase>();
}

@riverpod
UpdateAddressUseCase updateAddressUseCase(Ref ref) {
  return getIt<UpdateAddressUseCase>();
}

@riverpod
DeleteAddressUseCase deleteAddressUseCase(Ref ref) {
  return getIt<DeleteAddressUseCase>();
}

@riverpod
SetDefaultAddressUseCase setDefaultAddressUseCase(Ref ref) {
  return getIt<SetDefaultAddressUseCase>();
}
