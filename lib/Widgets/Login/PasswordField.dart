import 'package:flutter/material.dart';
import 'package:ata/Widgets/ATA.dart';

class PasswordField extends StatelessWidget {
  final String label;
  const PasswordField({this.label = "Password"});
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: false,
        style: ATA.TEXT_STYLE,
        decoration: InputDecoration(
            contentPadding: ATA.CONTENT_PADDING,
            hintText: label,
            border: ATA.outLineInputBorder));
  }
}
