import 'package:anpaper2/categoriesf/amoled.dart';
import 'package:anpaper2/categoriesf/minimal.dart';
import 'package:anpaper2/categoriesf/nature.dart';
import 'package:anpaper2/categoriesf/superhero.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
          child: Row(
          children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(  new MaterialPageRoute(
                  builder: (BuildContext context) => AmoledExtended(),),);
            },
            child: CategoriesBAr(assname: "lib/screens/assets/2.jpg",cname: "Amoled",)),
          SizedBox(width: 20),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(  new MaterialPageRoute(
                  builder: (BuildContext context) => MinimalExtended(),),);
            },
            child: CategoriesBAr(assname: "lib/screens/assets/3.jpg",cname: "Minimal",)),
          SizedBox(width: 20),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(  new MaterialPageRoute(
                  builder: (BuildContext context) => NatureExtended(),),);
            },
            child: CategoriesBAr(assname: "lib/screens/assets/4.jpg",cname: "Nature",)),
          SizedBox(width: 20),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(  new MaterialPageRoute(
                  builder: (BuildContext context) => SuperheroExtended(),),);
            },
            child: CategoriesBAr(assname: "lib/screens/assets/5.jpg",cname: "SuperHeroes",)),
        ],
      ),
    );
  }
}







class CategoriesBAr extends StatelessWidget {
CategoriesBAr({this.assname,this.cname});
String cname;
String assname;

  @override
  Widget build(BuildContext context) {
    return 
         
        
         Column(
           children: <Widget>[
             ClipRRect(
             borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(assname,
              width: 150.0,
                 height: 150.0,
                 fit: BoxFit.cover,
                     ),
             ),
             SizedBox(height: 10,),
             Container(
               height: 30,
               width: 135,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
                 color: Colors.white
               ),
               child:Center(child: Text(cname,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)), 
             ),
               
         
           ],
         );
        
    
  }
}