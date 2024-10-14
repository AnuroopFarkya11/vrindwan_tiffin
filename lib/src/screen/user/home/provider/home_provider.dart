import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/screen/user/home/repository/home_repository.dart';
import 'package:vrindavantiffin/src/screen/user/home/service/home_service.dart';
import 'package:vrindavantiffin/src/screen/user/home/state/home_state.dart';

/// Logger
final _logger = Logger("HomeProvider");

/// Provider
final homeProvider = StateNotifierProvider<HomeProvider,HomeState>((ref) {
  final repo = HomeService();
  return HomeProvider(repo);
});

/// Implementation
class HomeProvider extends StateNotifier<HomeState> {
  HomeService service;

  HomeProvider(this.service) : super(HomeState(status: HomeStatus.initial)) {
    getItems();
  }


  Future<void> getItems() async {
    state = state.copyWith(status: HomeStatus.loading);
    try {
      List<FoodItem> items = await service.fetchItems();
      _logger.log('Items fetched: ${items.length}');
      state = state.copyWith(status: HomeStatus.loaded, items: items);
    } catch (e) {
      _logger.log("getItems exceptions : $e");
      state = state.copyWith(status: HomeStatus.failed, message: e.toString());
    }
  }
}
