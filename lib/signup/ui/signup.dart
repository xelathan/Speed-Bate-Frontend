import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/home/ui/verify_phone_number.dart';
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
          toVerifyPhoneNumberScreen: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const VerifyPhoneNumber(),
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
                  IntlPhoneField(
                    initialCountryCode: "US",
                    dropdownDecoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(borderRadiusVeryRound),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      errorText: phoneNumberError,
                      errorStyle: const TextStyle(color: Colors.red),
                      contentPadding: const EdgeInsets.all(paddingMedium),
                    ),
                    controller: phoneNumberController,
                    onChanged: (_) {
                      setPhoneNumberError(null);
                    },
                    flagsButtonPadding:
                        const EdgeInsets.only(left: paddingSmall),
                    autovalidateMode: AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == null || value.number.isEmpty) {
                        return 'Please enter a phone number';
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
