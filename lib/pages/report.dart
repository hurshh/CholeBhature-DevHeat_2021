import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/util/firebase_authentication.dart';

class report extends StatefulWidget {
  String email;


  report({required this.email});

  @override
  _reportState createState() => _reportState();
}

class _reportState extends State<report> {
  String age = "";
  String weight = "";
  String height= "";
  String history= "";
  void fetchData() async{
    await firestore.collection('UserData').doc(widget.email).collection('report').doc('report').get().then((value){
      age = value['age'];
      height = value['height'];
      weight = value['weight'];
      history = value['history'];
    });
  }
  @override
  void initState() {
    super.initState();
    fetchData();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_rounded),color: myPink,),
        title: Text('report',style: TextStyle(color: myPink),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text("Age : ${age}\nHeight : ${height}\nWeight : ${weight}\nHistory : ${history}",style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
