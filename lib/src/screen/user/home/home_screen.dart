import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sizer/sizer.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/screen/user/cart/cart_sheet.dart';
import 'package:vrindavantiffin/src/screen/user/cart/provider/cart_provider.dart';
import 'package:vrindavantiffin/src/screen/user/cart/state/cart_state.dart';
import 'package:vrindavantiffin/src/screen/user/home/provider/home_provider.dart';
import 'package:vrindavantiffin/src/screen/user/home/state/home_state.dart';
import 'package:vrindavantiffin/src/screen/user/home/widget/item_card.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _searchController = SearchController();
  final scrollController = ScrollController();
  final _debouncedSearchRx = BehaviorSubject<String>.seeded('');

  Future<List<String>> _search(String query) async {
    if (query.isEmpty) {
      return [];
    }

    try {
      final results = await searchFunction(query);
      return results;
    } catch (error) {
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _debouncedSearchRx.add(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncedSearchRx.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _getAppBar(),
      body: _getBody(),
      bottomSheet: _getSheet(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Text('Home screen'),
      actions: [
        IconButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
            icon: Icon(
              Icons.login_outlined,
              color: Colors.red,
            ))
      ],
    );
  }

  _getBody() {
    final home = ref.watch(homeProvider);

    switch (home.status) {
      case (HomeStatus.loading):
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      case (HomeStatus.loaded):
        {
          return SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 32, right: 22, left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // _getHomeHeading(),
                    buildColumnHelloUser(),
                    12.space,
                    _getSearchAnchor(),
                    25.space,
                    _getCategoryCards(),
                    25.space,
                    _getTodaySpecial(),

                    _getFoodItemGrid(home)
                  ],
                ),
              ),
            ),
          );
        }
      default:
        return SizedBox.shrink();
    }
  }

  _getSheet() {
    final cart = ref.watch(cartProvider);

    switch (cart.status) {
      case CartStatus.filled:
        {
          return CartSheet();
        }
      default:
        {
          return SizedBox.shrink();
        }
    }
  }

  _getHomeHeading() {
    return RichText(
      text: TextSpan(
        text: "Hello,\nAnuroop",
        children: [
          TextSpan(
              text: "\nWhat do you want to eat?",
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w100,
                height: 2.5,
                color: AppColors.secondaryTextDrkColor,
              ))
        ],
        style: context.textTheme.displayMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  _getFoodItemGrid(var home) {
    return GridView.builder(
        controller: scrollController,
        // padding: 10.padding,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        shrinkWrap: true,
        itemCount: home.items?.length ?? 0,
        itemBuilder: (context, index) {
          return FoodItemCard(
            item: home.items![index],
          );
        });
  }

  _getSearchAnchor() {
    final List<String> foodItems = ['Dal', 'Chawal', 'Roti', 'Sabzi', 'Paneer'];
    return SearchAnchor(
      searchController: _searchController,
      builder: (context, controller) {
        return SearchBar(
          hintText: "Search",
          onTap: () {
            controller.openView();
          },
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          leading: Icon(Icons.search),
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(appTheme.gray30001),
        );
      },
      suggestionsBuilder: (context, controller) async {
        // final query = controller.text.toLowerCase();
        // final suggestions = foodItems.where((item) {
        //   return item.toLowerCase().contains(query);
        // }).toList();
        final results = await _debouncedSearchRx
            .debounceTime(const Duration(milliseconds: 500))
            .asyncMap((query) => searchFunction(query))
            .first;

        return results
            .map((suggestion) => ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    // Handle suggestion selection
                    controller.text = suggestion;
                    Navigator.pop(context);
                  },
                ))
            .toList();
      },
    );
  }

  searchFunction(String query) {
    final List<String> foodItems = ['Dal', 'Chawal', 'Roti', 'Sabzi', 'Paneer'];

    return foodItems.where((str) {
      return str.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  _getCategoryCards() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return 20.space;
          },
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 76,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 76,
                    width: double.maxFinite,
                    decoration: ShapeDecoration(
                        color: appTheme.orangeA700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Icon(
                      Icons.emoji_food_beverage_outlined,
                      size: 55,
                      color: context.colorScheme.surface,
                    ),
                  ),
                  10.space,
                  Text(
                    "Dinner",
                    style: context.textTheme.titleMedium,
                  )
                ],
              ),
            );
          }),
    );
  }

  _getTodaySpecial() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "Today's special",
              style: context.textTheme.headlineSmall
                  ?.copyWith(textBaseline: TextBaseline.alphabetic),
            ),
            Text(
              "See all",
              style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryLight,
                  textBaseline: TextBaseline.alphabetic),
            )
          ],
        ),
        15.space,
        SizedBox(
          height: 200,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 190,
                  width: 220,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/food.png",
                        height: 190,
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,

                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            vertical: 4,horizontal: 10
                          ),

                        ),
                      )


                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 20.space;
              },
              itemCount: 4),
        )
      ],
    );
  }

  /// Section Widget
  Widget buildColumnHelloUser() {
    return SizedBox(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 162.h,
              child: Text(
                "Hello,\nAnuroop.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "What do you want to eat?",
              style: context.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
