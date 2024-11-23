import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/login/login_screen_view_model.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';
import 'package:speed_bate_frontend/signup/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) => Selector0(
        selector: (context) => LoginScreenViewModel.fromState(
          onSignUp: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Signup(),
            ),
          ),
        ),
        builder: (context, viewModel, _) => LoginScreen(
          viewModel: viewModel,
        ),
      );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    required this.viewModel,
    super.key,
  });

  final LoginScreenViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final phoneRegExp = RegExp(r'^\+?[1-9]\d{1,14}$');

  String? errorPhoneNumber;
  String? errorPassword;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(paddingMedium),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.phone,
                  cursorColor: cursorColor,
                  cursorErrorColor: cursorColor,
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    errorText: errorPhoneNumber,
                    errorStyle: const TextStyle(color: Colors.red),
                    labelText: 'Phone Number',
                    contentPadding: const EdgeInsets.all(paddingMedium),
                  ),
                ),
                const SizedBox(height: paddingMedium),
                TextField(
                  cursorColor: cursorColor,
                  cursorErrorColor: cursorColor,
                  controller: passwordController,
                  decoration: InputDecoration(
                    errorText: errorPassword,
                    labelText: 'Password',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    contentPadding: const EdgeInsets.all(paddingMedium),
                  ),
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot Password?')),
                const SizedBox(height: paddingMedium),
                MaterialButton(
                  onPressed: () {
                    String? errorPhoneNumberMessage;
                    if (!phoneRegExp.hasMatch(phoneNumberController.text)) {
                      errorPhoneNumberMessage = 'Invalid phone number';
                    } else {
                      errorPhoneNumberMessage = null;
                    }

                    String? errorPasswordMessage;
                    if (passwordController.text.length < 8) {
                      errorPasswordMessage =
                          'Password must be at least 8 characters';
                    } else {
                      errorPasswordMessage = null;
                    }

                    setState(() {
                      errorPhoneNumber = errorPhoneNumberMessage;
                      errorPassword = errorPasswordMessage;
                    });
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(paddingSmall),
                  color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusVeryRound),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: paddingMedium),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: paddingMedium),
                MaterialButton(
                  onPressed: widget.viewModel.onSignUp,
                  minWidth: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(paddingSmall),
                  color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusVeryRound),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
