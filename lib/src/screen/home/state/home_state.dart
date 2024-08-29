enum HomeStatus { initial, loading, failed, loaded }

class HomeState {
  HomeStatus status;
  String? message;

  HomeState({required this.status, this.message});

  HomeState copyWith({HomeStatus? status, String? message}) {
    return HomeState(
        status: status ?? this.status, message: message ?? this.message);
  }
}
