import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/report.dart';
import 'package:healthe/util/firebase_authentication.dart';
import 'package:healthe/util/user_data.dart';

import 'chat_screen.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Welcome Doctor,',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          ),
          QueryStream()
        ],
      ),
    );
  }
}

class QueryStream extends StatefulWidget {
  const QueryStream({Key? key}) : super(key: key);

  @override
  _QueryStreamState createState() => _QueryStreamState();
}

class _QueryStreamState extends State<QueryStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection(DocField).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<Queries> messageBubbles = [];
        for (var message in messages) {

          final username = message.get('username');
          final description = message.get('description');
          final email = message.get('email');
          final subject = message.get('subject');

          final currentUser = auth.currentUser?.email;

          final messageBubble = Queries(subject, username, description, email);

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            // reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class Queries extends StatefulWidget {
  String subject;
  String user;
  String description;
  String senderEmail;


  Queries(this.subject, this.user, this.description, this.senderEmail);

  @override
  _QueriesState createState() => _QueriesState();
}

class _QueriesState extends State<Queries> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AccentMyPink,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FlatButton(child: Text('user : ${widget.user}',style: TextStyle(fontSize: 20),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => report(email: widget.senderEmail)));},),
                  IconButton(onPressed: (){
                    //TODO send funtion
                    var now = DateTime.now();
                    print(widget.senderEmail);
                    print(auth.currentUser?.email.toString());
                    firestore.collection('UserData').doc(auth.currentUser?.email.toString()).collection('convo').add({
                      "email" : widget.senderEmail,
                      "username" : widget.user
                    });
                    firestore.collection('UserData').doc(widget.senderEmail).collection('convo').add({
                      "email" : auth.currentUser?.email.toString(),
                      "username" : LoggedInUserName,
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(widget.senderEmail)));
                  }, icon: Icon(Icons.send))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('subject : ${widget.subject}',style: TextStyle(fontSize: 20),)),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Expanded(child: Text('description : ${widget.description}',style: TextStyle(fontSize: 20),)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


