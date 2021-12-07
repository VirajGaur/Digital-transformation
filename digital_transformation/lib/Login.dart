import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'package:sizer/sizer.dart';
import 'dart:ui';

import 'Layout.dart';
import 'MainScreen.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String query1 = 'SELECT EmailAddress, Password FROM Customer WHERE EmailAddress =';
  final String query2 = ' AND PASSWORD = MD5(';
  final String query3 = ');';
  String email = '';
  String password = '';
  int port = 0;


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
                      var results = await conn.query("SELECT EmailAddress, Password FROM Customer WHERE EmailAddress = '" +  email +
                          "'AND PASSWORD = MD5('" + password + "');");
                      print(results);

                      if(results.isEmpty == true){
                        print("Incorrect password");


                      }
                      else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Main()));

                      }







                        },
                        child: Text("LOGIN"),)
                  ),

                ],
              ),


            ],
          )
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
