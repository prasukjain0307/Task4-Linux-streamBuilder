import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_app/screen/home.dart';
// import 'package:firebase_app/screen/login.dart';

// import 'package:firebase_app/screen/reg.dart';
import 'package:firebase_app/screen/terminal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "linuxcmd",
      routes: {
        // "home": (context) => MyHome(),
       
        "linuxcmd":(context) => Lcmd(),

        // "reg": (context) => MyReg(),
        
      },
    ),
  );
}



