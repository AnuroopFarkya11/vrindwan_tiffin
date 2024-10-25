import 'package:vrindavantiffin/src/core/models/address_model.dart';

enum AddressStatus { initial, loading, loaded, failed }

class AddressState {
  final AddressStatus status;
  final Address? address;
  final String? message;

  const AddressState({required this.status, this.address, this.message});

  AddressState copyWith(
      {AddressStatus? status, Address? address, String? message}) {
    return AddressState(
        status: status ?? this.status,
        address: address ?? this.address,
        message: message ?? this.message);
  }
}
