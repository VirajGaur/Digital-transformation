import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'Grocery.dart';
import 'Authentication/Login.dart';
import 'dart:async';

class mainscreen extends StatefulWidget{
  final String name;
  final String email;
  const mainscreen({Key? key, required this.name, required this.email}) : super(key: key);
  @override
  _mainScreen createState() => _mainScreen(Name:name, Email: email);
}

class _mainScreen extends State<mainscreen>{
  String Name;
  String Email;
  String x = '';
  int port = 0;
  _mainScreen({ required this.Name, required this.Email}) : super();
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
                      ShowUpAnimation(
                        delayStart: Duration(milliseconds: 200),
                        animationDuration: Duration(milliseconds: 800),
                        curve: Curves.easeIn,
                        direction: Direction.horizontal,
                        offset: 0.5,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Welcome Back',
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 0, 0, 1.0),
                                fontFamily: 'Raleway',
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                              cursor: '',

                              speed: const Duration(milliseconds: 100),
                            ),
                          ],

                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ],
                  ),
                  Row(

                    children: [
                      Center(
                        child: ShowUpAnimation(
                          delayStart: Duration(milliseconds: 800),
                          animationDuration: Duration(milliseconds: 800),
                          curve: Curves.easeIn,
                          direction: Direction.horizontal,
                          offset: 0.5,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                Name + '!',
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(255, 0, 0, 1.0),
                                  fontFamily: 'Raleway',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                cursor: '',

                                speed: const Duration(milliseconds: 100),
                              ),
                            ],

                            totalRepeatCount: 1,
                            pause: const Duration(milliseconds: 1000),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ),
                      ),
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

