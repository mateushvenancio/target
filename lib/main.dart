import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:target/datasources/local_datasource/local_info_repository.dart';
import 'package:target/datasources/mock_datasource/mock_auth_repository.dart';
import 'package:target/presenter/screens/home_screen.dart';
import 'package:target/presenter/screens/login_screen.dart';
import 'package:target/presenter/stores/infos_store.dart';
import 'package:target/repositories/i_auth_repository.dart';
import 'package:target/repositories/i_infos_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // registrar primeiro as dependências
  GetIt.I.registerFactory<IAuthRepository>(() => MockAuthRepository());
  GetIt.I.registerFactory<IInfosRepository>(() => LocalInfosRepository());

  // depois os stores
  GetIt.I.registerSingleton(InfoStore());

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
    GoRoute(
      path: '/home',
      builder: (_, __) => const HomeScreen(),
    ),
  ],
);
