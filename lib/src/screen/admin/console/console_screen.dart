import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/screen/admin/console/widget/feature_card.dart';

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
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index)=>FeatureCard());
  }
}
