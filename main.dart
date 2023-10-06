import 'package:flutter/material.dart';
import 'package:login_signup/Screens/sign_up.dart';
import 'Screens/login.dart';
void main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:Login.route,
      routes:
      {
        Login.route:(context)=>Login(),
        Sign_up.route:(context)=> Sign_up(),
      //  '/second':(context)=>Second(),
      },

    );
  }
}