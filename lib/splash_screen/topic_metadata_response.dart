import 'package:json_annotation/json_annotation.dart';

part 'topic_metadata_response.g.dart';

@JsonSerializable()
class TopicMetadataResponse {
  final String Topic;
  final List<Partition> Partitions;
  final Map<String, dynamic> Error;

  TopicMetadataResponse({
    required this.Topic,
    required this.Partitions,
    required this.Error,
  });

  factory TopicMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$TopicMetadataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopicMetadataResponseToJson(this);
}

@JsonSerializable()
class Partition {
  final int ID;
  final Map<String, dynamic> Error;
  final int Leader;
  final List<int> Replicas;
  final List<int> Isrs;

  Partition({
    required this.ID,
    required this.Error,
    required this.Leader,
    required this.Replicas,
    required this.Isrs,
  });

  factory Partition.fromJson(Map<String, dynamic> json) =>
      _$PartitionFromJson(json);

  Map<String, dynamic> toJson() => _$PartitionToJson(this);
}
