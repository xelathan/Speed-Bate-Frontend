import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:speed_bate_frontend/primitives/http.dart';
import 'package:uuid/uuid.dart';

class GraphQlClientProvider extends ChangeNotifier {
  GraphQLClient? _client;
  GraphQLClient get client => _client!;
  static String clientId = const Uuid().v4();

  GraphQlClientProvider()
      : _client = GraphQLClient(
          cache: GraphQLCache(),
          link: _httpLink,
        );

  static final HttpLink _httpLink = HttpLink(
    '$HTTP_BASE_URL$HOST:$ACCOUNTS_API_PORT/query',
    defaultHeaders: {
      'X-Client-Id': clientId,
    },
  );

  void upgradeProtected(String jwtToken) {
    // Set the token in the headers with AuthLink
    final Link authLink = AuthLink(
      getToken: () async => 'Bearer $jwtToken',
    );

    // Chain AuthLink with HttpLink
    final Link link = authLink.concat(_httpLink);

    // Create GraphQLClient with the chain of links
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
    notifyListeners();
  }

  void downgradeProtected() {
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink,
    );
    notifyListeners();
  }
}
