import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';



class SuperheroExtended extends StatefulWidget {
  static const String id = 'SuperheroExtended';
  @override
  _SuperheroExtendedState createState() => _SuperheroExtendedState();
}

class _SuperheroExtendedState extends State<SuperheroExtended> {

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot>popularList;
  final CollectionReference collectionReference = 
  Firestore.instance.collection("superhero");

  @override
  void initState() {
   super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot){

      setState(() {
        popularList = datasnapshot.documents;
      });
     });
  }
  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SingleChildScrollView(
              child: Column(
          children: <Widget>[
            SizedBox(height:80 ,),
            Text("Super Heroes",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(

                padding: EdgeInsets.only(top:20,bottom:30 ),
                  itemCount: popularList?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 10),
                         itemBuilder: (context,i) {
                            String simgpath = popularList[i].data['url'];
                            return GestureDetector(
                             onTap: (){
                                        Navigator.of(context).push(  new MaterialPageRoute(
                                         builder: (BuildContext context) => SuperheroFull(
                                                   simgpath2: simgpath,
                                         
                                                 ),),);},
                                         child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: CachedNetworkImage(
                                 placeholder: (context, url) => Center(child: new CircularProgressIndicator()),
                                    imageUrl: simgpath,
                                   width: 200.0,
                                   height: 500.0,
                                   fit: BoxFit.cover,
                              ),),
                            );}
)
    ),
          ],
        ),
      ));
  }
}


class SuperheroFull extends StatelessWidget {

  _save() async {
    var response = await Dio().get(simgpath2, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
  }
  static const String id = 'MinimalFull';
  SuperheroFull({this.simgpath2});
  String simgpath2;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
          height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.height,
          child: CachedNetworkImage(
            placeholder: (context, url) => Center(child: new CircularProgressIndicator()),
            imageUrl: simgpath2,fit: BoxFit.cover,),),
          
          GestureDetector(
            onTap: () async{
              PermissionStatus permission =
                                await Permission.storage.status;
                            if (permission == PermissionStatus.granted) {
                              // permission is granted
                              Toast.show("Wallpaper saved to gallery", context,duration: Toast.LENGTH_LONG);
                             _save();
                            } else {
                              // request permission
                              await Permission.storage.request();
                              // check status after requresting
                              PermissionStatus storagePermission =
                                  await Permission.camera.status;
                              if (storagePermission ==
                                  PermissionStatus.granted) {
                                    SnackBar(content: Text("Wallpaper saved to gallery"));
                                _save();
                              } else {
                                // show a taost
                                Toast.show(
                                    "Permission is required to save image",
                                    context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.CENTER,
                                    backgroundColor: Colors.blueAccent);
                              }
                            } 
                          },
                      child: Padding(
              padding: const EdgeInsets.only(top: 400),
              child: Center(child: Container(
                height:50,
                width: 180,
                child: Center(child: Text("Save to Gallery",style: TextStyle(color:Colors.white60,fontSize:20,fontWeight: FontWeight.bold),)),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(80))
                ),
              ),
            ),
                ),
          ),
              ]),
          );
          }
          
       
          
}
