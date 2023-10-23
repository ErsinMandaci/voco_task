import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task/controller/riverpod_management.dart';
import 'package:voco_task/view/view_home/home_view.dart';
import 'package:voco_task/view/view_login/login_view.dart';

mixin LoginMixin on ConsumerState<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> handleLogin(WidgetRef ref) async {
    try {
      if (formKey.currentState!.validate()) {
        await ref.read(authNotifierProvider.notifier).login(emailController.text, passwordController.text);
        if (!mounted) return;
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute<HomeView>(builder: (context) => const HomeView()),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address.';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    return null;
  }
}
