import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Grocery.dart';
import 'MainScreen.dart';
import 'Maps.dart';

class  mainState extends StatefulWidget {
  @override
  final String Name;
  final String Email;
  const mainState({Key? key, required this.Name, required this.Email}) : super(key: key);
   _mainState createState() => _mainState(Name:Name, Email: Email);
}

class _mainState extends State<mainState> {
  @override
  int index=0;
   final String Name;
   final String Email;
   _mainState({ required this.Name, required this.Email}) : super();
  List<String> titles=
  [
    "Main Menu",
    "Groceries",
    "Maps",
  ];
  List<Widget> screens=
  [

    Grocery(),
    Maps(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          titles[index],
          style:TextStyle(
            color: Colors.white,
            fontFamily: "Alegreya",
          ),

        ),
      ),
      body: Container(
          color: Colors.white,
          child: (index>0)
              ? screens[index-1]
              : mainscreen(name: Name, email: Email)
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int Index){
          setState(() {
            index=Index;
          });

        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Main Screen"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store),
              label: "grocery"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: "Maps"
          ),
        ],
        backgroundColor: Colors.red,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        type: BottomNavigationBarType.fixed,
      ),
      /* body: Row(
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
      ),*/

    );
  }
}
