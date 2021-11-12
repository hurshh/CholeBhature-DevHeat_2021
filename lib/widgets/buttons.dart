import 'package:flutter/material.dart';

class AuthenticationPageButton extends StatefulWidget {
  void Function() onPressed;
  String label;
  Color colour;

  AuthenticationPageButton({required this.onPressed,required this.label, required this.colour});

  @override
  _AuthenticationPageButtonState createState() => _AuthenticationPageButtonState();
}

class _AuthenticationPageButtonState extends State<AuthenticationPageButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.colour,
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        onPressed: widget.onPressed,
        minWidth: double.infinity,
        height: 38,
        child: Text(widget.label,style: TextStyle(fontSize: 18,),),
      ),
    );
  }
}
