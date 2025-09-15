
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/main.dart';
import 'package:note_app/ui/screen/home_screen.dart';
import 'package:note_app/ui/screen/main_nav_holder_screen.dart';
import 'package:note_app/ui/screen/splash_screen.dart';

class  NoteApp extends StatelessWidget{
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

     theme: ThemeData(
       textTheme: TextTheme(
         titleMedium: TextStyle(
           fontSize: 19,
           fontWeight: FontWeight.w500,
           color: Colors.white,

         )
       )
     ),

     home:SplashScreen(),
    );
  }


}