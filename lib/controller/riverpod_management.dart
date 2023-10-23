import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task/controller/auth_controller.dart';
import 'package:voco_task/controller/user_controller.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
