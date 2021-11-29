import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'Maps.dart';

class Grocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [Container(
              padding: EdgeInsets.fromLTRB(20.0,100.0,40.0,500.0),
              child: Text('Grocery',
                style: TextStyle(
                  fontFamily: 'Alegreya',
                  fontSize: 40.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (Main())),
                        );
                      },

                      child: Text('Main')
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Maps()),
                      );
                    },


                    child: Text('Maps') ,


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