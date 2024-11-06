import 'package:flutter/material.dart';

@immutable
class Message {
  const Message({
    required this.message,
    required this.userId,
    required this.opponentId,
    required this.matchId,
    required this.createdAt,
    required this.messageId,
    this.expired = false, // Default value for expired
  });

  final String message;
  final String userId;
  final String opponentId;
  final String matchId;
  final DateTime createdAt;
  final String messageId;
  final bool expired; // New field

  // Factory constructor to create a Message instance from JSON
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] as String,
      userId: json['user_id'] as String,
      opponentId: json['opponent_id'] as String,
      matchId: json['match_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      messageId: json['message_id'] as String,
      expired:
          json['expired'] as bool? ?? false, // Handle expired field from JSON
    );
  }

  // Method to convert a Message instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user_id': userId,
      'opponent_id': opponentId,
      'match_id': matchId,
      'created_at': createdAt.toIso8601String(),
      'message_id': messageId,
      'expired': expired, // Add expired field to JSON
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.message == message &&
        other.userId == userId &&
        other.opponentId == opponentId &&
        other.matchId == matchId &&
        other.messageId == messageId &&
        other.createdAt.isAtSameMomentAs(createdAt) &&
        other.expired == expired; // Include expired in equality check
  }

  @override
  int get hashCode => Object.hash(
        message,
        userId,
        opponentId,
        matchId,
        createdAt,
        messageId,
        expired, // Include expired in hash code
      );
}
