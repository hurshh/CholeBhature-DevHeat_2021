import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/login_page.dart';
import 'package:healthe/pages/registration_page.dart';
import 'package:healthe/pages/user_dashboard_page.dart';
import 'package:healthe/util/firebase_authentication.dart';
import 'package:healthe/widgets/buttons.dart';
import 'package:healthe/widgets/text_field.dart';

class AuthenticationPage extends StatefulWidget {
  static String id = 'Authentication Page';
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container(
            child: Image.asset('assets/SpinninHeart.gif'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(180),bottomLeft: Radius.circular(180)),
              color: Colors.white,
            ),
          ),
          ),
          Expanded(child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AuthenticationPageButton(
                      onPressed: (){
                        //TODO function of login button
                        if(auth.currentUser != null){
                          Navigator.pushNamed(context, UserDashBoard.id);
                        }
                        else{
                          Navigator.pushNamed(context, LoginPage.id);
                        }
                      }
                      , label: 'Log in',colour: Colors.white,),
                ),
                SizedBox(width: double.infinity,height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AuthenticationPageButton(
                      onPressed: (){
                        //TODO function of registeration button
                        if(auth.currentUser != null){
                          Navigator.pushNamed(context, UserDashBoard.id);
                        }
                        else{
                          Navigator.pushNamed(context, RegistrationPage.id);
                        }
                      }, label: 'Register',colour: myTurqoise,),
                ),
              ],
            ),
          ),
          )
        ],
      ),
    );
  }
}
