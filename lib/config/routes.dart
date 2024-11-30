import 'package:flutter/material.dart';
import '../screen/screen.dart';

class Routes {
  static const String menu = '/menu';
  static const String login = '/login';
  static const String changePassword = '/change_password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuPage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());

      case '/':
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Routes'),
                    centerTitle: true, // Judul di tengah
                  ),
                  body: const Center(
                    child: Text('Routes Not Found'),
                  ),
                ));
    }
  }
}
