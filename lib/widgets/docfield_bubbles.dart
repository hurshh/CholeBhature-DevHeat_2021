import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';

class DocFieldBubbles extends StatefulWidget {
  void Function() onPressed;
  String label;


  DocFieldBubbles({required this.onPressed, required this.label});

  @override
  _DocFieldBubblesState createState() => _DocFieldBubblesState();
}

class _DocFieldBubblesState extends State<DocFieldBubbles> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(6),
        onPressed: widget.onPressed,
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AccentMyPink,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text(widget.label,style: TextStyle(fontSize: 18),)),
        ));
  }
}
