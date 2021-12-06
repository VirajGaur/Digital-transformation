import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'Layout.dart';
import 'MainScreen.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(255, 255, 255,1.0),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              ShowUpAnimation(
                delayStart: Duration(milliseconds: 500),
                animationDuration: Duration(milliseconds: 800),
                curve: Curves.decelerate,
                direction: Direction.vertical,
                offset: 0.5,
                child:Container(
                  padding: EdgeInsets.fromLTRB(20.0,20.0,40.0,0.0),
                  child: Image.asset('Assets/QueenÔÇÖs Red Logo - Landscape.png',height: 200 ,width: 200,),
                ),
              ),
              ShowUpAnimation(
                delayStart: Duration(milliseconds: 500),
                animationDuration: Duration(milliseconds: 800),
                curve: Curves.decelerate,
                direction: Direction.vertical,
                offset: 0.5,
                child:Container(
                  padding: EdgeInsets.fromLTRB(20.0,20.0,40.0,20.0),
                  child: Image.asset('Assets/Shopping.jpg',height: 200 ,width: 200,),
                ),
              ),
              ShowUpAnimation(
                delayStart: Duration(milliseconds: 1200),
                animationDuration: Duration(milliseconds: 800),
                curve: Curves.easeIn,
                direction: Direction.horizontal,
                offset: 0.5,
                child:TextFieldContainer(child: TextField(
                  onChanged:(value){},
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                    hintText: "Username",
                    border: InputBorder.none,
                  ),
                )
                ),
              ),
              ShowUpAnimation(
                delayStart: Duration(milliseconds: 1200),
                animationDuration: Duration(milliseconds: 800),
                curve: Curves.easeIn,
                direction: Direction.horizontal,
                offset: 0.5,
                child: TextFieldContainer(child: TextField(

                  onChanged:(value){},
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    icon:  Icon(Icons.lock,
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                    suffixIcon: IconButton(onPressed:  () {
                      TextField(obscureText: false);
                    },  icon: Icon(Icons.visibility,
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                    ),
                  ),
                ),
                ),
              ),
              ShowUpAnimation(
                  delayStart: Duration(milliseconds: 1700),
                  animationDuration: Duration(milliseconds: 800),
                  curve: Curves.easeInCubic,
                  direction: Direction.vertical,
                  offset: 0.5,
                  child:  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mainState())
                      );

                    },
                    child: Text("LOGIN"),)
              ),

            ],
          ),


        ],
      )
    );

  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
  required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width*0.8,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,

    );
  }
}
