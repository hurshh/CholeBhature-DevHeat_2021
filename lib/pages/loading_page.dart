import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/authenticaton_page.dart';
class LoadingPage extends StatefulWidget {
  static String id = 'Loding Page';
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> paddingAnim;
  late final Animation<double> sizeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 4, ));
    final curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.decelerate, reverseCurve: Curves.easeOut);
    paddingAnim = Tween(begin: 0.0,end: 50.0,).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate)..addListener(() {setState(() {});})
    );
    sizeAnim = Tween(begin: 0.0,end: 32.0,).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate)
    )..addListener(() {setState(() {
    });})..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        print('animation completed');
        Navigator.pushNamed(context, AuthenticationPage.id);
    }});
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(paddingAnim.value),
            child: Image.asset('assets/health-e.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEALTH',style: GoogleFonts.laila(fontSize: sizeAnim.value, fontWeight: FontWeight.bold,)),
                Text('-E', style: GoogleFonts.laila(fontSize: sizeAnim.value, fontWeight: FontWeight.bold, color: myPink))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
