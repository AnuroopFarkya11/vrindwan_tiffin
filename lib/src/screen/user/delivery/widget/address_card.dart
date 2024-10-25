import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/utils/image_constant.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final String? selectedAddressId;
  final ValueChanged<String> onSelected;

  const AddressCard(
      {super.key,
      required this.address,
      required this.onSelected,
      this.selectedAddressId});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onSelected(address.addressId??"");
      },
      leading: CustomImageView(
        imagePath: ImageConstant.marker,
        height: 40.h,
        width: 30.h,
        color: address.addressId == selectedAddressId?appTheme.orangeA70001:appTheme.blueGray100,
      ),
      title: Text(
        address.name ?? "",
        style: CustomTextStyle.titleMediumRobotoOrangeA70001_1,
      ),
      subtitle: Text(
        "${address.street} \n${address.postalCode} \n${address.city}",
        maxLines: 3,
        style: CustomTextStyle.bodyMediumRobotoPrimary_2,
      ),
      trailing: Radio(
          fillColor: WidgetStateProperty.all(Colors.black),
          value: address.addressId,
          groupValue: selectedAddressId,
          onChanged: (value) {
            if (value != null) {
              onSelected(value);
            }
          }),
    );
  }
}
