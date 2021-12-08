import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'dart:async';
import 'package:mysql1/mysql1.dart';
import 'Grocery.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';

class Maps extends StatefulWidget {

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  //List<String> Stores = [];
  //children: Stores.map( (Store){
  // return text(store)})
  double height = 300;
  double width = 300;
  double posX = 300;
  double posY = 300;
  int port = 0;
  String Store = "Null";
  Blob image = new Blob.fromString("");

  connectToSQL() async {
    var settings = new ConnectionSettings(
        host: 'ec2-54-208-82-154.compute-1.amazonaws.com',
        port: 3306,
        user: 'Youssef',
        password: '40247459',
        db: 'CSC4008'
    );
    port = settings.port;
    

    var conn = await MySqlConnection.connect(settings);
    var results = await conn.query('select StoreName,Blueprint from Store where StoreID = 1');
    for (var row in results) {
      setState(() {
        Store = row[0];
      });
      Blob image = row[1];

    };

    conn.close();
}

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }



  void main() {
    var thing =  window.physicalSize;

    print(thing);
  }
  @override
  void initState() {
    height = 1;
    connectToSQL();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){

      return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0,100.0,40.0,60.0),
                  child: Text('Maps',
                    style: TextStyle(
                      fontFamily: 'Alegreya',
                      fontSize: 40.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                 Container(
                   child: (Image.memory(convertStringToUint8List(image.toString()), fit: BoxFit.fitHeight,)
                   )
                 ),

                Map(posX: 80, posY: 80, height: 300, width: 300, image: 'Assets/TescoMap.JPG'),





                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => (Maps())),
                          );
                        },

                        child: Text('Grocery')
                    ),
                    Text('$Store'),
                  ],
                ) ,
              ],
            ),
          ],
        ),
      );
    },);//sizer


  }
}

class Map extends StatelessWidget {

  final double posX;
  final double posY;
  final double height;
  final double width;
  final String image;

  Map({required this.posX, required this.posY, required this.height, required this.width, required this.image});

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: Duration(milliseconds: 200),
      animationDuration: Duration(milliseconds: 400),
      curve: Curves.decelerate,
      direction: Direction.vertical,
      offset: 0.5,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[

            Container(
              child: (Image.asset('$image', fit: BoxFit.fill)),
            ),
            Positioned(
              bottom: posY,
              left: posX,
              child: Container(
                child: Icon(
                  Icons.location_pin,
                  color: Colors.redAccent,
                  size: 30.0,
                ),
              ),


            ),
          ],
        ),
      ),
    );
  }
}