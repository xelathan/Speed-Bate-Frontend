import 'package:graphql_flutter/graphql_flutter.dart';

const loginUserQuery = """
    query LoginUser(\$phoneNumber: String!, \$password: String!) {
      loginUser(input: {
        phoneNumber: \$phoneNumber,
        password: \$password
      }) {
        token
      }
    }
  """;

Future<String> loginUser({
  required String phoneNumber,
  required String password,
  required GraphQLClient client,
}) async {
  final options = MutationOptions(
    document: gql(loginUserQuery),
    variables: <String, dynamic>{
      'phoneNumber': phoneNumber,
      'password': password,
    },
  );

  try {
    final result = await client.mutate(options);

    if (result.hasException) {
      // GraphQL-specific error handling
      throw Exception('GraphQL error: ${result.exception.toString()}');
    }

    // If no exception, return token
    final token = result.data?['loginUser']['token'];
    if (token == null) {
      throw Exception('Login failed, no token received');
    }

    return token; // Return the token
  } catch (e) {
    // Handle different types of exceptions
    return e.toString(); // Return the exception message
  }
}
