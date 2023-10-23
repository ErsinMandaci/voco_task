import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task/controller/riverpod_management.dart';
import 'package:voco_task/view/view_home/home_view.dart';
import 'package:voco_task/view/view_login/login_view.dart';

class AuthCheckerView extends ConsumerStatefulWidget {
  const AuthCheckerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthCheckerViewState();
}

class _AuthCheckerViewState extends ConsumerState<AuthCheckerView> {
  @override
  void initState() {
    _getToken();
    super.initState();
  }

  Future<bool> _getToken() async {
    final token = await ref.read(authNotifierProvider.notifier).checkToken();
    if (token) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ref.watch(authNotifierProvider).isLogin ?? false == true ? const HomeView() : const LoginView(),
    );
  }
}
