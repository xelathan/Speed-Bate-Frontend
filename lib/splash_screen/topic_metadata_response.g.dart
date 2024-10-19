// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_metadata_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicMetadataResponse _$TopicMetadataResponseFromJson(
        Map<String, dynamic> json) =>
    TopicMetadataResponse(
      Topic: json['Topic'] as String,
      Partitions: (json['Partitions'] as List<dynamic>)
          .map((e) => Partition.fromJson(e as Map<String, dynamic>))
          .toList(),
      Error: json['Error'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TopicMetadataResponseToJson(
        TopicMetadataResponse instance) =>
    <String, dynamic>{
      'Topic': instance.Topic,
      'Partitions': instance.Partitions,
      'Error': instance.Error,
    };

Partition _$PartitionFromJson(Map<String, dynamic> json) => Partition(
      ID: (json['ID'] as num).toInt(),
      Error: json['Error'] as Map<String, dynamic>,
      Leader: (json['Leader'] as num).toInt(),
      Replicas: (json['Replicas'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      Isrs: (json['Isrs'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$PartitionToJson(Partition instance) => <String, dynamic>{
      'ID': instance.ID,
      'Error': instance.Error,
      'Leader': instance.Leader,
      'Replicas': instance.Replicas,
      'Isrs': instance.Isrs,
    };
