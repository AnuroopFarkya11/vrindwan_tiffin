import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vrindavantiffin/src/core/utils/image_constant.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';

class ProfileSectionScreen extends ConsumerStatefulWidget {
  const ProfileSectionScreen({super.key});

  @override
  ConsumerState<ProfileSectionScreen> createState() =>
      _ProfileSectionScreenState();
}

class _ProfileSectionScreenState extends ConsumerState<ProfileSectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 22.h),
              child: Column(
                children: [
                  buildColumnAbhishek(context),
                  SizedBox(height: 32.h),
                  Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.h, vertical: 36.h),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onError,
                    ),
                    child: Column(
                      children: [
                        buildRowCoolIconOne(context),
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: buildTile(
                            context,
                            iconPath: ImageConstant.payment_method,
                            rewardCredits: "Payment method",
                          ),
                        ),
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: buildTile(
                            context,
                            iconPath: ImageConstant.reward_credit,
                            rewardCredits: "Reward credits",
                          ),
                        ),
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: buildTile(
                            context,
                            iconPath: ImageConstant.invite_friends,
                            rewardCredits: "Invite Friends",
                          ),
                        ),
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: buildTile(
                            context,
                            iconPath: ImageConstant.track_order,
                            rewardCredits: "Track order",
                          ),
                        ),
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: buildTile(
                            context,
                            iconPath: ImageConstant.order_history,
                            rewardCredits: "Order history",
                          ),
                        ),
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: buildTile(
                            context,
                            iconPath: ImageConstant.about_us,
                            rewardCredits: "About us",
                          ),
                        ),
                        SizedBox(height: 36.h),
                        buildRowArrowLeft(context),
                        SizedBox(height: 12.h),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRowCoolIconOne(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.notification_bell,
            height: 20.h,
            width: 16.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Text(
              "Notifications",
              style: CustomTextStyle.titleMediumRobotoBluegray80002_1,
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.arrow_right,
            height: 12.h,
            width: 6.h,
          ),
        ],
      ),
    );
  }

  Widget buildRowArrowLeft(BuildContext context) {
    return InkWell(
      onTap: () {
        ref.watch(authProvider.notifier).unAuthenticate();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.sign_out,
              height: 18.h,
              width: 18.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "Sign out",
                  style: CustomTextStyle.titleMediumRobotoBluegray80002_1,
                ),
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.arrow_right,
              height: 12.h,
              width: 6.h,
              margin: EdgeInsets.only(top: 4.h),
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget buildTile(BuildContext context,
      {required String iconPath,
      required String rewardCredits,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: iconPath,
            height: 16.h,
            width: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text(
              rewardCredits,
              style: CustomTextStyle.titleMediumRobotoBluegray80002_1.copyWith(
                color: appTheme.blueGray80002,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.arrow_right,
            height: 12.h,
            width: 6.h,
          ),
        ],
      ),
    );
  }

  Widget buildColumnAbhishek(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 22.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.about_us,
                  height: 90.h,
                  width: 90.h,
                  radius: BorderRadius.circular(44.h),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h, bottom: 14.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Anuroop Farkya",
                            style: CustomTextStyle
                                .titleMediumRobotoBluegray80002_1,
                          ),
                          Text(
                            "+918305048867",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyle.bodySmallRobotoBluegray80002,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.arrow_right,
                  height: 12.h,
                  width: 6.h,
                  margin: EdgeInsets.only(left: 10.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
