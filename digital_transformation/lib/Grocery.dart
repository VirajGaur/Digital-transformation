import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:show_up_animation/show_up_animation.dart';
// Expanded(
//
// child:
// Container(
// padding:const EdgeInsets.all(20.0),
// decoration: BoxDecoration(
// border:Border.all(color: Colors.white,width: 2.0),
// color: Colors.red,
// borderRadius: BorderRadius.circular(5.0),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 120,
// height: 120,
// decoration: BoxDecoration( image: DecorationImage(
// image: NetworkImage(
// 'https://digitalcontent.api.tesco.com/v2/media/ghs/644848dc-9adf-40eb-b3cc-065bfbf0426c/snapshotimagehandler_4419443.jpeg?h=540&w=540',
// ),
// fit: BoxFit.cover,
//
// )),
//
// ),
// Container(
// child:Container(
// child:Row(
//
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Milk'
// ),
//
// ],
// ),
// Padding(
// padding:const EdgeInsets.symmetric(horizontal:20.0)),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// '£2.50'
// ),
//
// ],
// ),
// ],
// ),
//
// ),
// ),
// Padding(
// padding:const EdgeInsets.symmetric(vertical:15.0)),
// Container(
// child:Container(
// child:Row(
//
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Available',
// style: TextStyle(
// color: Colors.green,
// ),
// ),
//
// ],
// ),
// Padding(
// padding:const EdgeInsets.symmetric(horizontal:10.0)),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// ElevatedButton(
// onPressed: (){
// },
// child: Text("find"),
// style: ButtonStyle(
// backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
//
// foregroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
// ),
// ),
// ],
// ),
//
// ],
// ),
//
// ),
// ),
// Container(
// child:Container(
// child:Row(
//
// children: [
//
//
// ],
// ),
//
// ),
// ),
// ],
// ),
// ),
// ),
import 'MainScreen.dart';
import 'Maps.dart';

class Grocery extends StatefulWidget {
  @override
  final String Email;
  const Grocery({Key? key, required this.Email}) : super(key: key);
  _groceryState createState() => _groceryState(Email: Email);

  }

class _groceryState extends State<Grocery>{
  @override
  List storeID =[] ;
  List productID =[];
  List TotalQuantity =[] ;
  List Availability =[];
  List Xcord=[];
  List Ycord=[];
  List ProductName=[];
  List Price=[];
  List image=[];
  var x=0;
  final String Email;
  _groceryState({ required this.Email}) : super();
  connectToSQL() async {
    var settings = new ConnectionSettings(
        host: 'ec2-54-208-82-154.compute-1.amazonaws.com',
        port: 3306,
        user: 'Youssef',
        password: '40247459',
        db: 'CSC4008'
    );
    int port = settings.port;
    var resultsx=null;
    var conn = await MySqlConnection.connect(settings);
    var count=await conn.query('SELECT StoreID,ProductID,Total_Quantity,Availability,`Co-ordinate X`,`Co-ordinate Y` FROM Inventory');
    var results = await conn.query('SELECT x.StoreID,x.ProductID,x.Total_Quantity,x.Availability,x.`Co-ordinate X`,x.`Co-ordinate Y`,y.ProductName,y.Price,y.Image FROM Inventory x INNER JOIN Product y ON x.ProductID = y.ProductID');

    for (var row in results) {
      setState(() {

          storeID.add(row[0]);
          productID.add(row[1]);
          TotalQuantity.add(row[2]);
          Availability.add(row[3]);
          Xcord.add(row[4]);
          Ycord.add(row[5]);
          ProductName.add(row[6]);
          Price.add(row[7]);
          image.add(row[8]);
      });

    };

    conn.close();
  }
  Widget build(BuildContext context) {
    if(x==0)
      {
        connectToSQL();
        x++;
      }
    return Scaffold(
      body: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio: 0.80),
          itemCount: storeID.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              child: ShowUpAnimation(
                delayStart: Duration(milliseconds: 200),
                animationDuration: Duration(milliseconds: 800),
                curve: Curves.easeInCubic,
                direction: Direction.horizontal,
                offset: 0.5,
                child: Expanded(

                  child:
                  Container(
                    padding:const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border:Border.all(color: Colors.white,width: 2.0),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration( image: DecorationImage(
                            image: NetworkImage(
                           '${image[index]}'
                            ),
                            fit: BoxFit.cover,

                          )),

                        ),
                        Container(
                          child:Container(
                            child:Row(

                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        ProductName[index],
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ],
                                ),


                              ],
                            ),

                          ),
                        ),
                        Container(
                          child:Container(
                            child:Row(

                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '£${Price[index]}',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ],
                                ),


                              ],
                            ),

                          ),
                        ),
                        Container(
                          child:Container(
                            child:Row(

                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [],
                                ),
                                Padding(
                                    padding:const EdgeInsets.symmetric(horizontal:5.0)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        var settings = new ConnectionSettings(
                                            host: 'ec2-54-208-82-154.compute-1.amazonaws.com',
                                            port: 3306,
                                            user: 'Youssef',
                                            password: '40247459',
                                            db: 'CSC4008'
                                        );
                                       int  port = settings.port;

                                        var conn = await MySqlConnection.connect(settings);
                                        var ID = await conn.query("SELECT CustomerID FROM Customer WHERE EmailAddress = '" + Email +"';");
                                        String IDS="";
                                        for( var row in ID){
                                          IDS=row[0].toString();
                                        }
                                        if(IDS.isEmpty==false){
                                          var IN = await conn.query("INSERT INTO GroceryList(productID,customerID) VALUES ('" + productID[index].toString() +"','" + IDS +"');");
                                        }

                                      },
                                      child: Text("Add"),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),

                                        foregroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),

                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      // body:Flex(
      //   direction: Axis.vertical,
      //   children: [
      //     Row(
      //       children: [
      //         Expanded(
      //
      //           child:
      //           Container(
      //             padding:const EdgeInsets.all(20.0),
      //             decoration: BoxDecoration(
      //               border:Border.all(color: Colors.white,width: 2.0),
      //               color: Colors.red,
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Container(
      //                   width: 120,
      //                   height: 120,
      //                   decoration: BoxDecoration( image: DecorationImage(
      //                     image: NetworkImage(
      //                       'https://digitalcontent.api.tesco.com/v2/media/ghs/644848dc-9adf-40eb-b3cc-065bfbf0426c/snapshotimagehandler_4419443.jpeg?h=540&w=540',
      //                     ),
      //                     fit: BoxFit.cover,
      //
      //                   )),
      //
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 'Milk'
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Padding(
      //                             padding:const EdgeInsets.symmetric(horizontal:20.0)),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 '£2.50'
      //                             ),
      //
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               'Available',
      //                               style: TextStyle(
      //                                 color: Colors.green,
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Padding(
      //             padding:const EdgeInsets.symmetric(horizontal:5.0)),
      //         Expanded(
      //
      //           child:
      //           Container(
      //             padding:const EdgeInsets.all(20.0),
      //             decoration: BoxDecoration(
      //               border:Border.all(color: Colors.white,width: 2.0),
      //               color: Colors.red,
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Container(
      //                   width: 120,
      //                   height: 120,
      //                   decoration: BoxDecoration( image: DecorationImage(
      //                     image: NetworkImage(
      //                       'https://digitalcontent.api.tesco.com/v2/media/ghs/644848dc-9adf-40eb-b3cc-065bfbf0426c/snapshotimagehandler_4419443.jpeg?h=540&w=540',
      //                     ),
      //                     fit: BoxFit.cover,
      //
      //                   )),
      //
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 'Milk'
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Padding(
      //                             padding:const EdgeInsets.symmetric(horizontal:20.0)),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 '£2.50'
      //                             ),
      //
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               'Available',
      //                               style: TextStyle(
      //                                 color: Colors.green,
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         Expanded(
      //
      //           child:
      //           Container(
      //             padding:const EdgeInsets.all(20.0),
      //             decoration: BoxDecoration(
      //               border:Border.all(color: Colors.white,width: 2.0),
      //               color: Colors.red,
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Container(
      //                   width: 120,
      //                   height: 120,
      //                   decoration: BoxDecoration( image: DecorationImage(
      //                     image: NetworkImage(
      //                       'https://digitalcontent.api.tesco.com/v2/media/ghs/644848dc-9adf-40eb-b3cc-065bfbf0426c/snapshotimagehandler_4419443.jpeg?h=540&w=540',
      //                     ),
      //                     fit: BoxFit.cover,
      //
      //                   )),
      //
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 'Milk'
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Padding(
      //                             padding:const EdgeInsets.symmetric(horizontal:20.0)),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 '£2.50'
      //                             ),
      //
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //                 Padding(
      //                     padding:const EdgeInsets.symmetric(vertical:15.0)),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               'Available',
      //                               style: TextStyle(
      //                                 color: Colors.green,
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Padding(
      //                             padding:const EdgeInsets.symmetric(horizontal:10.0)),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             ElevatedButton(
      //                               onPressed: (){
      //                               },
      //                               child: Text("find"),
      //                               style: ButtonStyle(
      //                                 backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
      //
      //                                 foregroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //
      //
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Padding(
      //             padding:const EdgeInsets.symmetric(horizontal:5.0)),
      //         Expanded(
      //
      //           child:
      //           Container(
      //             padding:const EdgeInsets.all(20.0),
      //             decoration: BoxDecoration(
      //               border:Border.all(color: Colors.white,width: 2.0),
      //               color: Colors.red,
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Container(
      //                   width: 120,
      //                   height: 120,
      //                   decoration: BoxDecoration( image: DecorationImage(
      //                     image: NetworkImage(
      //                       'https://digitalcontent.api.tesco.com/v2/media/ghs/644848dc-9adf-40eb-b3cc-065bfbf0426c/snapshotimagehandler_4419443.jpeg?h=540&w=540',
      //                     ),
      //                     fit: BoxFit.cover,
      //
      //                   )),
      //
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 'Milk'
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Padding(
      //                             padding:const EdgeInsets.symmetric(horizontal:20.0)),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 '£2.50'
      //                             ),
      //
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               'Available',
      //                               style: TextStyle(
      //                                 color: Colors.green,
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         Expanded(
      //
      //           child:
      //           Container(
      //             padding:const EdgeInsets.all(20.0),
      //             decoration: BoxDecoration(
      //               border:Border.all(color: Colors.white,width: 2.0),
      //               color: Colors.red,
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Container(
      //                   width: 120,
      //                   height: 120,
      //                   decoration: BoxDecoration( image: DecorationImage(
      //                     image: NetworkImage(
      //                       'https://digitalcontent.api.tesco.com/v2/media/ghs/644848dc-9adf-40eb-b3cc-065bfbf0426c/snapshotimagehandler_4419443.jpeg?h=540&w=540',
      //                     ),
      //                     fit: BoxFit.cover,
      //
      //                   )),
      //
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 'Milk'
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Padding(
      //                             padding:const EdgeInsets.symmetric(horizontal:20.0)),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 '£2.50'
      //                             ),
      //
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               'Available',
      //                               style: TextStyle(
      //                                 color: Colors.green,
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Padding(
      //             padding:const EdgeInsets.symmetric(horizontal:5.0)),
      //         Expanded(
      //
      //           child:
      //           Container(
      //             padding:const EdgeInsets.all(20.0),
      //             decoration: BoxDecoration(
      //               border:Border.all(color: Colors.white,width: 2.0),
      //               color: Colors.red,
      //               borderRadius: BorderRadius.circular(5.0),
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Container(
      //                   width: 120,
      //                   height: 120,
      //                   decoration: BoxDecoration( image: DecorationImage(
      //                     image: NetworkImage(
      //                       'https://digitalcontent.api.tesco.com/v2/media/ghs/644848dc-9adf-40eb-b3cc-065bfbf0426c/snapshotimagehandler_4419443.jpeg?h=540&w=540',
      //                     ),
      //                     fit: BoxFit.cover,
      //
      //                   )),
      //
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 'Milk'
      //                             ),
      //
      //                           ],
      //                         ),
      //                         Padding(
      //                             padding:const EdgeInsets.symmetric(horizontal:20.0)),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                                 '£2.50'
      //                             ),
      //
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //                 Container(
      //                   child:Container(
      //                     child:Row(
      //
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               'Available',
      //                               style: TextStyle(
      //                                 color: Colors.green,
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //
      //                       ],
      //                     ),
      //
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Column(
      //       children: [Container(
      //         padding: EdgeInsets.fromLTRB(20.0,100.0,40.0,0),
      //         child: Text('Grocery',
      //           style: TextStyle(
      //             fontFamily: 'Alegreya',
      //             fontSize: 40.0,
      //             color: Colors.deepPurple,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       /*  Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             ElevatedButton(
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(builder: (context) => (Main())),
      //                   );
      //                 },
      //
      //                 child: Text('Main')
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(builder: (context) => Maps()),
      //                 );
      //               },
      //
      //
      //               child: Text('Maps') ,
      //
      //
      //             ),
      //           ],
      //         ) ,*/
      //       ],
      //     ),
      //   ],
      // ),

    );
  }
}



