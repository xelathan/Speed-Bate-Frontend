import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/chat/ui/chat.dart';
import 'package:speed_bate_frontend/home/home_screen_view_model.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/matchmaking_websocket.dart';
import 'package:speed_bate_frontend/widget_library/start_button.dart';
import 'package:rive/rive.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: MatchmakingWebsocket(
          token: context.read<User>().token,
        ),
        child: Selector0<HomeScreenViewModel>(
          selector: (context) => HomeScreenViewModel.fromState(
              user: context.watch(),
              dispatcher: StoreProvider.of<AppState>(context).dispatch,
              matchmakingWebsocket: context.watch(),
              toChatScreen: (opponentId, matchId, topic) =>
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Placeholder(),
                    ),
                  )),
          builder: (context, viewModel, _) => HomeScreen(
            viewModel: viewModel,
          ),
        ),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.viewModel,
    super.key,
  });

  final HomeScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height / 6,
            child: const Align(
              alignment: Alignment.center,
              child: RiveAnimation.asset(
                'assets/rive_animations/home_screen_animation.riv',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 4,
            child: Align(
              alignment: Alignment.center,
              child: viewModel.matchingStatus == UserMatchingStatus.matching
                  ? const SpinKitRipple(
                      color: Colors.orange,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 1.75,
            child: Align(
              alignment: Alignment.center,
              child: StartButton(
                isMatching:
                    viewModel.matchingStatus == UserMatchingStatus.matching,
                startMatchmaking: viewModel.startMatchmaking,
                cancelMatchmaking: viewModel.cancelMatchmaking,
              ),
            ),
          )
        ],
      ),
    );
  }
}
