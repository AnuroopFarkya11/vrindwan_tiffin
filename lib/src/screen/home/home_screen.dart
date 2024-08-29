import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
    );
  }
}
