import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speed_bate_frontend/home/ui/home.dart';
import 'package:speed_bate_frontend/login/login.dart';
import 'package:speed_bate_frontend/splash_screen/splash_screen_view_model.dart';
import 'package:speed_bate_frontend/state.dart';

class InitializeScreen extends StatelessWidget {
  const InitializeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) =>
          store.state.chatroomCreationMetaData != null &&
          store.state.matchmakingMetaData != null &&
          store.state.realTimeMessagingMetaData != null,
      builder: (context, isDataLoaded) {
        return AnimatedSwitcher(
          duration:
              const Duration(milliseconds: 500), // Adjust duration as needed
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: isDataLoaded
              ? const Login() // If data is loaded, show Home screen
              : SplashScreenView(
                  // If not, show SplashScreen
                  viewModel: SplashScreenViewModel.fromState(
                    screenSize: MediaQuery.of(context).size,
                    store: StoreProvider.of<AppState>(context),
                  ),
                ),
        );
      },
    );
  }
}

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({required this.viewModel, super.key});

  final SplashScreenViewModel viewModel;

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchTopicsMetaData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          heightFactor: 4.25,
          child: SvgPicture.asset(
            widget.viewModel.splashScreenIconPath,
            width: widget.viewModel.screenSize.width * 0.45,
            height: widget.viewModel.screenSize.width * 0.45,
          ),
        ),
      );
}
