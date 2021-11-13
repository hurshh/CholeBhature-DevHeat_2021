import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/doctor_dashboard.dart';
import 'package:healthe/util/firebase_authentication.dart';
import 'package:healthe/widgets/buttons.dart';
import 'package:healthe/widgets/text_field.dart';

class DoctorRegistrationPage extends StatefulWidget {
  static String id = 'doctor registration';
  const DoctorRegistrationPage({Key? key}) : super(key: key);

  @override
  _DoctorRegistrationPageState createState() => _DoctorRegistrationPageState();
}

class _DoctorRegistrationPageState extends State<DoctorRegistrationPage> {
  String _docEmail = '';
  String _docUsername = '';
  String _docPass = '';
  String _docConPas = '';
  String _docDMC = '';
  String _docOTP = '';
  String _chosenValue = 'Psychiatrist';
  late EmailAuth emailAuth;
  bool _isOtp = false;

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _docEmail, otpLength: 5
    );
  }
  bool verify() {
    print(emailAuth.validateOtp(
        recipientMail: _docEmail,
        userOtp: _docOTP));
    return emailAuth.validateOtp(
        recipientMail: _docEmail,
        userOtp: _docOTP);
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
                  Text('Welcome doctor!',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
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
                        //TODO doc email function
                        _docEmail = email;
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
                    _docUsername = username;
                  }, label: 'Username'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: PasswordTextField(onChanged: (password){
                    //TODO doc password
                    _docPass = password;
                  }, label: 'Password'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: PasswordTextField(onChanged: (password){
                    //TODO doc confirm pass
                    _docConPas = password;
                  }, label: 'Confirm password'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: NumberTextField(onChanged: (dmcNumber){
                    //TODO doc DMC number
                    _docDMC = dmcNumber;
                  }, label: 'DMC numer'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: NumberTextField(onChanged: (otp){
                    //TODO doc otp
                    _docOTP = otp;
                  }, label: 'OTP'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Center(
                      child: DropdownButton(
                        focusColor:Colors.white,
                        dropdownColor: Colors.white,
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor:Colors.black,
                        items: <String>[
                          'Psychiatrist',
                          'Physicians',
                          'Dermatologists',
                          'Ophthalmologist',
                          'Pediatricians',
                          'Gynecologist',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style:TextStyle(color:Colors.black,fontSize: 18),),
                          );
                        }).toList(),
                        hint:Text(
                          "                                                                                   ",

                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _chosenValue = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: AuthenticationPageButton(onPressed: (){
                    //TODO submit button
                    _isOtp = verify();
                    if(_isOtp && _docPass==_docConPas){
                      auth.createUserWithEmailAndPassword(email: _docEmail, password: _docPass)
                          .then((value) => FirebaseFirestore.instance.collection('UserData').doc(_docEmail).set({
                        "email" : _docEmail,
                        "username" : _docUsername,
                        "role" : "doctor",
                        "dmc" : _docDMC,
                        "docfield" : _chosenValue,
                      }),);
                      Navigator.pushNamed(context, DoctorDashBoard.id);
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
