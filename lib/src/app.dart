import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/shared/theme/app_theme.dart';

class App extends ConsumerStatefulWidget {
  final AppRouter router;

  const App({super.key, required this.router});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: widget.router.router.routeInformationParser,
      routerDelegate: widget.router.router.routerDelegate,
      routeInformationProvider: widget.router.router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeLight,
      darkTheme: AppThemes.themeDark,
      themeMode: ThemeMode.system,

    );
  }
}
