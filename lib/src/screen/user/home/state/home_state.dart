import 'package:vrindavantiffin/src/core/models/item_model.dart';

enum HomeStatus { initial, loading, failed, loaded }

class HomeState {
  HomeStatus status;
  List<FoodItem>? items;
  Map<String, List<FoodItem>>? categoricalItems;
  String? message;

  HomeState(
      {required this.status, this.items, this.categoricalItems, this.message});

  HomeState copyWith(
      {HomeStatus? status,
      List<FoodItem>? items,
      Map<String, List<FoodItem>>? categoricalItems,
      String? message}) {
    return HomeState(
        status: status ?? this.status,
        items: items ?? this.items,
        categoricalItems: categoricalItems ?? this.categoricalItems,
        message: message ?? this.message);
  }
}
