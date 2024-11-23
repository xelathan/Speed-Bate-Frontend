import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:speed_bate_frontend/chat/middleware.dart';
import 'package:speed_bate_frontend/home/middleware.dart';
import 'package:speed_bate_frontend/login/login.dart';
import 'package:speed_bate_frontend/primitives/http.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';
import 'package:speed_bate_frontend/reducer.dart';
import 'package:speed_bate_frontend/splash_screen/middleware.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/splash_screen/splash_screen.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:uuid/uuid.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gql;

final store = Store<AppState>(
  reducer,
  initialState: AppState.initial(),
  middleware: [
    splashScreenMiddleware,
    homeScreenMiddleware,
    chatMiddleware,
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await gql.initHiveForFlutter();

  final httpLink = gql.HttpLink(
    '$HTTP_BASE_URL/$HOST:$STREAM_API_PORT/query',
  );

  final client = gql.GraphQLClient(
    cache: gql.GraphQLCache(store: gql.HiveStore()),
    link: httpLink,
  );

  runApp(
    App(
      client: client,
    ),
  );
}

class App extends StatelessWidget {
  const App({
    required this.client,
    super.key,
  });

  final gql.GraphQLClient client;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserModel(
            const Uuid().v4(),
          ),
        ),
        Provider.value(
          value: client,
        ),
      ],
      child: StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Speed Bate',
          themeMode: ThemeMode.system,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const Login(),
        ),
      ),
    );
  }
}
