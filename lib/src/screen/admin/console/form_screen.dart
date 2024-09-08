import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsoleFormScreen extends ConsumerStatefulWidget {
  const ConsoleFormScreen({super.key});

  @override
  ConsumerState<ConsoleFormScreen> createState() => _ConsoleFormScreenState();
}

class _ConsoleFormScreenState extends ConsumerState<ConsoleFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),


    );
  }

  _getAppBar() {
    return AppBar();
  }
}
