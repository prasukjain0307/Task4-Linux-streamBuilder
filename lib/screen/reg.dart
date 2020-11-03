import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_app/screen/terminal.dart';


class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: null)
        ],
      ),
      body: Center(
        
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: 300,
          child: Column(
        children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 5,
            ),
          ),

          width:double.infinity,
          height: 50,
          margin: EdgeInsets.all(20),
         
          child: Center(
            child: Text('Account Register',
            style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
          ),
        ),
        
         SizedBox(
            height: 70,
          ),
          TextField(
            onChanged:(value)
            {
              email = value;
            },
            decoration: InputDecoration(
                hintText: 'Email',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
            ),
          ),  

          SizedBox(
            height:20,
          ),

           TextField(
            onChanged:(value)
            {
              password = value;
            },
            decoration: InputDecoration(
                hintText: 'Password',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
            ),
          ),
           
         SizedBox(
            height: 20,
          ),

         Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
            elevation: 35,
            child:MaterialButton(
              minWidth: 200,
              height: 40,
              child: Text('submit'),
              onPressed: () async {
              try
              {
                var user = await authc.createUserWithEmailAndPassword(email: email, password: password);
                print(email);
                      print(password);
                      print(user);
    
               if (user.additionalUserInfo.isNewUser == true) {
                       
                        Navigator.pushNamed(context, "linuxcmd");
                      }
              }
               catch (e) {
                      print(e);
               }
              }
               
              )

          ),
        ],
      ),
        ),
      ),
      
    );
  }
}