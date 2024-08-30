import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/screen/home/provider/home_provider.dart';
import 'package:vrindavantiffin/src/screen/home/state/home_state.dart';
import 'package:vrindavantiffin/src/screen/home/widget/item_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
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
          return GridView.builder(
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
      default:
        return SizedBox.shrink();
    }
  }
}
