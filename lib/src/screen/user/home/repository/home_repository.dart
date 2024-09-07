import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/data/item_data.dart';

class HomeRepository {
  Future<List<FoodItem>> fetchItems() async {
    await Future.delayed(Duration(milliseconds: 500));
    return itemJsonData.map((element) => FoodItem.fromMap(element)).toList();
  }
}
