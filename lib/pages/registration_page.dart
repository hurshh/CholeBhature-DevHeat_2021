import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/registration_doctor.dart';
import 'package:healthe/pages/registration_user.dart';
import 'package:healthe/widgets/buttons.dart';

class RegistrationPage extends StatefulWidget {
  static String id = 'Registration Page';
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('You are registering for?',style: TextStyle(color: Colors.white,fontSize: 28),)),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 35, 35, 10),
            child: AuthenticationPageButton(
                onPressed: (){
                  //TODO add route to patient registration
                  Navigator.pushNamed(context, UserRegistration.id);
                },
                label: 'Patient', colour: myTurqoise),
          ),
          Center(child: Text('or',style: TextStyle(color: Colors.white,fontSize: 28),)),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: AuthenticationPageButton(
                onPressed: (){
                  //TODO add route to doctor registration
                  Navigator.pushNamed(context, DoctorRegistrationPage.id);
                },
                label: 'Doctor',
                colour: myTurqoise),
          ),
        ],
      ),
    );
  }
}
