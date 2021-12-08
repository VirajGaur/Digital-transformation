import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:digital_transformation/Layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';

import 'Registration.dart';
import '../MainScreen.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  int port = 0;
  String Name='';
  String x = '';
  getNameSQL(String email,String password) async {

    var settings = new ConnectionSettings(
        host: 'ec2-54-208-82-154.compute-1.amazonaws.com',
        port: 3306,
        user: 'Youssef',
        password: '40247459',
        db: 'CSC4008'
    );
    int port = settings.port;

    var conn = await MySqlConnection.connect(settings);
    var name = await conn.query("SELECT FirstName FROM Customer WHERE EmailAddress = '" +  this.email +
        "'AND PASSWORD = MD5('" + this.password + "');");
    for (var row in name) {

          Name=row[0];



    };

    conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
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
                      onChanged:(value){
                        setState(() => email = value);
                      },
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

                      onChanged:(value){
                        setState(() => password = value);
                      },
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
                    onPressed: () async{
                      var settings = new ConnectionSettings(
                          host: 'ec2-54-208-82-154.compute-1.amazonaws.com',
                          port: 3306,
                          user: 'Youssef',
                          password: '40247459',
                          db: 'CSC4008'
                      );
                      port = settings.port;

                      var conn = await MySqlConnection.connect(settings);
                      var results1 = await conn.query("SELECT EmailAddress, Password FROM Customer WHERE EmailAddress = '" +  email +
                          "'AND PASSWORD = MD5('" + password + "');");
                      var name = await conn.query("SELECT FirstName FROM Customer WHERE EmailAddress = '" + email +"';");
                      print(name);

                      for (var row in name) {
                        x = row[0].toString();
                      }


                      print(results1);

                      if(results1.isEmpty == true){
                        print("Incorrect password");


                      }
                      else{
                        getNameSQL(email,password);
                        Navigator.push(
                            context,

                            MaterialPageRoute(builder: (context) => mainState(Name: x, Email: email)));

                      }







                        },
                        child: Text("LOGIN"),)
                  ),
      ShowUpAnimation(
      delayStart: Duration(milliseconds: 1700),
      animationDuration: Duration(milliseconds: 800),
      curve: Curves.easeInCubic,
      direction: Direction.vertical,
      offset: 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      AnimatedTextKit(
      animatedTexts: [
      TypewriterAnimatedText(
      'Want to create a new accouunt?',
      textStyle: const TextStyle(
      color: Color.fromRGBO(0, 0, 0, 1.0),
      fontFamily: 'Raleway',
      fontSize: 20.0,
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
            TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registration()));


              },
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'sign up',
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    cursor: '',

                    speed: const Duration(milliseconds: 100),
                  ),
                ],



              ),
            ),


                ],
              ),

      ),
            ],
          )
      ],
      ),
      );
    },);
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
