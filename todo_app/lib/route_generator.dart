import 'package:flutter/material.dart';
import 'package:todo_app/error_page.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as UserPassArgument?;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => HomePage(
                  userPass: args ?? UserPassArgument(email: '', password: ''),
                ));
      case '/login':
        return MaterialPageRoute(builder: ((context) => const LoginPage()));
      default:
        return MaterialPageRoute(builder: ((context) => const ErrorPage()));
    }
  }
}
