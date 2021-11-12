import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:healthe/constants/colors.dart';

class EmailTextfield extends StatefulWidget {
  void Function(String) onChanged;
  String label;

  EmailTextfield({required this.onChanged, required this.label});

  @override
  _EmailTextfieldState createState() => _EmailTextfieldState();
}

class _EmailTextfieldState extends State<EmailTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        label: Container(child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text('email'),
        ),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),),
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.black,fontSize: 18,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  void Function(String) onChanged;
  String label;

  PasswordTextField({required this.onChanged, required this.label});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      keyboardType: TextInputType.emailAddress,
      obscureText: !passwordVisible,
      decoration: InputDecoration(
        suffix: SizedBox(
          height: 9,
          width: 30,
          child: IconButton(icon: Icon(passwordVisible
              ? Icons.visibility
              : Icons.visibility_off,size: 20,),onPressed: (){setState(() {
            passwordVisible = !passwordVisible;
              });},
            padding: EdgeInsets.all(0),
          ),
        ),
        label: Container(child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(widget.label),
        ), decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),),
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.black,fontSize: 18,),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
      ),
    );
  }
}

class NumberTextField extends StatefulWidget {
  void Function(String) onChanged;
  String label;


  NumberTextField({required this.onChanged, required this.label});

  @override
  _NumberTextFieldState createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: Container(child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(widget.label),
        ),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),),
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.black,fontSize: 18,),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent,width: 0)
        ),
      ),
    );;
  }
}

