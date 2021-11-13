import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/authenticaton_page.dart';
import 'package:healthe/pages/user_dashboard_page.dart';
import 'package:healthe/util/firebase_authentication.dart';

class userDashBoard extends StatefulWidget {
  const userDashBoard({Key? key}) : super(key: key);

  @override
  _userDashBoardState createState() => _userDashBoardState();
}

class _userDashBoardState extends State<userDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: myPink,
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: AccentMyPink,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Container(child: Center(child: Text('quasarhrsh@gmail.com',style: TextStyle(color: activeColor,fontSize: 26),)),height: 50,)),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.settings,color: activeColor,),
                SizedBox(width: 6,),
                Text('settings',style: TextStyle(color: activeColor,fontSize: 20),),
              ],
            ),
            onTap: (){
              //TODO drawer Settings function
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.logout_rounded,color: activeColor,),
                SizedBox(width: 6,),
                Text('log out',style: TextStyle(color: activeColor,fontSize: 20),),
              ],
            ),
            onTap: (){
              //TODO drawer Logout function
              auth.signOut();
              Navigator.pushNamed(context, AuthenticationPage.id);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.info_rounded,color: activeColor,),
                SizedBox(width: 6,),
                Text('about',style: TextStyle(color: activeColor,fontSize: 20),),
              ],
            ),
            onTap: (){
              //TODO drawer About function
            },
          ),
        ],
      ),
    );
  }
}
