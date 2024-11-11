import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/models/order_model.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/screen/user/order/provider/order_provider.dart';
import 'package:vrindavantiffin/src/screen/user/order/state/order_state.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_loader.dart';
import 'package:vrindavantiffin/src/widgets/custom_status_indicator.dart';

class OrderPlacedScreen extends ConsumerStatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  ConsumerState<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends ConsumerState<OrderPlacedScreen> {
  late OrderState orderState;

  @override
  Widget build(BuildContext context) {
    orderState = ref.watch(orderProvider);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    OrderStatus status = orderState.status;

    return Container(
      padding: 20.padding,
      width: double.infinity,
      child: Column(
        children: [
          _buildLoader(),
          Spacer(),
          CustomElevatedButton(
            onPressed: () {
              context.pushReplacementNamed(AppRoutes.orderTrack.name);
            },
            text: "Track Order",
            buttonStyle: CustomButtonStyles.fillOrangeATL51,
          )
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar();
  }

  _buildLoader() {
    _mapOrderStatusToStatus(orderState.status);
    return StatusIndicator(
      key: StatusIndicator.statusKey,
      message: "Hang tight! We’re placing your order...",
    );
  }

  _buildContent() {
    return Text(
      "Hang tight! We’re placing your order...",
      style: CustomTextStyle.titleMediumRobotoExtraBold,
    );
  }

  void _mapOrderStatusToStatus(OrderStatus orderStatus) {
    switch (orderStatus) {
      case OrderStatus.loading:
        StatusIndicator.updateStatus(Status.loading,
            message: "Hang tight! We’re placing your orderrrrr...");
        break;
      case OrderStatus.loaded:
        StatusIndicator.updateStatus(Status.success,
            message: "Order placed! You’re all set! 🎉");
        break;
      case OrderStatus.failed:
        StatusIndicator.updateStatus(Status.error,
            message: "Oops! Looks like there was an issue placing your order.");
        break;
      default:
        {
          StatusIndicator.updateStatus(Status.loading);
          break;
        }
    }
  }
}
