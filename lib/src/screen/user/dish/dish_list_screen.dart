import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/user/home/provider/home_provider.dart';
import 'package:vrindavantiffin/src/screen/user/home/state/home_state.dart';
import 'package:vrindavantiffin/src/screen/user/home/widget/food_card_two.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';

class DishListScreen extends ConsumerStatefulWidget {
  final String category;
  const DishListScreen({super.key,required this.category});

  @override
  ConsumerState<DishListScreen> createState() => _DishListScreenState();
}

class _DishListScreenState extends ConsumerState<DishListScreen> {
  ScrollController scrollController = ScrollController();
  late HomeState homeState;
  @override
  Widget build(BuildContext context) {
    homeState = ref.watch(homeProvider);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.category??"",
              style: CustomTextStyle.headlineMediumPrimaryBold,
            ),
            leadingWidth: 30,
          ),
      body: _buildBody(),
    ));
  }

  _buildBody() {

    List<FoodItem>? items = homeState.categoricalItems?[widget.category];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 22.h, right: 22.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            20.space,
            ListView.separated(
                controller: scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FoodCardTwo(item: items?[index]??FoodItem(),);
                },
                separatorBuilder: (context, index) {
                  return 20.space;
                },
                itemCount: items?.length??0)
          ],
        ),
      ),
    );
  }
}
