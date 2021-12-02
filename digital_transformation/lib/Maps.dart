import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'Grocery.dart';

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              ShowUpAnimation(
                delayStart: Duration(milliseconds: 200),
                animationDuration: Duration(milliseconds: 400),
                curve: Curves.decelerate,
                direction: Direction.vertical,
                offset: 0.5,
                child:Container(
                  padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                  child: Image.asset('Assets/TescoMap.JPG',height: 300 ,width: 300,),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (Grocery())),
                        );
                      },

                      child: Text('Grocery')
                  ),
                ],
              ) ,
            ],
          ),
        ],
      ),
    );

  }
}