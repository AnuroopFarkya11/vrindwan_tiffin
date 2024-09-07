import 'package:vrindavantiffin/src/core/models/item_model.dart';

enum HomeStatus { initial, loading, failed, loaded }

class HomeState {
  HomeStatus status;
  List<FoodItem>? items;
  String? message;

  HomeState({required this.status, this.items, this.message});

  HomeState copyWith(
      {HomeStatus? status, List<FoodItem>? items, String? message}) {
    return HomeState(
        status: status ?? this.status,
        items: items ?? this.items,
        message: message ?? this.message);
  }
}
