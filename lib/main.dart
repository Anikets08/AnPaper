import 'package:anpaper2/screens/homepage.dart';
import 'package:anpaper2/screens/splashscree.dart';
import 'package:flutter/material.dart';
import 'package:anpaper2/screens/popular.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: SplashScreen.id,
      routes: {
      SplashScreen.id: (context) => SplashScreen(), 
      HomePage.id : (context) => HomePage(),
      Popular.id : (context) => Popular(),
      PopularFull.id : (context) => PopularFull(),
      PopularExtended.id : (context) => PopularExtended()
    },
    );
  }
}





