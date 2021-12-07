import 'package:flutter/material.dart';

import 'Grocery.dart';
import 'Authentication/Login.dart';
class mainscreen extends StatefulWidget{
  final String name;
  const mainscreen({Key? key, required this.name}) : super(key: key);
  @override
  _mainScreen createState() => _mainScreen(Name:name);
}

class _mainScreen extends State<mainscreen>{
  String Name;
  _mainScreen({ required this.Name}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.0,100.0,40.0,60.0),
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  Row(
                    children: [
                      Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontSize: 35,

                        ) ,
                      )
                    ],
                  ),
                  Row(

                    children: [
                      Center(
                        child: Text(
                          Name,
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            fontSize: 35,

                          ) ,
                        ),
                      )
                    ],
                  ),
                ],
              ),

          ),
          Container(
          padding: EdgeInsets.fromLTRB(20.0,100.0,40.0,60.0),
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {  },
                          child: Text(
                            'Shop Offline?'
                          ),

                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                           Navigator.pop(context);
                          },
                          child: Text(
                              'Sign Out'
                          ),

                        ),
                      )
                    ],
                  ),
                ],
              ),

          ),

        ],
      ),
    );
  }

}