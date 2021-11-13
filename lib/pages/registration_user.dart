import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/user_dashboard_page.dart';
import 'package:healthe/util/firebase_authentication.dart';
import 'package:healthe/widgets/buttons.dart';
import 'package:healthe/widgets/text_field.dart';

class UserRegistration extends StatefulWidget {
  static String id = 'User Registration';

  const UserRegistration({Key? key}) : super(key: key);

  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  String _userRegisterEmail ="";
  String _userRegisterUsername ="";
  String _userRegisterPass ="";
  String _userRegisterConPass ="";
  String _userRegisterOtp ="";
  bool _isOTPcorrect = false;
  late EmailAuth emailAuth;

  // send OTP function
  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _userRegisterEmail, otpLength: 5
    );
  }
  bool verify() {
    print(emailAuth.validateOtp(
        recipientMail: _userRegisterEmail,
        userOtp: _userRegisterOtp));
    return emailAuth.validateOtp(
        recipientMail: _userRegisterEmail,
        userOtp: _userRegisterOtp);
  }
  @override
  void initState() {
    super.initState();
    emailAuth =  new EmailAuth(sessionName: "register to health-e");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPink,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome!',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
                    SizedBox(height: 14,),
                    Text('It\'s your first time here?\n    fill on some details',style: TextStyle(fontSize: 24),)
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
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(child: EmailTextfield(onChanged: (email){
                          //TODO Email Textbox Function
                          _userRegisterEmail = email;
                        }, label: 'Email'),flex: 5,),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 1,
                          child: RawMaterialButton(
                            onPressed: () {
                              //TODO send OTP button
                              sendOtp();
                            },
                            elevation: 2.0,
                            fillColor: myTurqoise,
                            child: Column(
                              children: [
                                Text('send',style: TextStyle(fontSize: 12),),
                                Text('OTP',style: TextStyle(fontSize: 12),),
                              ],
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    child: EmailTextfield(onChanged: (username){
                      //TODO username textfield function
                      _userRegisterUsername = username;
                    }, label: 'Username'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    child: PasswordTextField(onChanged: (password){
                      //TODO password
                      _userRegisterPass = password;
                    }, label: 'Password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    child: PasswordTextField(onChanged: (password){
                      //TODO confirm password
                      _userRegisterConPass = password;
                    }, label: 'Confirm password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                    child: NumberTextField(onChanged: (otp){
                      //TODO otp textfield
                      _userRegisterOtp = otp;
                    }, label: 'OTP'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                    child: AuthenticationPageButton(onPressed: (){
                      //TODO Submit button
                      _isOTPcorrect = verify();
                      if(_isOTPcorrect && _userRegisterPass==_userRegisterConPass){
                        auth.createUserWithEmailAndPassword(email: _userRegisterEmail, password: _userRegisterPass)
                            .then((value) => FirebaseFirestore.instance.collection('UserData').doc(_userRegisterEmail).set({
                          "email" : _userRegisterEmail,
                          "username" : _userRegisterUsername,
                          "role" : "user",
                        }),
                        );
                        Navigator.pushNamed(context, UserDashBoard.id);
                      }

                    }, label: 'Submit', colour: myTurqoise),
                  ),
                  Text('',style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedBox(height: 20,),
                ],
              )
            ],
          ),
        ),
    );
  }
}
