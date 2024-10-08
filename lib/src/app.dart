import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/shared/theme/app_theme.dart';

import 'core/utils/size_utils.dart';
import 'shared/theme/theme_helper.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class App extends ConsumerStatefulWidget {
  final AppRouter router;

  const App({super.key, required this.router});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {

    return Sizer(
      builder: (context,orientation,screenType) {
        return MaterialApp.router(

          routeInformationParser: widget.router.router.routeInformationParser,
          routerDelegate: widget.router.router.routerDelegate,
          routeInformationProvider: widget.router.router.routeInformationProvider,
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: AppThemes.themeDark,
          themeMode: ThemeMode.system,

        );
      }
    );
  }
}
