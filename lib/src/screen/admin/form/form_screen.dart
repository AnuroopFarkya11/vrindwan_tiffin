import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/screen/admin/form/route/form_route.dart';
import 'package:vrindavantiffin/src/screen/admin/form/widget/food_forms/add_item.dart';

class ConsoleFormScreen extends ConsumerStatefulWidget {
  final FormRoute route;

  const ConsoleFormScreen({super.key, required this.route});

  @override
  ConsumerState<ConsoleFormScreen> createState() => _ConsoleFormScreenState();
}

class _ConsoleFormScreenState extends ConsumerState<ConsoleFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Padding(
        padding: 10.padding,
        child: _getBody(),
      ),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Text(widget.route.label),
    );
  }

  _getBody() {
    switch (widget.route) {
      case FormRoute.AddFoodItem:
        {
          return AddFoodItemForm();
        }
      default:
        {
          return SizedBox.shrink();
        }
    }
  }
}
