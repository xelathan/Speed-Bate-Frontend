import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:speed_bate_frontend/home/middleware.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';
import 'package:speed_bate_frontend/reducer.dart';
import 'package:speed_bate_frontend/splash_screen/middleware.dart';
import 'package:speed_bate_frontend/splash_screen/splash_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/matchmaking_websocket.dart';
import 'package:uuid/uuid.dart';

final store = Store<AppState>(
  reducer,
  initialState: AppState.initial(),
  middleware: [
    splashScreenMiddleware,
    homeScreenMiddleware,
  ],
);

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserModel(
            const Uuid().v4(),
          ),
        ),
        ChangeNotifierProvider.value(value: MatchmakingWebsocket()),
      ],
      child: StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Speed Bate',
          themeMode: ThemeMode.system,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const InitializeScreen(),
        ),
      ),
    );
  }
}
