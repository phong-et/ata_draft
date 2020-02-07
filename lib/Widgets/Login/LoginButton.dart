import 'package:flutter/material.dart';
import 'package:ata/Widgets/ATA.dart';

class LoginButton extends StatelessWidget {
  final String label;
  const LoginButton({this.label = "Login"});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: ATA.CONTENT_PADDING,
        onPressed: () {},
        child: Text(label,
            textAlign: TextAlign.center,
            style: ATA.TEXT_STYLE
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
