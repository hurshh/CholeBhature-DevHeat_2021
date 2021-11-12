import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/widgets/user_dashboard_drawer.dart';

Color activeColor = Colors.white;

class UserDashBoard extends StatefulWidget {
  static String id = 'userDashboard';
  const UserDashBoard({Key? key}) : super(key: key);

  @override
  _UserDashBoardState createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: activeColor,
      appBar: AppBar(
        //TODO insert image in app bar
        iconTheme: IconThemeData(color: myPink,size: 30),
      ),
      drawer: userDashBoard()
    );
  }
}
