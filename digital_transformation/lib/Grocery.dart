import 'package:flutter/material.dart';
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

class Grocery extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: 0.75),
          itemCount: 20,
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
                              'https://digitalcontent.api.tesco.com/v2/media/ghs/644848dc-9adf-40eb-b3cc-065bfbf0426c/snapshotimagehandler_4419443.jpeg?h=540&w=540',
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
                                        'Milk'
                                    ),

                                  ],
                                ),
                                Padding(
                                    padding:const EdgeInsets.symmetric(horizontal:20.0)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '£2.50'
                                    ),

                                  ],
                                ),
                              ],
                            ),

                          ),
                        ),
                        Padding(
                            padding:const EdgeInsets.symmetric(vertical:15.0)),
                        Container(
                          child:Container(
                            child:Row(

                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),

                                  ],
                                ),
                                Padding(
                                    padding:const EdgeInsets.symmetric(horizontal:10.0)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: (){
                                      },
                                      child: Text("find"),
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
                        Container(
                          child:Container(
                            child:Row(

                              children: [


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



