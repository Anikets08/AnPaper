import 'package:anpaper2/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    
    super.initState();
    Future.delayed(Duration(seconds: 3),
    (){
      Navigator.pushNamed(context, HomePage.id);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            SizedBox(height: 100,),
            Image.asset("lib/screens/assets/Untitled-1-01.png",fit: BoxFit.cover,),
            SizedBox(height: 10,),
             Text("AnPaper",style: GoogleFonts.roboto(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
             SizedBox(height: 10,),
             Text("Hand Picked Wallpapers",style: GoogleFonts.roboto(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold),),
              
          ]),
        ),
      )
    );
  }
}