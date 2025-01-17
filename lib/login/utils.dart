import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:speed_bate_frontend/encryption/encryption.dart';

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

const getUserDataQuery = """
    query GetUser {
      getUser {
        id,
        username,
        phoneNumber,
        verified
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
      throw result.exception!;
    }

    // If no exception, return token
    final token = result.data?['loginUser']['token'];
    if (token == null) {
      throw Exception('Login failed, no token received');
    }

    return token; // Return the token
  } on OperationException catch (e) {
    final message = e.graphqlErrors.first.message;

    switch (message) {
      case "wrong password":
        throw PasswordException(message);
      case "phone number not found":
        throw PhoneNumberException(message);
      default:
        rethrow;
    }
  } catch (e) {
    rethrow;
  }
}

Future<Map<String, dynamic>> getUserData({
  required GraphQLClient client,
}) async {
  final options = QueryOptions(
    document: gql(getUserDataQuery),
  );

  try {
    final result = await client.query(options);

    if (result.hasException) {
      // GraphQL-specific error handling
      throw result.exception!;
    }

    final encryptionKey = dotenv.env['SYMMETRIC_ENCRYPTION_KEY'];

    result.data?['getUser']['phoneNumber'] = symmetricDecryptAES(
      result.data?['getUser']['phoneNumber'],
      encryptionKey!,
    );

    return result.data?['getUser'];
  } catch (e) {
    print("Error: $e");
    rethrow;
  }
}

class PasswordException implements Exception {
  PasswordException(this.message);

  final String message;

  @override
  String toString() => 'PasswordException: $message';
}

class PhoneNumberException implements Exception {
  PhoneNumberException(this.message);

  final String message;
  @override
  String toString() => 'PhoneNumberException: $message';
}
