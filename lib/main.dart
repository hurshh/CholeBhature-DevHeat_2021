import 'package:flutter/material.dart';
import 'package:healthe/pages/authenticaton_page.dart';
import 'package:healthe/pages/inbox.dart';
import 'package:healthe/pages/loading_page.dart';
import 'package:healthe/pages/login_page.dart';
import 'package:healthe/pages/registration_doctor.dart';
import 'package:healthe/pages/registration_page.dart';
import 'package:healthe/pages/registration_user.dart';
import 'package:healthe/pages/user_dashboard_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        centerTitle: true,
      )
    ),
    initialRoute: UserDashBoard.id,
    routes: {
      LoadingPage.id : (context) => LoadingPage(),
      AuthenticationPage.id : (context) => AuthenticationPage(),
      LoginPage.id : (context) => LoginPage(),
      RegistrationPage.id : (context) => RegistrationPage(),
      DoctorRegistrationPage.id : (context) => DoctorRegistrationPage(),
      UserRegistration.id : (context) => UserRegistration(),
      UserDashBoard.id : (context) => UserDashBoard(),
    },
  ));
}

