import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/home/ui/home.dart';
import 'package:speed_bate_frontend/home/ui/verify_phone_number_view_model.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:speed_bate_frontend/widget_library/otp.dart';

class VerifyPhoneNumber extends StatelessWidget {
  const VerifyPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) => Selector0(
      selector: (context) => VerifyPhoneNumberViewModel.fromState(
            user: context.watch(),
            dispatcher: StoreProvider.of<AppState>(context).dispatch,
            graphQlClientProvider: context.watch(),
            toHomeScreen: () => Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const Home(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin =
                      Offset(1.0, 0.0); // Starts off-screen to the right
                  const end = Offset.zero; // Ends at the screen's center
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            ),
          ),
      builder: (context, viewModel, _) => VerifyPhoneNumberScreen(
            viewModel: viewModel,
          ));
}

class VerifyPhoneNumberScreen extends StatefulWidget {
  const VerifyPhoneNumberScreen({
    required this.viewModel,
    super.key,
  });

  final VerifyPhoneNumberViewModel viewModel;

  @override
  State<VerifyPhoneNumberScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<VerifyPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          leading: null,
          title: const Text('Verify Phone Number'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OTPInputWidget(
                  borderColor: Colors.orange,
                  borderWith: 3.0,
                  onCompleted: (code, setError) =>
                      widget.viewModel.onVerifyCode(
                    code,
                    setError,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print("Resend button clicked");
                  widget.viewModel.onResendCode();
                },
                child: const Text(
                  "Didn't receive code? \nResend",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                  height: paddingXLarge), // Add spacing between the widgets
            ],
          ),
        ),
      );
}
