import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';


class DishScreen extends ConsumerStatefulWidget {
  const DishScreen({super.key});

  @override
  ConsumerState<DishScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<DishScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 22.h, top: 8.h, right: 22.h),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.space,
                  _buildStackFavorite(context),
                  24.space,
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text("Name",style: CustomTextStyle.headlineMediumPrimary1,),
                  )




                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  _buildStackFavorite(BuildContext context) {
    return Container(
      height: 264.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: "assets/food.png",
            height: 264.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(5.h),
          )



        ],
      ),


    );
  }
}
