import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/screen/admin/console/widget/feature_card.dart';
import 'package:vrindavantiffin/src/screen/admin/form/route/form_route.dart';

class ConsoleScreen extends ConsumerStatefulWidget {
  const ConsoleScreen({super.key});

  @override
  ConsumerState<ConsoleScreen> createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends ConsumerState<ConsoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Text("Admin Console"),
    );
  }

  _getBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [_getFoodGrid()],
      ),
    );
  }

  _getFoodGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Food Console"),
        10.space,
        GridView(
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            FeatureCard(icon: Icons.fastfood_outlined, label: "Get List"),
            FeatureCard(
              icon: Icons.add,
              label: "Add Item",
              onTap: () {
                context.pushNamed(AppRoutes.form.name,
                    extra: FormRoute.AddFoodItem);
              },
            ),
            FeatureCard(icon: Icons.delete, label: "Delete Item"),
            FeatureCard(icon: Icons.update, label: "Update Item"),
          ],
        )
      ],
    );
  }
}
