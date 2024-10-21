import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:speed_bate_frontend/primitives/http.dart';
import 'package:speed_bate_frontend/splash_screen/topic_metadata_response.dart';

Future<Map<String, TopicMetadataResponse>> getMultipleTopicMetaData(
    List<String> topicNames) async {
  List<Future<MapEntry<String, TopicMetadataResponse>>> futures =
      topicNames.map((topicName) {
    return getTopicMetaData(topicName)
        .then((metadata) => MapEntry(topicName, metadata));
  }).toList();

  try {
    List<MapEntry<String, TopicMetadataResponse>> results =
        await Future.wait(futures);

    await Future.delayed(const Duration(seconds: 2));

    return Map.fromEntries(results);
  } catch (e) {
    print('Error fetching topic metadata: $e');
    return {};
  }
}

// Fetch metadata for a single topic
Future<TopicMetadataResponse> getTopicMetaData(String topicName) async {
  Map<String, String> queryParams = {
    'topic_name': topicName,
  };

  var uri =
      Uri.parse('$API_BASE_URL/$API_VERSION/initialize/get_topic_metadata')
          .replace(queryParameters: queryParams);

  try {
    print(dotenv.env['API_KEY']);
    final response = await http.post(
      uri,
      body: jsonEncode(queryParams),
      headers: {
        'x-api-key': dotenv.env['API_KEY']!,
      },
    );

    if (response.statusCode == 200) {
      final jsonRes = jsonDecode(response.body);
      return TopicMetadataResponse.fromJson(jsonRes);
    } else {
      throw Exception('Failed to fetch topic metadata for $topicName');
    }
  } catch (e) {
    throw Exception(e);
  }
}
