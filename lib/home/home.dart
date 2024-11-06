import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/chat/ui/chat.dart';
import 'package:speed_bate_frontend/home/home_screen_view_model.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/widget_library/start_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Selector0<HomeScreenViewModel>(
        selector: (context) => HomeScreenViewModel.fromState(
            user: context.watch(),
            dispatcher: StoreProvider.of<AppState>(context).dispatch,
            matchmakingWebsocket: context.watch(),
            toChatScreen: (opponentId, matchId) =>
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Chat(
                      opponentId: opponentId,
                      matchId: matchId,
                    ),
                  ),
                )),
        builder: (context, viewModel, _) => HomeScreen(
          viewModel: viewModel,
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
            child: Align(
              alignment: Alignment.center,
              child: viewModel.matchingStatus == UserMatchingStatus.matching
                  ? SpinKitThreeBounce(
                      duration: const Duration(milliseconds: 1500),
                      color: Colors.orange,
                      size: MediaQuery.of(context).size.height / 10,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 2,
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
