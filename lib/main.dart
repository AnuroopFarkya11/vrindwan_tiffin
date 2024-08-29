import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/app.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final AppRouter router = AppRouter();
  runApp(ProviderScope(
      child: App(
    router: router,
  )));
}
