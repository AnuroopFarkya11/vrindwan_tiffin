import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/screen/admin/console/state/console_state.dart';

class ConsoleProvider extends StateNotifier<ConsoleState> {
  ConsoleProvider() : super(ConsoleState(status: ConsoleStatus.initial));
}
