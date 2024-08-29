import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/screen/home/state/home_state.dart';

/// Provider
final homeProvider = StateNotifierProvider((ref) => HomeProvider());

/// Implementation
class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(HomeState(status: HomeStatus.initial));

}

