import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task/controller/riverpod_management.dart';
import 'package:voco_task/model/user_data_model.dart';
import 'package:voco_task/view/view_home/home_view.dart';
import 'package:voco_task/view/view_login/login_view.dart';

mixin HomeMixin on ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  Future<List<Data>> _getUsers() async {
    final response = await ref.read(userNotifierProvider.notifier).getUsers(
          page: ref.read(userNotifierProvider).page ?? 0,
        );
    return response;
  }

  Future<void> handleLogout() async {
    await ref.read(authNotifierProvider.notifier).removeToken().then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute<HomeView>(builder: (context) => const LoginView()),
          ),
        );
  }
}
