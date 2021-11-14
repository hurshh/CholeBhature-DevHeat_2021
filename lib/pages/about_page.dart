import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_rounded),color: myPink,),
        title: Text('About',style: TextStyle(color: myPink),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('This app is part of a hackathon "devHeat" organized by iiit surat, developed by Harsh Rao and Parth Thapliyal of team CholeBhature.',
              style: TextStyle(fontSize: 18),),
            Text('\nThis app serves as a quick link between patients and doctors and a person can get better information about his health from different doctors using this app.',style: TextStyle(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
