import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/home/home.dart';
import 'package:speed_bate_frontend/login/login_screen_view_model.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';
import 'package:speed_bate_frontend/signup/ui/signup.dart';
import 'package:speed_bate_frontend/state.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) => Selector0(
        selector: (context) => LoginScreenViewModel.fromState(
          client: context.watch(),
          user: context.watch(),
          dispatcher: StoreProvider.of<AppState>(context).dispatch,
          onSignUp: () => showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(paddingMedium),
              ),
            ),
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) => const FractionallySizedBox(
              heightFactor: 1.0,
              child: Signup(),
            ),
          ),
          toHomeScreen: () => Navigator.of(context).pushReplacement(
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

                return SlideTransition(position: offsetAnimation, child: child);
              },
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
  final _formKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final phoneRegExp = RegExp(r'^\+?[1-9]\d{1,14}$');

  String? errorPhoneNumber;
  String? errorPassword;

  void setErrorPhoneNumber(String? error) => setState(() {
        errorPhoneNumber = error;
      });

  void setErrorPassword(String? error) => setState(() {
        errorPassword = error;
      });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(paddingMedium),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
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
                      errorText: errorPhoneNumber,
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
                      errorText: errorPassword,
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
                  TextButton(
                      onPressed: () {}, child: const Text('Forgot Password?')),
                  const SizedBox(height: paddingMedium),
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.viewModel.onLogin(
                          phoneNumberController.text,
                          passwordController.text,
                          setErrorPhoneNumber,
                          setErrorPassword,
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
