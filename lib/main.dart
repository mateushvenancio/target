import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:target/datasources/mock_datasource/mock_auth_repository.dart';
import 'package:target/presenter/screens/login_screen.dart';
import 'package:target/repositories/i_auth_repository.dart';

void main() {
  GetIt.I.registerSingleton<IAuthRepository>(MockAuthRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Target',
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const LoginScreen(),
    ),
  ],
);
