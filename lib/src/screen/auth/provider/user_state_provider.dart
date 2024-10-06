import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/screen/auth/auth_controller.dart';
import 'package:vrindavantiffin/src/screen/auth/state/user_state.dart';

final userAuthStateProvider = StateProvider<UserAuthStatus>((ref)=>UserAuthStatus.signIn);
