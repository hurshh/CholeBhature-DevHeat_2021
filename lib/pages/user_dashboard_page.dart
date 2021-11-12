import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/home_dashboard_page.dart';
import 'package:healthe/pages/inbox.dart';
import 'package:healthe/pages/myHealth_dashboard_page.dart';
import 'package:healthe/widgets/user_dashboard_drawer.dart';

Color activeColor = Colors.white;

class UserDashBoard extends StatefulWidget {
  static String id = 'userDashboard';
  const UserDashBoard({Key? key}) : super(key: key);

  @override
  _UserDashBoardState createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {


  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      //TODO if index == 2 forward it to chat feature
      _selectedIndex = index;
    });
  }

  Widget selectBody(int index){
    if(index==0){
      return HomeBody();
    }
    else if(index==1){
      return MyHealth();
    }
    else{
      return Inbox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: activeColor,
      appBar: AppBar(
        //TODO insert image in app bar
        title: Image.asset('assets/health-e.png',fit: BoxFit.fitHeight,height: 40,width: 40,),
        iconTheme: IconThemeData(color: myPink,size: 30),
      ),




      drawer: userDashBoard(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: myPink,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox_rounded),
            label: 'Inbox',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: myTurqoise,
        onTap: _onItemTapped,
      ),



      body: selectBody(_selectedIndex),
    );
  }
}
