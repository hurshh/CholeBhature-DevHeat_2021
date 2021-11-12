import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/registration_page.dart';
import 'package:healthe/widgets/buttons.dart';
import 'package:healthe/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  static String id = 'Login Page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPink,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hello!',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
                  SizedBox(height: 14,),
                  Text('you\'ll fell better soon',style: TextStyle(fontSize: 24),)
                ],
              ),
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(180),bottomLeft: Radius.circular(180)),
                color: Colors.white,
              ),
            ),
            SizedBox(height: 100,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: EmailTextfield(
                    onChanged: (email){
                      //TODO function of login email
                    },
                    label: 'Email',),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: PasswordTextField(
                      onChanged: (password){
                        //TODO function of login password
                      },
                      label: 'Password'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 34, 18, 20),
                  child: AuthenticationPageButton(
                    onPressed: (){
                      //TODO function of Log in button
                    }, label: 'Log in',colour: myTurqoise,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('not a member? ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                        onPressed: (){
                          //TODO reigster now button functionality
                          Navigator.pushNamed(context, RegistrationPage.id);
                        },
                        child: Text('Register now',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: myTurqoise),),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
