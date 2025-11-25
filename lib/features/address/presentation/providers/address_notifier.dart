import 'package:flutter/foundation.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:groozil_app/features/address/domain/usecases/add_address_usecase.dart';
import 'package:groozil_app/features/address/domain/usecases/delete_address_usecase.dart';
import 'package:groozil_app/features/address/domain/usecases/set_default_address_usecase.dart';
import 'package:groozil_app/features/address/domain/usecases/update_address_usecase.dart';
import 'package:groozil_app/features/address/presentation/providers/address_state.dart';
import 'package:groozil_app/features/address/presentation/providers/address_usecase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_notifier.g.dart';

@Riverpod(keepAlive: true)
class AddressNotifier extends _$AddressNotifier {
  @override
  AddressState build() {
    return const AddressState.initial();
  }

  Future<void> loadAddresses() async {
    state = const AddressState.loading();

    final getAddressesUseCase = ref.read(getAddressesUseCaseProvider);
    final result = await getAddressesUseCase(NoParams());

    result.fold(
      (failure) {
        debugPrint('❌ Load addresses failed: ${failure.message}');
        state = AddressState.error(failure.message);
      },
      (addresses) {
        debugPrint('✅ Loaded ${addresses.length} addresses');
        state = AddressState.loaded(addresses);
      },
    );
  }

  Future<bool> addAddress(AddressParams params) async {
    final addAddressUseCase = ref.read(addAddressUseCaseProvider);
    final result = await addAddressUseCase(AddAddressParams(params: params));

    return result.fold(
      (failure) {
        debugPrint('❌ Add address failed: ${failure.message}');
        return false;
      },
      (address) async {
        debugPrint('✅ Address added successfully');
        await loadAddresses();
        return true;
      },
    );
  }

  Future<bool> updateAddress(String id, AddressParams params) async {
    final updateAddressUseCase = ref.read(updateAddressUseCaseProvider);
    final result = await updateAddressUseCase(
      UpdateAddressParams(id: id, params: params),
    );

    return result.fold(
      (failure) {
        debugPrint('❌ Update address failed: ${failure.message}');
        return false;
      },
      (address) async {
        debugPrint('✅ Address updated successfully');
        await loadAddresses();
        return true;
      },
    );
  }

  Future<bool> deleteAddress(String id) async {
    final deleteAddressUseCase = ref.read(deleteAddressUseCaseProvider);
    final result = await deleteAddressUseCase(DeleteAddressParams(id: id));

    return result.fold(
      (failure) {
        debugPrint('❌ Delete address failed: ${failure.message}');
        return false;
      },
      (_) async {
        debugPrint('✅ Address deleted successfully');
        await loadAddresses();
        return true;
      },
    );
  }

  Future<bool> setDefaultAddress(String id) async {
    final setDefaultAddressUseCase = ref.read(setDefaultAddressUseCaseProvider);
    final result =
        await setDefaultAddressUseCase(SetDefaultAddressParams(id: id));

    return result.fold(
      (failure) {
        debugPrint('❌ Set default address failed: ${failure.message}');
        return false;
      },
      (_) async {
        debugPrint('✅ Default address set successfully');
        await loadAddresses();
        return true;
      },
    );
  }

  Address? getDefaultAddress() {
    return state.maybeWhen(
      loaded: (addresses) {
        try {
          return addresses.firstWhere((address) => address.isDefault);
        } catch (e) {
          return addresses.isNotEmpty ? addresses.first : null;
        }
      },
      orElse: () => null,
    );
  }

  Future<void> refresh() => loadAddresses();
}
