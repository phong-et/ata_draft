import 'package:flutter/widgets.dart';
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserModel with ChangeNotifier {
  String id;
  String username;
  String password;
  String loginToken;
  String team;

  Status _status = Status.Uninitialized;
  Status get status => _status;
  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      // login firebase Auth REST API
      // ...
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    // logout firebase Auth REST API
    // ...
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);

  }
}