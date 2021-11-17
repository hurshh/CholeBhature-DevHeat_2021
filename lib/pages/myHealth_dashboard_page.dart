import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/util/firebase_authentication.dart';
import 'package:healthe/widgets/buttons.dart';

class MyHealth extends StatefulWidget {
  const MyHealth({Key? key}) : super(key: key);

  @override
  _MyHealthState createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {
  String _age = "";
  String _weight = "";
  String _height = "";
  String _medicalHistory = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text('My Health',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),),
          ),
          Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Age',style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (subject){
                        _age = subject;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: myPink),borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Weight',style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (subject){
                        _weight = subject;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: myPink),borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('height',style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (subject){
                    _height = subject;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: myPink),borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Previous medical history',style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              minLines: 8,
              maxLines: 18,
              onChanged: (description){
                _medicalHistory = description;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: myPink),borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AuthenticationPageButton(onPressed: (){
              print(_medicalHistory);
              firestore.collection('UserData').doc(auth.currentUser?.email.toString()).collection('report').doc('report').set(
                  {
                    "age" : _age,
                    "weight" : _weight,
                    "height" : _height,
                    "history" : _medicalHistory,
                  });
            }, label: 'Submit', colour: myTurqoise),
          )
        ],
      ),
    );
  }
}
