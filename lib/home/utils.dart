import 'package:graphql_flutter/graphql_flutter.dart';

const verifyPhoneNumberMutation = """
    mutation VerifyUser(\$code: String!) {
      verifyUser(input: {
        code: \$code
      }) {
        success
      }
    }
  """;

const generateNewCodeMutation = """
    mutation GenerateNewCode {
      generateNewCode {
        code
      }
    }
""";

Future<void> verifyPhoneNumber({
  required GraphQLClient client,
  required String code,
}) async {
  final options = MutationOptions(
    document: gql(verifyPhoneNumberMutation),
    variables: <String, dynamic>{
      'code': code,
    },
  );
  try {
    final result = await client.mutate(options);
    if (result.hasException) {
      throw result.exception!;
    }

    if (result.data?['verifyUser']['success'] == false) {
      throw Exception('Failed to verify phone number');
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> generateNewCode({
  required GraphQLClient client,
}) async {
  final options = MutationOptions(
    document: gql(generateNewCodeMutation),
  );
  try {
    await client.mutate(options);
  } catch (e) {
    rethrow;
  }
}
