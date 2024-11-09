import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/core/utils/validators_functions.dart';
import 'package:vrindavantiffin/src/data/address_data.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/provider/address_provider.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/state/address_state.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/widget/address_card.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class DeliveryAddressScreen extends ConsumerStatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  ConsumerState<DeliveryAddressScreen> createState() =>
      _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends ConsumerState<DeliveryAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final Address address = Address();
  late AddressProvider addressProviderRef;
  late AddressState addressState;
  String? _selectedAddressId;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    addressProviderRef = ref.read(addressProvider.notifier);
    addressState = ref.watch(addressProvider);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildRowContinue(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        "Delivery address",
        style: CustomTextStyle.titleLargeRobotoPrimary_1,
      ),
    );
  }

  _buildBody() {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: 22.paddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.space,
              _buildStepper(),
              24.space,
              _buildAddressList(),
              24.space,
              _buildAddNewAddress(),
              24.space
            ],
          ),
        ),
      ),
    );
  }

  _buildStepper() {
    return Container(
        width: double.maxFinite,
        child: AnotherStepper(
            iconHeight: 76.h,
            iconWidth: 65.h,
            activeIndex: 0,
            barThickness: 2,
            inverted: true,
            stepperList: [
              StepperData(
                  iconWidget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    child: CircleAvatar(
                      backgroundColor: appTheme.orangeA700,
                      child: CustomImageView(
                        imagePath: "assets/icons/marker.svg",
                        height: 25.h,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  title: StepperText("Address",
                      textStyle: CustomTextStyle.titleSmall1)),
              StepperData(
                  iconWidget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    child: CircleAvatar(
                      backgroundColor: appTheme.blueGray80001,
                      child: CustomImageView(
                        imagePath: "assets/icons/file.svg",
                        height: 25.h,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  title: StepperText("Order Summary",
                      textStyle: CustomTextStyle.bodyMediumRobotoPrimary_3)),
              StepperData(
                  iconWidget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    child: CircleAvatar(
                      backgroundColor: appTheme.blueGray80001,
                      child: CustomImageView(
                        imagePath: "assets/icons/card.svg",
                        height: 25.h,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  title: StepperText("Payment",
                      textStyle: CustomTextStyle.bodyMediumRobotoPrimary_3))
            ],
            stepperDirection: Axis.horizontal));
  }


  void _onAddressSelected(String addressId) {
    setState(() {
      _selectedAddressId = addressId; // Update selected address
    });
  }

  _buildAddressList() {
    //  List<Address> addresses = addressList.map((e){
    //   return Address.fromJson(e);
    // }).toList();
    List<Address> addresses =  addressState.addresses??[];

    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return AddressCard(
          address: addresses[index],
          selectedAddressId: _selectedAddressId,
          onSelected: _onAddressSelected,
        );
      },
    );

  }

  _buildRowContinue() {
    return Container(
      height: 70.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: BoxDecoration(color: theme.colorScheme.onError),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomElevatedButton(
            height: 50.h,
            width: 146.h,
            text: "CONTINUE".toUpperCase(),
            onPressedAsync: () async {

              context.pushNamed(AppRoutes.orderSummary.name,extra: address);
            },
            buttonStyle: CustomButtonStyles.fillOrangeATL51,
            buttonTextStyle: CustomTextStyle.titleSmallOnError,
          )
        ],
      ),
    );
  }

  _buildAddNewAddress() {
    return GestureDetector(
      onTap: (){
        context.pushNamed(AppRoutes.addDelivery.name);
      },
      child: Container(
        padding: EdgeInsets.only(right: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add a new Delivery address",style: CustomTextStyle.titleMediumRobotoOrangeA7001,),
            Icon(Icons.arrow_forward_ios_rounded,size: 20,)
          ],
        ),
      ),
    );
  }

}
