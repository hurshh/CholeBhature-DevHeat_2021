import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/pages/problem_reportingpage.dart';
import 'package:healthe/util/user_data.dart';
import 'package:healthe/widgets/docfield_bubbles.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello $LoggedInUserName,',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),textAlign: TextAlign.left,),
                    Text('how can we help you today?',style: TextStyle(fontSize: 24),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(child: DocFieldBubbles(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DocQuery(docfield: 'Dermatologist')));}, label: 'Dermatologist')),
                    Expanded(child: DocFieldBubbles(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DocQuery(docfield: 'Gynecologist')));}, label: 'Gynecologist')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(child: DocFieldBubbles(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DocQuery(docfield: 'Pediatricians')));}, label: 'Pediatricians')),
                    Expanded(child: DocFieldBubbles(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DocQuery(docfield: 'Physicians')));}, label: 'Physicians')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(child: DocFieldBubbles(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DocQuery(docfield: 'Psychiatrist')));}, label: 'Psychiatrist')),
                    Expanded(child: DocFieldBubbles(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DocQuery(docfield: 'Ophthalmologist')));}, label: 'Ophthalmologist')),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
