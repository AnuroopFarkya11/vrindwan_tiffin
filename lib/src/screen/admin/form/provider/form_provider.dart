import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/screen/admin/console/state/console_state.dart';

class FormProvider extends StateNotifier<ConsoleState> {
  FormProvider() : super(ConsoleState(status: ConsoleStatus.initial));
}
