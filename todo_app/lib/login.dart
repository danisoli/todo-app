import 'package:flutter/material.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isNotVisible = true;
  String errorMessage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailController.addListener(() {
      setState(() {});
    });
  }

  Widget todoEmailTextField({
    required TextEditingController controller,
    required Icon icon,
    required String label,
    TextInputType? type,
  }) {
    return TextField(
      //Theme.of(context).inputDecorationTheme,
      keyboardType: type,
      textInputAction: TextInputAction.done,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: controller.text.isEmpty
              ? Container(
                  width: 0,
                  height: 0,
                )
              : IconButton(
                  onPressed: (() {
                    _emailController.clear();
                  }),
                  icon: Icon(Icons.close),
                ),
          labelText: label),
    );
  }

  Widget todoPasswordTextField({
    required TextEditingController controller,
    required Icon icon,
    required String label,
  }) {
    return TextField(
      //Theme.of(context).inputDecorationTheme,
      textInputAction: TextInputAction.done,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isNotVisible = !isNotVisible;
              });
            },
            icon: isNotVisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
          labelText: label),
      obscureText: isNotVisible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: todoWhite,
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 168,
              ),
              todoEmailTextField(
                  controller: _emailController,
                  icon: const Icon(Icons.email),
                  label: 'EMAIL',
                  type: TextInputType.emailAddress),
              SizedBox(
                height: 16,
              ),
              todoPasswordTextField(
                controller: _passwordController,
                icon: const Icon(Icons.lock),
                label: 'PASSWORD',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
