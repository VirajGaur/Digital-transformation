import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        children: [
          Row(

            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.0,300.0,40.0,20.0),
                child: Text('Welcome to our ',
                  style: TextStyle(
                    fontFamily: 'Alegreya',
                    fontSize: 40.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],

          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.0,0.0,40.0,20.0),
                child: Text('prototype',
                  style: TextStyle(
                    fontFamily: 'Alegreya',
                    fontSize: 40.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment : MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){},
                  child: Text('Sign up')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },


                child: Text('Sign in') ,


              ),
            ],
          ),
        ],
      ),

    );

  }
}