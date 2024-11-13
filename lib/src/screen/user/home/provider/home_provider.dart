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
final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
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
      var categoricalItems = _getItemWithCategory(items);
      var taggedItems = _getItemWithTagging(items);
      _logger.log("Categorical items : ${categoricalItems}");
      _logger.log("Tagged items : ${taggedItems}");
      state = state.copyWith(
          status: HomeStatus.loaded,
          items: items,
          categoricalItems: categoricalItems,
        taggedItems: taggedItems
      );
    } catch (e) {
      _logger.log("getItems exceptions : $e");
      state = state.copyWith(status: HomeStatus.failed, message: e.toString());
    }
  }

  Map<String, List<FoodItem>> _getItemWithCategory(List<FoodItem> list) {
    _logger.log("_getItemWithCategory invoked");

    Map<String, List<FoodItem>> categoricalItems = {};

    if (list == null || list.isEmpty) {
      _logger.log("List is null or empty");
      return categoricalItems;
    }

    list.forEach((item) {
      var category = item.category;
      if (category != null) {
        if (categoricalItems.containsKey(category)) {
          categoricalItems[category]?.add(item);
        } else {
          categoricalItems[category] = [item];
        }
      } else {
        _logger.log("Item has a null category: ${item.name}");
      }
    });

    return categoricalItems;
  }

  Map<String, List<FoodItem>> _getItemWithTagging(List<FoodItem> list) {
    Map<String, List<FoodItem>> taggedItems = {};

    if (list == null || list.isEmpty) {
      return taggedItems;
    }

    list.forEach((item) {
      List<String> tags = item.tags ?? [];
      if (tags.isNotEmpty) {
        tags.forEach((tag) {
          if (taggedItems.containsKey(tag)) {
            taggedItems[tag]?.add(item);
          } else {
            taggedItems[tag] = [item];
          }
        });
      } else {
        _logger.log("Item has a null tags: ${item.name}");
      }
    });

    return taggedItems;
  }
}
