import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:target/core/exceptions/main_exception.dart';
import 'package:target/presenter/components/body.dart';
import 'package:target/presenter/components/main_button.dart';
import 'package:target/presenter/components/main_text_field.dart';
import 'package:target/repositories/i_auth_repository.dart';
import 'package:target/services/show_alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authRepository = GetIt.I<IAuthRepository>();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  submit() async {
    try {
      await authRepository.login(
        usernameTextController.text.trim(),
        passwordTextController.text.trim(),
      );
      if (mounted) {
        context.go('/home');
      }
    } on MainException catch (e) {
      if (mounted) {
        showAlertDialog(context, e.message, AlertDialogType.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainTextField(
              label: 'Usuário',
              icon: const Icon(Icons.person),
              controller: usernameTextController,
            ),
            const SizedBox(height: 16),
            MainTextField(
              label: 'Senha',
              icon: const Icon(Icons.lock),
              controller: passwordTextController,
              obscure: true,
            ),
            const SizedBox(height: 16),
            MainButton(
              label: 'Entrar',
              onPressed: submit,
            ),
          ],
        ),
      ),
    );
  }
}
