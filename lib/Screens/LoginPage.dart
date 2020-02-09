import 'package:ata/Widgets/Login/EmailField.dart';
import 'package:ata/Widgets/Login/LoginButton.dart';
import 'package:ata/Widgets/Login/PasswordField.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
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
                EmailField(),
                SizedBox(height: 25.0),
                PasswordField(),
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
