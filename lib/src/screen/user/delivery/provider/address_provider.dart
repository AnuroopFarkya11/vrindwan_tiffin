import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/service/delivery_service.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/state/address_state.dart';

final _logger = Logger('AddressProvider');

class AddressProvider extends StateNotifier<AddressState> {
  AddressProvider() : super(AddressState(status: AddressStatus.initial));

  final AddressService service = AddressService();

  Future<void> addAddress(Address address) async {
    state = state.copyWith(status: AddressStatus.loading);
    try {
      await service.addAddress(address: address);
      state = state.copyWith(status: AddressStatus.loaded);
    } catch (e) {
      _logger.log('Something went wrong while adding address : $e');
      state = state.copyWith(status: AddressStatus.failed);
    }
  }
}
