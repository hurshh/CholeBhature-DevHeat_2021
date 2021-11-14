import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/doctor_dashboardbody.dart';
import 'package:healthe/util/firebase_authentication.dart';
import 'package:healthe/util/user_data.dart';
import 'package:healthe/widgets/user_dashboard_drawer.dart';

import 'inbox.dart';

class DoctorDashBoard extends StatefulWidget {
  static String id = "doc dash";
  const DoctorDashBoard({Key? key}) : super(key: key);

  @override
  _DoctorDashBoardState createState() => _DoctorDashBoardState();
}

class _DoctorDashBoardState extends State<DoctorDashBoard> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    print(DocField);
    setState(() {
      //TODO if index == 2 forward it to chat feature
      _selectedIndex = index;
    });
  }

  Widget selectBody(int index){
    if(index==0){
      return DoctorHome();
    }
    else{
      return Inbox();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

