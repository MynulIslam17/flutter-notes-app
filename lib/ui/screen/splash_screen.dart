

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/controller/note_controller.dart';
import 'package:note_app/data/controller/sharedpref_controller.dart';
import 'package:note_app/ui/screen/main_nav_holder_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


   @override
  void initState() {
     _moveToHomeScreen();

    super.initState();
  }

  void  _moveToHomeScreen() async{

     await Future.delayed(Duration(seconds: 2));
   await NoteController.getData();
   if(!mounted){
     return;
   }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavHolderScreen()));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),


      body: SafeArea(


        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:25,vertical: 17),
          child: Column(

          //crossAxisAlignment: CrossAxisAlignment.start,


            children: [

          const SizedBox(height: 10,),

              Align(
                alignment:Alignment.topLeft,
                child: RichText(
                    text: TextSpan(
                      style:TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0C9999)
                      ),

                      children: [

                        TextSpan(
                          text:"Capture ideas",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300
                          )

                        ),

                        TextSpan(
                          text: "\nOrganize",
                          style: TextStyle(
                            fontSize:28,
                            fontWeight: FontWeight.w700
                          )

                        ),

                        WidgetSpan(child: const SizedBox(width: 6,)),

                        TextSpan(
                          text: "your life",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w200
                          )

                        ),





                      ]


                    )

                ),
              ),

              Expanded(child: Image.asset("assets/images/noteimg.png",height: 300,width: 300,
                fit: BoxFit.contain,
               

              ))





            ],
          ),
        ),
      ),



    );
  }
}
