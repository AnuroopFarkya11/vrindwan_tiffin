enum FormStatus { initial, loaded, failed, loading }

class FormState {
  FormStatus status;
  String? message;

  FormState({required this.status, this.message});

  FormState copyWith({FormStatus? status, String? message}) {
    return FormState(
        status: status ?? this.status, message: message ?? this.message);
  }
}
