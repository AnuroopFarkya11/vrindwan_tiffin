import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/models/order_model.dart';
import 'package:vrindavantiffin/src/screen/user/cart/cart_screen.dart';
import 'package:vrindavantiffin/src/screen/user/cart/model/cart_entry.dart';
import 'package:vrindavantiffin/src/screen/user/cart/provider/cart_provider.dart';
import 'package:vrindavantiffin/src/screen/user/cart/state/cart_state.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/provider/address_provider.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/state/address_state.dart';
import 'package:vrindavantiffin/src/screen/user/order/service/order_service.dart';
import 'package:vrindavantiffin/src/screen/user/order/state/order_state.dart';

final _logger = Logger("OrderProvider");


final orderProvider = StateNotifierProvider<OrderProvider, OrderState>((ref) {
  final cartState = ref.watch(cartProvider);
  final addressState = ref.watch(addressProvider);
  return OrderProvider(cartState: cartState, addressState: addressState);
});

class OrderProvider extends StateNotifier<OrderState> {
  final CartState cartState;
  final AddressState addressState;
  final OrderService service = OrderService();

  OrderProvider({required this.cartState, required this.addressState})
      : super(OrderState(status: OrderStatus.initial));

  Future<void> placeOrder() async {
    try {
      if (cartState.status == CartStatus.filled &&
          addressState.status == AddressStatus.loaded) {
        state = state.copyWith(status: OrderStatus.loading);

        List<CartEntry> entries = cartState.entries!;
        Address address = addressState.address!;
        double total = cartState.total!;


        _logger.log("Entries : ${entries[0].toJson()}");
        _logger.log("Address : ${address.toJson()}");


        Order order = Order(
            foodItems: entries,
            deliveryAddress: address,
            totalAmount: total,
            paymentMethod: "CASH",
            paymentStatus: "PENDING");

        _logger.log(order.toJson().toString());


        await service.placeOrder(order: order);
        state = state.copyWith(status: OrderStatus.loaded);
      }
    } catch (e,s) {
      _logger.error(Exception("$e$s"));
      state = state.copyWith(status: OrderStatus.failed, message: e.toString());
    }
  }

  void changeState(){
    state = state.copyWith(status: OrderStatus.loaded);
  }

}
