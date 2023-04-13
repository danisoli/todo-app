import 'package:flutter/material.dart';
import 'package:todo_app/home.dart';
import 'colors.dart';

class UserPassArgument {
  final String? email;
  final String? password;

  UserPassArgument({this.password, this.email});
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';
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
                  icon: const Icon(Icons.close),
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
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          labelText: label),
      obscureText: isNotVisible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: todoGreen
            //   gradient: LinearGradient(
            //       colors: [todoWhite, todoLightBrown],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter),
            //
            ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(
                height: 24,
              ),
              Text('Login',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 168,
              ),
              todoEmailTextField(
                  controller: _emailController,
                  icon: const Icon(Icons.email),
                  label: 'EMAIL',
                  type: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              todoPasswordTextField(
                controller: _passwordController,
                icon: const Icon(Icons.lock),
                label: 'PASSWORD',
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextButton(
                  onPressed: () {
                    if (_emailController.text.isNotEmpty &&
                        _emailController.text.contains('@') &&
                        _passwordController.text.isNotEmpty) {
                      Navigator.of(context).pushNamed('/',
                          arguments: UserPassArgument(
                              password: _passwordController.text,
                              email: _emailController.text));
                    } else if (!_emailController.text.contains('@')) {
                      const snackBar = SnackBar(
                        content: Text('enter correct email'),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      const snackBar = SnackBar(
                        content: Text('field cannot be empty'),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28))),
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: todoWhite),
                      backgroundColor: todoGreen,
                      foregroundColor: todoWhite),
                  child: const Text('Log'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: todoGreen, width: 4),
                          borderRadius: BorderRadius.all(Radius.circular(28))),
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: todoWhite),
                      backgroundColor: todoLightGreen.withOpacity(0.70),
                      foregroundColor: todoWhite),
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
