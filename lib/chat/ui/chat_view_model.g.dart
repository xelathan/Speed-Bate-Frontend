// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$ChatViewModel {
  const _$ChatViewModel();

  String get userId;
  String get opponentId;
  String get matchId;
  String get debateTopic;
  VoidCallback get onMatchEnd;
  VoidCallback get initialize;
  VoidCallback get onLeaveMatch;
  ChatMatchStatus get chatMatchStatus;
  void Function(ChatMatchStatus) get setChatMatchStatus;
  VoidCallback get showHelp;

  ChatViewModel copyWith({
    String? userId,
    String? opponentId,
    String? matchId,
    String? debateTopic,
    VoidCallback? onMatchEnd,
    VoidCallback? initialize,
    VoidCallback? onLeaveMatch,
    ChatMatchStatus? chatMatchStatus,
    void Function(ChatMatchStatus)? setChatMatchStatus,
    VoidCallback? showHelp,
  }) =>
      ChatViewModel(
        userId: userId ?? this.userId,
        opponentId: opponentId ?? this.opponentId,
        matchId: matchId ?? this.matchId,
        debateTopic: debateTopic ?? this.debateTopic,
        onMatchEnd: onMatchEnd ?? this.onMatchEnd,
        initialize: initialize ?? this.initialize,
        onLeaveMatch: onLeaveMatch ?? this.onLeaveMatch,
        chatMatchStatus: chatMatchStatus ?? this.chatMatchStatus,
        setChatMatchStatus: setChatMatchStatus ?? this.setChatMatchStatus,
        showHelp: showHelp ?? this.showHelp,
      );

  ChatViewModel copyUsing(void Function(_ChatViewModel$Change change) mutator) {
    final change = _ChatViewModel$Change._(
      this.userId,
      this.opponentId,
      this.matchId,
      this.debateTopic,
      this.onMatchEnd,
      this.initialize,
      this.onLeaveMatch,
      this.chatMatchStatus,
      this.setChatMatchStatus,
      this.showHelp,
    );
    mutator(change);
    return ChatViewModel(
      userId: change.userId,
      opponentId: change.opponentId,
      matchId: change.matchId,
      debateTopic: change.debateTopic,
      onMatchEnd: change.onMatchEnd,
      initialize: change.initialize,
      onLeaveMatch: change.onLeaveMatch,
      chatMatchStatus: change.chatMatchStatus,
      setChatMatchStatus: change.setChatMatchStatus,
      showHelp: change.showHelp,
    );
  }

  @override
  String toString() =>
      "ChatViewModel(userId: $userId, opponentId: $opponentId, matchId: $matchId, debateTopic: $debateTopic, onMatchEnd: $onMatchEnd, initialize: $initialize, onLeaveMatch: $onLeaveMatch, chatMatchStatus: $chatMatchStatus, setChatMatchStatus: $setChatMatchStatus, showHelp: $showHelp)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is ChatViewModel &&
      other.runtimeType == runtimeType &&
      userId == other.userId &&
      opponentId == other.opponentId &&
      matchId == other.matchId &&
      debateTopic == other.debateTopic &&
      onMatchEnd == other.onMatchEnd &&
      initialize == other.initialize &&
      onLeaveMatch == other.onLeaveMatch &&
      chatMatchStatus == other.chatMatchStatus &&
      setChatMatchStatus == other.setChatMatchStatus &&
      showHelp == other.showHelp;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + userId.hashCode;
    result = 37 * result + opponentId.hashCode;
    result = 37 * result + matchId.hashCode;
    result = 37 * result + debateTopic.hashCode;
    result = 37 * result + onMatchEnd.hashCode;
    result = 37 * result + initialize.hashCode;
    result = 37 * result + onLeaveMatch.hashCode;
    result = 37 * result + chatMatchStatus.hashCode;
    result = 37 * result + setChatMatchStatus.hashCode;
    result = 37 * result + showHelp.hashCode;
    return result;
  }
}

class _ChatViewModel$Change {
  _ChatViewModel$Change._(
    this.userId,
    this.opponentId,
    this.matchId,
    this.debateTopic,
    this.onMatchEnd,
    this.initialize,
    this.onLeaveMatch,
    this.chatMatchStatus,
    this.setChatMatchStatus,
    this.showHelp,
  );

  String userId;
  String opponentId;
  String matchId;
  String debateTopic;
  VoidCallback onMatchEnd;
  VoidCallback initialize;
  VoidCallback onLeaveMatch;
  ChatMatchStatus chatMatchStatus;
  void Function(ChatMatchStatus) setChatMatchStatus;
  VoidCallback showHelp;
}

// ignore: avoid_classes_with_only_static_members
class ChatViewModel$ {
  static final userId = Lens<ChatViewModel, String>(
    (userIdContainer) => userIdContainer.userId,
    (userIdContainer, userId) => userIdContainer.copyWith(userId: userId),
  );

  static final opponentId = Lens<ChatViewModel, String>(
    (opponentIdContainer) => opponentIdContainer.opponentId,
    (opponentIdContainer, opponentId) =>
        opponentIdContainer.copyWith(opponentId: opponentId),
  );

  static final matchId = Lens<ChatViewModel, String>(
    (matchIdContainer) => matchIdContainer.matchId,
    (matchIdContainer, matchId) => matchIdContainer.copyWith(matchId: matchId),
  );

  static final debateTopic = Lens<ChatViewModel, String>(
    (debateTopicContainer) => debateTopicContainer.debateTopic,
    (debateTopicContainer, debateTopic) =>
        debateTopicContainer.copyWith(debateTopic: debateTopic),
  );

  static final onMatchEnd = Lens<ChatViewModel, VoidCallback>(
    (onMatchEndContainer) => onMatchEndContainer.onMatchEnd,
    (onMatchEndContainer, onMatchEnd) =>
        onMatchEndContainer.copyWith(onMatchEnd: onMatchEnd),
  );

  static final initialize = Lens<ChatViewModel, VoidCallback>(
    (initializeContainer) => initializeContainer.initialize,
    (initializeContainer, initialize) =>
        initializeContainer.copyWith(initialize: initialize),
  );

  static final onLeaveMatch = Lens<ChatViewModel, VoidCallback>(
    (onLeaveMatchContainer) => onLeaveMatchContainer.onLeaveMatch,
    (onLeaveMatchContainer, onLeaveMatch) =>
        onLeaveMatchContainer.copyWith(onLeaveMatch: onLeaveMatch),
  );

  static final chatMatchStatus = Lens<ChatViewModel, ChatMatchStatus>(
    (chatMatchStatusContainer) => chatMatchStatusContainer.chatMatchStatus,
    (chatMatchStatusContainer, chatMatchStatus) =>
        chatMatchStatusContainer.copyWith(chatMatchStatus: chatMatchStatus),
  );

  static final setChatMatchStatus =
      Lens<ChatViewModel, void Function(ChatMatchStatus)>(
    (setChatMatchStatusContainer) =>
        setChatMatchStatusContainer.setChatMatchStatus,
    (setChatMatchStatusContainer, setChatMatchStatus) =>
        setChatMatchStatusContainer.copyWith(
            setChatMatchStatus: setChatMatchStatus),
  );

  static final showHelp = Lens<ChatViewModel, VoidCallback>(
    (showHelpContainer) => showHelpContainer.showHelp,
    (showHelpContainer, showHelp) =>
        showHelpContainer.copyWith(showHelp: showHelp),
  );
}
