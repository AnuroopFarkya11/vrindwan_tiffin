import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/widget/address_card_info.dart';
import 'package:vrindavantiffin/src/screen/user/order/widget/order_tracker.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: _buildAppBar(), body: _buildBody()),
    );
  }

  _buildAppBar() {
    return AppBar(
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
                _buildIDandAmt(),
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
    return Text("Wed, 28 Oct",style: CustomTextStyle.titleSmallProximaNovaBlueGray80002,);
  }

  _buildIDandAmt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Order ID: 12324',style: CustomTextStyle.titleSmallProximaNovaBlueGray80002,), Text("AMT: Rs. 123",style: CustomTextStyle.titleSmallProximaNovaBlueGray80002,)],
    );
  }

  _buildETA() {
    return Text("ETA : 15 MINS",style: CustomTextStyle.titleLargeBluegray80002,);
  }

  _buildAddressCard() {
    return AddressCardWithArrow(address: Address());
  }

  _buildCancelOrderBtn() {
    return CustomElevatedButton(text: "Cancel Order",buttonStyle: CustomButtonStyles.fillOrangeATL10,);
  }
}
