import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';
import 'Login.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String first_name = '';
  String last_name = '';
  String email = '';
  String password1 = '';
  String password2 = '';
  int port = 0;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        body: Stack(
          children: [

          Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 40.0, 200.0),
            child: ShowUpAnimation(
                delayStart: Duration(milliseconds: 500),
                animationDuration: Duration(milliseconds: 800),
                curve: Curves.decelerate,
                direction: Direction.vertical,
                offset: 0.5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Form(
                    child: Column(
                      children: [

                        // First name
                        TextFieldContainer(child: TextField(
      onChanged:(value){
      setState(() => first_name = value);
      },
      decoration: InputDecoration(
      icon: Icon(
      Icons.person,
      color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      hintText: "first name",
      border: InputBorder.none,
      ),
      )
      ),



      // Last name
      TextFieldContainer(child: TextField(
      onChanged:(value){
      setState(() => last_name = value);
      },
      decoration: InputDecoration(
      icon: Icon(
      Icons.person,
      color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      hintText: "Last_name",
      border: InputBorder.none,
      ),
      )
      ),



      //email
      TextFieldContainer(child: TextField(
      onChanged:(value){
      setState(() => email = value);
      },
      decoration: InputDecoration(
      icon: Icon(
      Icons.mail,
      color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      hintText: "Email : abc@gmail.com",
      border: InputBorder.none,
      ),
      )
      ),


      //password1
      TextFieldContainer(child: TextField(
      obscureText: true,
      onChanged:(value){
      setState(() => password1 = value);
      },
      decoration: InputDecoration(

      icon: Icon(
      Icons.password,
      color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      hintText: "password",
      border: InputBorder.none,
      ),
      )
      ),


      //password2
      TextFieldContainer(child: TextField(
      obscureText: true,
      onChanged:(value){
      setState(() => password2 = value);
      },
      decoration: InputDecoration(
      icon: Icon(
      Icons.password,
      color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      hintText: "Confirm password",
      border: InputBorder.none,
      ),
      )
      ),
                        ElevatedButton(
                          onPressed: () async{
                        if (password1 == password2 && password1 != '' && password2 != '' && email != '' && first_name != '' && last_name != '' ) {
                          print(password1);
                          var settings = new ConnectionSettings(
                              host: 'ec2-54-208-82-154.compute-1.amazonaws.com',
                              port: 3306,
                              user: 'Youssef',
                              password: '40247459',
                              db: 'CSC4008'
                          );
                          port = settings.port;

                          // Connecting to the database
                          var conn = await MySqlConnection.connect(settings);

                          var results1 = await conn.query(
                              "SELECT EmailAddress FROM Customer WHERE EmailAddress = '" +
                                  email + "';");

                          if (results1.isEmpty == true) {
                            print("Results1");
                            print( results1);
                            var results2 = await conn.query("INSERT INTO Customer (FirstName, LastName, EmailAddress, PASSWORD) VALUES (" +
                                "'" + first_name + "'," +
                                "'" + last_name + "'," +
                                "'" + email + "'," +
                                "'" + password1 + "');" );
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()));
                            print(first_name + last_name + "signed up");

                            conn.close();

                          }
                          else{
                            print("User already exists");
                          }
                        }
                        else {
                          if (password1 != password2){
                            print ("Passwords don't match");
                          }
                          else {
                            print ("Empty fields");
                          }
                        }

                       
                    
                        
                        







                          },
                          child: Text("LOGIN"),
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
                                    'Already a user?',
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
                                      MaterialPageRoute(builder: (context) => Login()));


                                },
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'sign in',
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

                        ),

                    ),
                  ),
                ),

          ),
          ],
        ),

      );
    },);
  }
}