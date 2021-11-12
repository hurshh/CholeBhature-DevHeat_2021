import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/widgets/buttons.dart';
import 'package:healthe/widgets/text_field.dart';

class DoctorRegistrationPage extends StatefulWidget {
  static String id = 'doctor registration';
  const DoctorRegistrationPage({Key? key}) : super(key: key);

  @override
  _DoctorRegistrationPageState createState() => _DoctorRegistrationPageState();
}

class _DoctorRegistrationPageState extends State<DoctorRegistrationPage> {
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
                      Expanded(child: EmailTextfield(onChanged: (email){}, label: 'Email'),flex: 5,),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 1,
                        child: RawMaterialButton(
                          onPressed: () {},
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
                  child: PasswordTextField(onChanged: (password){}, label: 'Password'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: PasswordTextField(onChanged: (password){}, label: 'Confirm password'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: NumberTextField(onChanged: (dmcNumber){}, label: 'DMC numer'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: NumberTextField(onChanged: (otp){}, label: 'OTP'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                  child: AuthenticationPageButton(onPressed: (){}, label: 'Submit', colour: myTurqoise),
                ),
                Text('error message',style: TextStyle(color: Colors.white,fontSize: 20),),
                SizedBox(height: 20,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
