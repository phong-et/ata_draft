import 'package:ata/Models/User.dart';
import 'package:ata/Widgets/Login/EmailField.dart';
import 'package:ata/Widgets/Login/LoginButton.dart';
import 'package:ata/Widgets/Login/PasswordField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Attedance Tracking App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                EmailField(value:userModel.username),
                SizedBox(height: 25.0),
                PasswordField(value:userModel.password),
                SizedBox(
                  height: 35.0,
                ),
                LoginButton(),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
      //resizeToAvoidBottomPadding: false 
    );
  }
}
