import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:async';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserModel with ChangeNotifier {
  String id;
  String _username;
  static const String FIREBASE_SIGNIN_URL =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword';
  static const String FIREBASE_API_KEY =
      'AIzaSyAP-e1B-iwRYn82wlooyOrXa20pXh8j-nY';
  String get username => _username;
  set username(String username) {
    _username = username;
    notifyListeners();
  }

  String _password;
  String get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String loginToken;
  String team;

  Status _status = Status.Uninitialized;
  Status get status => _status;
  void printJson(jsonData) {
    JSON.JsonEncoder encoder = JSON.JsonEncoder.withIndent('  ');
    String prettyPrint = encoder.convert(jsonData);
    print(prettyPrint);
  }

  Future<dynamic> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      // login firebase Auth REST API
      // ...
      var body = {
        'key': FIREBASE_API_KEY,
        'email': 'phillip7.et@gmail.com',
        'password': '12345678',
      };
      var uri = Uri.parse(FIREBASE_SIGNIN_URL);
      uri = uri.replace(queryParameters: body);
      print('Logining...');
      final response = await http.post(uri);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        print('Login successfully');
        printJson(JSON.jsonDecode((response.body)));
      } else {
        // If that response was not OK, throw an error.
        print('Login Failed');
        printJson(response.statusCode);
        printJson(response.body);
      }
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e);
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
