import 'package:flutter/material.dart';

class MyHealth extends StatefulWidget {
  const MyHealth({Key? key}) : super(key: key);

  @override
  _MyHealthState createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text('My Health',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),),
          )
        ],
      ),
    );
  }
}
