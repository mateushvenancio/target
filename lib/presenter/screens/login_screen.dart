import 'package:flutter/material.dart';
import 'package:target/presenter/components/body.dart';
import 'package:target/presenter/components/main_button.dart';
import 'package:target/presenter/components/main_text_field.dart';
import 'package:target/services/show_snackbar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MainTextField(
                  label: 'Usuário',
                  icon: Icon(Icons.person),
                ),
                const SizedBox(height: 16),
                const MainTextField(
                  label: 'Senha',
                  icon: Icon(Icons.lock),
                ),
                const SizedBox(height: 16),
                MainButton(
                  label: 'Entrar',
                  onPressed: () {
                    showSnackBar(context, 'Mostrar');
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  launchUrlString('https://www.google.com.br/');
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Política de privacidade',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
