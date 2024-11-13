import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/utils/date_time_util.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/widget/address_card_info.dart';
import 'package:vrindavantiffin/src/screen/user/order/provider/order_provider.dart';
import 'package:vrindavantiffin/src/screen/user/order/state/order_state.dart';
import 'package:vrindavantiffin/src/screen/user/order/widget/order_tracker.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';

class OrderTrackingScreen extends ConsumerStatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends ConsumerState<OrderTrackingScreen> {
  ScrollController scrollController = ScrollController();

  late OrderState orderState;


  @override
  Widget build(BuildContext context) {
    orderState = ref.watch(orderProvider);
    return SafeArea(
      child: Scaffold(appBar: _buildAppBar(), body: _buildBody()),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Track Order',
        style: CustomTextStyle.headlineMediumPrimaryBold,
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          10.space,
          Container(
            padding: 25.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDate(),
                15.space,
                _buildIDAndAmt(),
              ],
            ),
          ),
          10.space,
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30.h,
                vertical: 16.h
              ), color: Colors.white, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildETA(),
                  20.space,
                  OrderTracker(scrollController: scrollController,),
                  _buildAddressCard(),

                  _buildCancelOrderBtn(),
                ],
              )),


        ],
      ),
    );
  }

  _buildDate() {
    String time = DateTimeUtils.formatToDayMonth(orderState.order?.ordTime??DateTime.now());
    return Text(time,style: CustomTextStyle.titleSmallProximaNovaBlueGray80002,);
  }

  _buildIDAndAmt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Order ID: ${orderState.order?.ordId??"-"}',style: CustomTextStyle.titleSmallProximaNovaBlueGray80002,), Text("AMT: Rs. ${orderState.order?.totalAmount??0}",style: CustomTextStyle.titleSmallProximaNovaBlueGray80002,)],
    );
  }

  _buildETA() {
    return Text("ETA : 15 MINS",style: CustomTextStyle.titleLargeBluegray80002,);
  }

  _buildAddressCard() {
    return AddressCardWithArrow(address: orderState.order?.deliveryAddress??Address());
  }

  _buildCancelOrderBtn() {
    return CustomElevatedButton(text: "Cancel Order",buttonStyle: CustomButtonStyles.fillOrangeATL10,margin: EdgeInsets.only(left: 50.h, right: 56.h),);
  }
}


