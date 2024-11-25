import 'package:flutter/widgets.dart';

enum UserMatchingStatus {
  free,
  matching,
  matched,
}

class User extends ChangeNotifier {
  late String token;
  late String id;
  late String phoneNumber;
  late String username;
  late bool verified;
  UserMatchingStatus matchingStatus = UserMatchingStatus.free;

  User();

  void fromLogin(Map<String, dynamic> user, String tk) {
    token = tk;
    id = user['id'];
    phoneNumber = user['phoneNumber'];
    username = user['username'];
    verified = user['verified'];
    notifyListeners();
  }

  void fromSignup({
    required String tk,
    required String userId,
    required String name,
    required String pn,
  }) {
    token = tk;
    id = userId;
    username = name;
    phoneNumber = pn;
    verified = false;
    notifyListeners();
  }

  set setMatchingStatus(UserMatchingStatus ms) {
    matchingStatus = ms;
    notifyListeners();
  }

  void setToken(String token) {
    this.token = token;
    notifyListeners();
  }
}
