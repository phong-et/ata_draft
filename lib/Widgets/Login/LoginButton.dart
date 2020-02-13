import 'package:ata/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:ata/Widgets/ATA.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  final String label;
  const LoginButton({this.label = "Login"});
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: ATA.CONTENT_PADDING,
        onPressed: () async {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          //Navigator.pushReplacementNamed(context, '/home');
          bool status = await userModel.signIn(userModel.username, userModel.password);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(title: Text("Dialog"), content:Text('''
                    username = ${userModel.username}
                    password = ${userModel.password}
                    login status : $status
                    '''));
              });
        },
        child: Text(label,
            textAlign: TextAlign.center,
            style: ATA.TEXT_STYLE
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
