  
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:firebase_app/screen/stream.dart';


class Lcmd extends StatefulWidget {
  @override
  _LcmdState createState() => _LcmdState();
}

class _LcmdState extends State<Lcmd> {
  
  var fclr = TextEditingController(); 
  var connect = FirebaseFirestore.instance; 
  var authentication =  FirebaseAuth.instance; 

  var answer;
  var cmd;

  fbdata(cmd) async {
    var useremail = authentication.currentUser.email;
    var connect = FirebaseFirestore.instance;
    var url = "http://192.168.43.55/cgi-bin/web.py?x=${cmd}";
    var response = await http.get(url);

    setState(() {
      answer = response.body;
    });

    //print(answer);

    await connect.collection("terminal_app").add({
      "UserName": useremail, 
      'command_ans': "${answer}" 
    }
    );

   }

   StreamMess()
   {
    StreamBuilder<QuerySnapshot> 
    (
             builder: (context, snapshot)
             {
              List<Widget> mess = [];
              var msg =  snapshot.data.docs;                    
              for (var d in msg) {
               var msgname = d.data()['name'];
                 var Usercmd =data()['command'];
                var msgWid = Text("$msgname : $Usercmd");
                   mess.add(msgWid);
             }
             print(mess);    },
             stream:  fbconn.collection("terminal_app").snapshots(),);
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Linux Terminal'),
          backgroundColor: Colors.cyan,
        ),
        body: Stack(
          children: <Widget>[
            
            Card(
               margin: EdgeInsets.fromLTRB(100, 30, 20, 20),
               
          child: Text('Enter Your Command',
        
          textAlign: TextAlign.center,
          style:TextStyle(
            fontSize:24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
          color: Colors.black,
        ),
           
            Container(
              margin: EdgeInsets.fromLTRB(10, 80, 20, 20),
             
              child: TextField(
                controller: fclr,
                onChanged: (value) {
                  cmd = value;
                },
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
               
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: '[root@localhost ~]#',
                 border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                 ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(10, 150, 10, 10),
              child: Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
                child: MaterialButton(
                  onPressed: () {
                    fbdata(cmd);
                    fclr.clear();
                   StreamMess();
                  },
                  child: Text(
                    'RUN',
                    style: TextStyle(
                      fontSize: 20,
                     
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 210, 10, 10),
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.3),),
              // color: Colors.black.withOpacity(0.3),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    answer ?? " ", 
                    textAlign: TextAlign.center,
                    style:
                     TextStyle(
                       color: Colors.white,
                      fontSize: 22,
                    ),
                
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}