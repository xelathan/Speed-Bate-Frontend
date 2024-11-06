import 'package:flutter/widgets.dart';

enum UserMatchingStatus {
  free,
  matching,
  matched,
}

class UserModel extends ChangeNotifier {
  final String userId;
  UserMatchingStatus matchingStatus = UserMatchingStatus.free;

  UserModel(this.userId);

  void matchFound(String opponentId, String matchId) {
    opponentId = opponentId;
    matchId = matchId;
    notifyListeners();
  }

  set setMatchingStatus(UserMatchingStatus _matchingStatus) {
    matchingStatus = _matchingStatus;
    notifyListeners();
  }
}
