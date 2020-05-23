import 'package:anpaper2/screens/Catergories.dart';
import 'package:anpaper2/screens/newest.dart';
import 'package:flutter/material.dart';
import 'popular.dart';

class HomePage extends StatefulWidget {
    static const String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
        body:ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Popular",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(  new MaterialPageRoute(
                  builder: (BuildContext context) => PopularExtended(),),);
            },
            child: Text("See more >",style: TextStyle(color: Colors.white60,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ],
                ),
                SizedBox(height: 20,),
                Popular(),
                SizedBox(height: 20,),
                Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Categories",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          ),
                SizedBox(height: 20,),
                Categories(),
                SizedBox(height: 20,),
                Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Newest",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                GestureDetector(
                  onTap: (){
              Navigator.of(context).push(  new MaterialPageRoute(
                  builder: (BuildContext context) => NewestExtended(),),);
            },
                  child: Text("See more >",style: TextStyle(color: Colors.white60,fontSize: 15,fontWeight: FontWeight.bold),)),
              ],
            ),
          ),
                SizedBox(height: 20,),
                Newest(),

              ],
            ),
          ],
                  // child: 
        ),
          ),
    );
      
    
  }
}
