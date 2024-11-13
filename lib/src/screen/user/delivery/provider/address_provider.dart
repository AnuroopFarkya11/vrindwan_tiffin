import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/screen/auth/state/auth_state.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/service/delivery_service.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/state/address_state.dart';

final _logger = Logger('AddressProvider');

final addressProvider =
    StateNotifierProvider<AddressProvider, AddressState>((ref) {
  AuthState state = ref.watch(authProvider);
  return AddressProvider(state);
});

class AddressProvider extends StateNotifier<AddressState> {
  AuthState authStateRef;

  AddressProvider(this.authStateRef)
      : super(AddressState(status: AddressStatus.initial)) {
    getAddresses();
  }

  final AddressService service = AddressService();

  Future<void> addAddress(Address address) async {
    state = state.copyWith(status: AddressStatus.loading);
    try {
      // TODO : Store address to local storage
      address = await service.addAddress(address: address);

      state = state.copyWith(status: AddressStatus.loaded, address: address);
    } catch (e, s) {
      _logger.error(Exception("$e\n$s"));
      state = state.copyWith(status: AddressStatus.failed);
    }
  }

  Future<void> getAddresses() async {
    List<Address> userAddress = authStateRef.user.addresses ?? [];
    state = state.copyWith(addresses: userAddress);
  }

  Future<void> selectAddress(String id) async {
    Address? address = state.addresses?.firstWhere((e) => e.addressId == id);
    if (address != null) {
      state = state.copyWith(address: address,status: AddressStatus.loaded);
    }
  }

  Future<void> getUserLocation() async {
    try {
      Address? address = await service.getUserLocation();
      if(address!=null)
        {
          state = state.copyWith(address: address,status: AddressStatus.loaded);
        }
    } on Exception catch(e) {
      state = state.copyWith(status: AddressStatus.failed,message: e.toString());
    }
  }
}
