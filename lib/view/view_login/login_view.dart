import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voco_task/view/view_login/login_mixin.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _SvgLogo(),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                children: [
                  _CustomTextFormField(
                    controller: emailController,
                    hintText: 'you@example.com',
                    labelText: 'Email Adress',
                    validator: emailValidator,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  _CustomTextFormField(
                    controller: passwordController,
                    hintText: 'your password',
                    labelText: 'Password',
                    validator: passwordValidator,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {},
              child: const Text('Forgot password?'),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1989d4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  await handleLogin(ref);
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  const _CustomTextFormField({
    required this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.obscureText,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xff27272a),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        labelText: labelText,
      ),
    );
  }
}

class _SvgLogo extends StatelessWidget {
  const _SvgLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.network(
        'https://vocoapp.com/logo-icon.svg',
        height: 60,
        colorFilter: const ColorFilter.mode(
          Color(0xff1989d4),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
