import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task/view/theme/app_theme.dart';
import 'package:voco_task/view/view_auth/auth_checker.dart';

void main(List<String> args) {
  runApp(const ProviderScope(child: VocoTask()));
}

class VocoTask extends StatelessWidget {
  const VocoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      title: 'VocoTask',
      home: const AuthCheckerView(),
    );
  }
}
