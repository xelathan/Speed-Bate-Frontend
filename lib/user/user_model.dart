import 'package:flutter/widgets.dart';

class UserModel extends ChangeNotifier {
  final String userId;
  String opponentId = "";
  String matchId = "";
  bool isMatching = false;

  UserModel(this.userId);

  void matchFound(String opponentId, String matchId) {
    opponentId = opponentId;
    matchId = matchId;
    notifyListeners();
  }

  set setIsMatching(bool _isMatching) {
    isMatching = _isMatching;
    notifyListeners();
  }
}
