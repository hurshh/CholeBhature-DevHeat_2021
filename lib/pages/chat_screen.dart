import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/util/firebase_authentication.dart';

class ChatScreen extends StatefulWidget {
  static String id = "chat Screen";

  String SenderEmail;
  ChatScreen(this.SenderEmail);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextEditingController = TextEditingController();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_rounded),color: myPink,),
      ),

      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MessagesStream(SenderEmail: widget.SenderEmail),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: TextField(
                          onChanged: (str) {
                            message = str;
                          },
                          controller: messageTextEditingController,
                          cursorColor: myPink,
                          cursorHeight: 25,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                BorderSide(color: myPink, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                BorderSide(color: myPink, width: 2),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                BorderSide(color: myPink, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                BorderSide(color: myPink, width: 2),
                              ),
                              filled: true,
                              hintText: 'write message',
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: IconButton(onPressed: (){
                          var now = DateTime.now();
                          print("send button pressed");
                          print(message);
                          //TODO send button function
                          firestore.collection('UserData').doc(auth.currentUser?.email.toString()).collection('messages').doc(widget.SenderEmail).collection('message').add({
                            'sender': auth.currentUser?.email.toString(),
                            'text':  message,
                            'time': now.year.toString()+"-"+now.month.toString()+"-"+now.day.toString()+"-"+now.hour.toString()+"-"+now.minute.toString()+"-"+now.second.toString()
                          });
                          firestore.collection('UserData').doc(widget.SenderEmail).collection('messages').doc(auth.currentUser?.email.toString()).collection('message').add({
                            'sender': auth.currentUser?.email.toString(),
                            'text':  message,
                            'time': now.year.toString()+"-"+now.month.toString()+"-"+now.day.toString()+"-"+now.hour.toString()+"-"+now.minute.toString()+"-"+now.second.toString()
                          });
                          messageTextEditingController.clear();
                        },
                          icon: Icon(Icons.send_rounded),
                          color: myTurqoise,iconSize: 30,),
                        backgroundColor: myPink,
                        radius: 25,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  String SenderEmail;


  MessagesStream({required this.SenderEmail});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('UserData').doc(auth.currentUser?.email.toString()).collection('messages').doc(SenderEmail).collection('message').orderBy("time").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<ChatBubble> messageBubbles = [];
        for (var message in messages) {

          final messageSender = message.get('sender');
          final messageText = message.get('text');

          final currentUser = auth.currentUser?.email;

          final messageBubble = ChatBubble(
              messageSender,messageText,currentUser != messageSender
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }

}
class ChatBubble extends StatefulWidget {
  String user;
  String Message;
  bool others;

  ChatBubble(this.user,this.Message, this.others);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: widget.others ? CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          Text(widget.user,style: TextStyle(fontSize: 14),),
          Material(
            elevation: 10,

            borderRadius:widget.others ? BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20)):BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topLeft: Radius.circular(20)),
            color: widget.others ? myTurqoise:myPink,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(widget.Message,style: TextStyle(fontSize: 20,),),
            ),
          )
        ],
      ),
    );
  }
}