import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/utils/image_constant.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';

class AddressCardWithArrow extends StatelessWidget {
  final Address address;
  final VoidCallback? callback;
  const AddressCardWithArrow({super.key,required this.address,this.callback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: callback,
      leading: CustomImageView(
        imagePath: ImageConstant.marker,
        height: 50.h,
        width: 25.h,
        color: appTheme.orangeA70001
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
      trailing: CustomImageView(
        imagePath: ImageConstant.arrow_right,
        height: 22.h,
        width: 11.h,
      ),
    );
  }
}
