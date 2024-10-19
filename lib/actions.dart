import 'package:speed_bate_frontend/splash_screen/topic_metadata_response.dart';

sealed class AppActions {}

class UpdateTopicMetaData implements AppActions {
  final TopicMetadataResponse chatroomCreationMetaData;
  final TopicMetadataResponse realTimeMessagingMetaData;
  final TopicMetadataResponse matchmakingMetaData;

  UpdateTopicMetaData(
    this.chatroomCreationMetaData,
    this.realTimeMessagingMetaData,
    this.matchmakingMetaData,
  );
}
