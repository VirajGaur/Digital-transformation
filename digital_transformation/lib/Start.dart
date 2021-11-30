import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'Login.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:Column(

        children: [
          ShowUpAnimation(
            delayStart: Duration(milliseconds: 500),
            animationDuration: Duration(milliseconds: 800),
            curve: Curves.decelerate,
            direction: Direction.vertical,
            offset: 0.5,
            child:Container(
              padding: EdgeInsets.fromLTRB(20.0,20.0,40.0,20.0),
              child: Image.asset('Assets/QueenÔÇÖs Red Logo - Landscape.png',height: 200 ,width: 200,),
            ),
          ),

          Row(

            children: [

              Container(
                padding: EdgeInsets.fromLTRB(20.0,70.0,40.0,20.0),
                child: ShowUpAnimation(
                  delayStart: Duration(milliseconds: 1200),
                  animationDuration: Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                  direction: Direction.horizontal,
                  offset: 0.5,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Welcome to our',
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.0,0.0,40.0,100.0),
                child:ShowUpAnimation(
                  delayStart: Duration(milliseconds: 1800),
                  animationDuration: Duration(milliseconds: 800),
                  curve: Curves.easeInBack,
                  direction: Direction.horizontal,
                  offset: 0.5,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Prototype',
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
          Row(
            mainAxisAlignment : MainAxisAlignment.spaceEvenly,
            children: [
              ShowUpAnimation(
                delayStart: Duration(milliseconds: 2500),
                animationDuration: Duration(milliseconds: 800),
                curve: Curves.bounceOut,
                direction: Direction.vertical,
                offset: 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text('Lets get started',),

                ),
              ),
            ],
          ),
        ],
      ),

    );

  }
}


