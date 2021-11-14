import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/pages/chat_screen.dart';
import 'package:healthe/util/firebase_authentication.dart';
import 'package:healthe/util/user_data.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Inbox',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),),
          ),
          ConversationBoxes()
        ],
      ),
    );
  }
}
















class ConversationBoxes extends StatefulWidget {
  const ConversationBoxes({Key? key}) : super(key: key);

  @override
  _ConversationBoxesState createState() => _ConversationBoxesState();
}

class _ConversationBoxesState extends State<ConversationBoxes> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('UserData').doc(auth.currentUser?.email.toString()).collection('convo').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<ConvoStarters> messageBubbles = [];
        for (var message in messages) {

          final username = message.get('username');
          final email = message.get('email');


          final messageBubble = ConvoStarters(username,email);

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



class ConvoStarters extends StatefulWidget {
  String username;
  String email;


  ConvoStarters(this.username, this.email);

  @override
  _ConvoStartersState createState() => _ConvoStartersState();
}

class _ConvoStartersState extends State<ConvoStarters> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: (){
          print("pressed");
          print(widget.email);
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(widget.email)));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AccentMyPink,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                    child: Text(widget.username,style: TextStyle(fontSize: 22),)),
                // Text(widget.email)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


