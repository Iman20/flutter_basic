import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String title;
  CustomButton({this.title});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: (){}, child: Text(title),);
  }
}