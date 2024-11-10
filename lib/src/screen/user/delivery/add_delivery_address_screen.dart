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

class AddDeliveryAddressScreen extends ConsumerStatefulWidget {
  const AddDeliveryAddressScreen({super.key});

  @override
  ConsumerState<AddDeliveryAddressScreen> createState() =>
      _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends ConsumerState<AddDeliveryAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final Address address = Address();
  late AddressProvider addressProviderRef;
  late AddressState addressState;
  String? _selectedAddressId;

  TextEditingController pinCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    addressProviderRef = ref.read(addressProvider.notifier);
    addressState = ref.watch(addressProvider);

    if(addressState.status==AddressStatus.loaded){
      pinCodeController.text = addressState.address?.postalCode??"";
      stateController.text = addressState.address?.state??"";
      cityController.text = addressState.address?.city??"";
      houseNoController.text = addressState.address?.street??"";
      address.country = addressState.address?.country??"";
    }




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
        "Add Delivery address",
        style: CustomTextStyle.titleLargeRobotoPrimary_1,
      ),
    );
  }

  _buildBody() {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Padding(
          padding: 22.paddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.space,
              _buildForm(),

              24.space,


              24.space
            ],
          ),
        ),
      ),
    );
  }


  _buildNameField() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: CustomTextFormField(
        hintText: "Name*",
        validator: (value) {
          if (value == "") {
            return "Please enter a name.";
          }
        },
        contentPadding: EdgeInsets.fromLTRB(20.h, 18.h, 20.h, 16.h),
        onSaved: (value) {
          print("NAME FIELD : $value");
          address.name = value;
        },
      ),
    );
  }

  _buildPhoneField() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: CustomTextFormField(
        hintText: "Phone Number*",
        textInputType: TextInputType.number,
        validator: (value) {
          bool res = isValidPhone(value);
          if (!res) {
            return "Enter a valid number.";
          }
        },
        onSaved: (value) {
          address.phoneNumber = value;
        },
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
      ),
    );
  }

  _buildRowPinCodeAndUseMyLocation() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      child: Row(
        children: [
          _buildPinCodeField(),
          24.spaceHorizontal,
          _buildUseMyLocation()
        ],
      ),
    );
  }

  _buildPinCodeField() {
    return Expanded(
      child: CustomTextFormField(
        controller: pinCodeController,
        hintText: "Pincode*",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
        validator: (value) {
          bool res = isValidPincode(value);
          if (!res) {
            return "Enter a valid pincode";
          }
        },
        onSaved: (value) {
          address.postalCode = value;
        },
      ),
    );
  }

  _buildUseMyLocation() {
    return Expanded(
        child: CustomElevatedButton(
          height: 60.h,
          text: "Use My Location",
          onPressedAsync: addressProviderRef.getUserLocation,
          leftIcon: Container(
            margin: EdgeInsets.only(right: 6.h),
            child: CustomImageView(
              height: 18.h,
              width: 14.h,
              imagePath: "assets/icons/marker.svg",
              fit: BoxFit.contain,
            ),
          ),
          buttonStyle: CustomButtonStyles.fillOrangeATL10,
          buttonTextStyle: CustomTextStyle.titleSmallOnError,
        ));
  }

  _buildRowStateAndCity() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      child: Row(
        children: [_buildStateField(), 24.spaceHorizontal, _buildCityField()],
      ),
    );
  }

  _buildStateField() {
    return Expanded(
      child: CustomTextFormField(
        controller: stateController,
          hintText: "State*",
          textInputType: TextInputType.text,
          contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
          validator: (value) {
            if (value == null || value == "") {
              return "Enter a valid state";
            }
          },
          onSaved: (value) {
            address.state = value;
          }),
    );
  }

  _buildCityField() {
    return Expanded(
      child: CustomTextFormField(
        controller: cityController,
        hintText: "City*",
        textInputType: TextInputType.text,
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
        validator: (value) {
          if (value == null || value == "") {
            return "Enter a valid city.";
          }
        },
        onSaved: (value) {
          address.city = value;
        },
      ),
    );
  }

  _buildAddressField() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: CustomTextFormField(
        controller: houseNoController,
        hintText: "House No. Building Number*",
        textInputType: TextInputType.text,
        contentPadding: EdgeInsets.fromLTRB(14.h, 18.h, 14.h, 12.h),
        validator: (value) {
          if (value == null || value == "") {
            return "Enter a valid address";
          }
        },
        onSaved: (value) {
          address.street = value;
        },
      ),
    );
  }

  _buildAddressField2() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: CustomTextFormField(
        hintText: "Road Name, Area, Colony",
        textInputType: TextInputType.text,
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
      ),
    );
  }

  _buildRowContinue() {
    return Container(
      height: 70.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: BoxDecoration(color: theme.colorScheme.onError),
      child: CustomElevatedButton(
        height: 50.h,
        width: double.maxFinite,
        text: "SAVE & CONTINUE".toUpperCase(),
        onPressedAsync: () async {
          bool? isValid = _formKey.currentState?.validate();
          if (isValid != null && isValid) {
            _formKey.currentState?.save();
            address.country = "India";
            await addressProviderRef.addAddress(address);
            if (ref.watch(addressProvider).status == AddressStatus.loaded) {
              context.pushNamed(AppRoutes.orderSummary.name);
            }
          }
        },
        buttonStyle: CustomButtonStyles.fillOrangeATL51,
        buttonTextStyle: CustomTextStyle.titleSmallOnError,
      ),
    );
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameField(),
          24.space,
          _buildPhoneField(),
          24.space,
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "+ Add Alternate Phone Number",
              style: CustomTextStyle.titleSmallOrangeA700,
            ),
          ),
          24.space,
          _buildRowPinCodeAndUseMyLocation(),
          24.space,
          _buildRowStateAndCity(),
          24.space,
          _buildAddressField(),
          24.space,
          _buildAddressField2(),
          24.space,
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "+ Add Near By Landmark",
              style: CustomTextStyle.titleSmall1,
            ),
          ),
        ],
      ),
    );
  }


}
