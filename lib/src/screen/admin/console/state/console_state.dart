enum ConsoleStatus { initial, loaded, failed, loading }

class ConsoleState {
  ConsoleStatus status;
  String? message;

  ConsoleState({required this.status, this.message});

  ConsoleState copyWith({ConsoleStatus? status, String? message}) {
    return ConsoleState(
        status: status ?? this.status, message: message ?? this.message);
  }
}
