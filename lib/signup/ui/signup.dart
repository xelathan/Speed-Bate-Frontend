import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/home/home.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';
import 'package:speed_bate_frontend/signup/ui/signup_view_model.dart';
import 'package:speed_bate_frontend/state.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) => Selector0(
        selector: (context) => SignupViewModel.fromState(
          dispatcher: StoreProvider.of<AppState>(context).dispatch,
          client: context.read(),
          user: context.read(),
          toHomeScreen: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const Home(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // You can define the type of animation you want here.
                  const begin = Offset(1.0, 0.0); // Slide from the right
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            );
          },
        ),
        builder: (context, viewModel, _) => SignupScreen(
          viewModel: viewModel,
        ),
      );
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    required this.viewModel,
    super.key,
  });

  final SignupViewModel viewModel;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final phoneRegExp = RegExp(r'^\+?[1-9]\d{1,14}$');

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? usernameError;
  String? phoneNumberError;
  String? passwordError;
  String? confirmPasswordError;

  void setUsernameError(String? error) {
    setState(() {
      usernameError = error;
    });
  }

  void setPhoneNumberError(String? error) {
    setState(() {
      phoneNumberError = error;
    });
  }

  void setPasswordError(String? error) {
    setState(() {
      passwordError = error;
    });
  }

  void setConfirmPasswordError(String? error) {
    setState(() {
      confirmPasswordError = error;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Signup'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(paddingMedium),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: cursorColor,
                    cursorErrorColor: cursorColor,
                    controller: usernameController,
                    autofillHints: const [
                      AutofillHints.username,
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      errorText: usernameError,
                      errorStyle: const TextStyle(color: Colors.red),
                      labelText: 'Username',
                      contentPadding: const EdgeInsets.all(paddingMedium),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      if (value.length < 3) {
                        return 'Username must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: paddingMedium),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    cursorColor: cursorColor,
                    cursorErrorColor: cursorColor,
                    controller: phoneNumberController,
                    autofillHints: const [
                      AutofillHints.telephoneNumberLocalPrefix
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_iphone),
                      errorText: phoneNumberError,
                      errorStyle: const TextStyle(color: Colors.red),
                      labelText: 'Phone Number',
                      contentPadding: const EdgeInsets.all(paddingMedium),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!phoneRegExp.hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: paddingMedium),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(height: paddingMedium),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    cursorColor: cursorColor,
                    cursorErrorColor: cursorColor,
                    controller: passwordController,
                    autofillHints: const [
                      AutofillHints.newPassword,
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      errorText: passwordError,
                      errorStyle: const TextStyle(color: Colors.red),
                      labelText: 'Password',
                      contentPadding: const EdgeInsets.all(paddingMedium),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: paddingMedium),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    cursorColor: cursorColor,
                    cursorErrorColor: cursorColor,
                    controller: confirmPasswordController,
                    autofillHints: const [
                      AutofillHints.password,
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.check),
                      errorText: confirmPasswordError,
                      errorStyle: const TextStyle(color: Colors.red),
                      labelText: 'Confirm Password',
                      contentPadding: const EdgeInsets.all(paddingMedium),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: paddingLarge),
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.viewModel.onSignUp(
                          usernameController.text,
                          phoneNumberController.text,
                          passwordController.text,
                          setUsernameError,
                          setPhoneNumberError,
                          setConfirmPasswordError,
                        );
                      }
                    },
                    minWidth: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(paddingSmall),
                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(borderRadiusVeryRound),
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
        ),
      );
}