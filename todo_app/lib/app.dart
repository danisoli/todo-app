import 'package:flutter/material.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/route_generator.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: _firstTodoTheme(),
    );
  }
}

ThemeData _firstTodoTheme() {
  final base = ThemeData.light();
  return base.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: todoLightGreen,
        suffixIconColor: todoLightGreen,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: todoLightGreen)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: todoLightGreen, width: 2)),
        labelStyle: TextStyle(color: todoLightGreen),
        floatingLabelStyle: TextStyle(color: todoLightGreen),
      ),
      textTheme: _firstTextTheme(base.textTheme));
}

TextTheme _firstTextTheme(TextTheme base) {
  return base
      .copyWith(
          titleLarge: base.titleLarge
              ?.copyWith(color: todoLightGreen, fontWeight: FontWeight.w300),
          headlineSmall: base.headlineSmall?.copyWith(color: todoWhite))
      .apply(
          fontFamily: 'Rubik',
          displayColor: todoLightGreen,
          bodyColor: todoLightGreen);
}
