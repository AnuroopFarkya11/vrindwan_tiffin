enum AddressStatus { initial, loading, loaded,failed }

class AddressState {
  final AddressStatus status;
  final String? message;

  const AddressState({required this.status, this.message});

  AddressState copyWith({AddressStatus? status, String? message}) {
    return AddressState(
        status: status ?? this.status, message: message ?? this.message);
  }
}
