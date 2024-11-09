import 'package:vrindavantiffin/src/core/models/address_model.dart';

enum AddressStatus { initial, loading, loaded, failed }

class AddressState {
  final AddressStatus status;
  final Address? address;
  final List<Address>? addresses;
  final String? message;

  const AddressState({required this.status, this.address,this.addresses, this.message});

  AddressState copyWith(
      {AddressStatus? status, Address? address,List<Address>? addresses, String? message}) {
    return AddressState(
        status: status ?? this.status,
        address: address ?? this.address,
        addresses: addresses ?? this.addresses,
        message: message ?? this.message);
  }
}
