import 'package:graphql_flutter/graphql_flutter.dart';

const createUserQuery = """
    mutation CreateUser(\$username: String!, \$phoneNumber: String!, \$password: String!) {
      createUser(input: {
        username: \$username,
        phoneNumber: \$phoneNumber,
        password: \$password
      }) {
        token
      }
    }
  """;

const getUserIdQuery = """
    query GetUser {
      getUser {
        id
      }
    }
  """;

Future<String> signUpUser({
  required String username,
  required String phoneNumber,
  required String password,
  required GraphQLClient client,
}) async {
  final options = MutationOptions(
    document: gql(createUserQuery),
    variables: <String, dynamic>{
      'username': username,
      'phoneNumber': phoneNumber,
      'password': password,
    },
  );

  try {
    final result = await client.mutate(options);

    if (result.hasException) {
      // GraphQL-specific error handling
      throw result.exception!;
    }

    final token = result.data?['createUser']['token'];

    if (token == null) {
      throw Exception('Token is null');
    }

    return token;
  } on OperationException catch (e) {
    final message = e.graphqlErrors.first.message;

    switch (message) {
      case "username taken":
        throw UsernameException(message);
      case "phone number taken":
        throw PhoneNumberException(message);
      default:
        rethrow;
    }
  } catch (e) {
    rethrow;
  }
}

Future<String> getUserId({
  required GraphQLClient client,
}) async {
  final options = QueryOptions(
    document: gql(getUserIdQuery),
  );

  try {
    final result = await client.query(options);

    if (result.hasException) {
      // GraphQL-specific error handling
      throw result.exception!;
    }

    final userId = result.data?['getUser']['id'];

    return userId;
  } catch (e) {
    print("Error: $e");
    rethrow;
  }
}

class UsernameException implements Exception {
  UsernameException(this.message);

  final String message;
  @override
  String toString() => 'UsernameException: $message';
}

class PhoneNumberException implements Exception {
  PhoneNumberException(this.message);

  final String message;
  @override
  String toString() => 'PhoneNumberException: $message';
}
