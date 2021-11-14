import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthe/constants/colors.dart';
import 'package:healthe/util/firebase_authentication.dart';
import 'package:healthe/util/user_data.dart';
import 'package:healthe/widgets/buttons.dart';

class DocQuery extends StatefulWidget {
  String docfield;
  DocQuery({required this.docfield});

  @override
  _DocQueryState createState() => _DocQueryState();
}

class _DocQueryState extends State<DocQuery> {
  String _subject = "";
  String _description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_rounded),color: myPink,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Write your problem to a ${widget.docfield}',style: TextStyle(fontSize: 30),),
            ),
            SizedBox(height: 4,),
            Text('Subject',style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (subject){
                  _subject = subject;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: myPink),borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            SizedBox(height: 4,),
            Text('Description',style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                minLines: 15,
                maxLines: 18,
                onChanged: (description){
                  _description = description;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: myPink),borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AuthenticationPageButton(onPressed: (){
                FirebaseFirestore.instance.collection(widget.docfield).doc().set(
                  {
                    "username" : LoggedInUserName,
                    "email" : auth.currentUser?.email.toString(),
                    "subject" : _subject,
                    "description" : _description,

                  }
                );
                Navigator.pop(context);
              }, label: 'Submit', colour: myPink),
            ),
          ],
        ),
      ),
    );
  }
}
