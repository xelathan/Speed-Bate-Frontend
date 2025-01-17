import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:speed_bate_frontend/chat/middleware.dart';
import 'package:speed_bate_frontend/graphql/client.dart';
import 'package:speed_bate_frontend/home/middleware.dart';
import 'package:speed_bate_frontend/login/middleware.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';
import 'package:speed_bate_frontend/reducer.dart';
import 'package:speed_bate_frontend/signup/middleware.dart';
import 'package:speed_bate_frontend/splash_screen/middleware.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/splash_screen/splash_screen.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gql;

final store = Store<AppState>(
  reducer,
  initialState: AppState.initial(),
  middleware: [
    splashScreenMiddleware,
    homeScreenMiddleware,
    chatMiddleware,
    loginMiddleware,
    signupMiddleware,
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await gql.initHiveForFlutter();

  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GraphQlClientProvider(),
        ),
        ChangeNotifierProvider.value(
          value: User(),
        )
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
