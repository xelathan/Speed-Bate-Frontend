import 'package:flutter/widgets.dart';

enum UserMatchingStatus {
  free,
  matching,
  matched,
}

class User extends ChangeNotifier {
  late String _token;
  get token => _token;

  late String _id;
  get id => _id;

  late String _phoneNumber;
  get phoneNumber => _phoneNumber;

  late String _username;
  get username => _username;

  late bool _verified;
  bool get verified => _verified;

  UserMatchingStatus matchingStatus = UserMatchingStatus.free;

  User();

  void fromLogin(Map<String, dynamic> user, String token) {
    _token = token;
    _id = user['id'];
    _phoneNumber = user['phoneNumber'];
    _username = user['username'];
    _verified = user['verified'];
    notifyListeners();
  }

  void fromSignup({
    required String token,
    required String userId,
    required String username,
    required String phoneNumber,
  }) {
    _token = token;
    _id = userId;
    _username = username;
    _phoneNumber = phoneNumber;
    _verified = false;
    notifyListeners();
  }

  set setMatchingStatus(UserMatchingStatus ms) {
    matchingStatus = ms;
    notifyListeners();
  }

  set setToken(String token) {
    _token = token;
    notifyListeners();
  }

  set verified(bool verified) {
    _verified = verified;
    notifyListeners();
  }
}
