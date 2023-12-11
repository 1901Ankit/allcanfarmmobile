// // import 'dart:html';

// import 'package:allcanfarmapp/Farm.dart';
// import 'package:allcanfarmapp/FarmerData.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class ProfileUI2 extends StatelessWidget {
//   final FarmerData datapass;
//   ProfileUI2(this.datapass);
//   @override
//   Widget build(BuildContext context) {
//     print(datapass);
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.green[300],
//           title: Text(
//             'Selected Profile',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: ListView(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/background.jpg'),
//                           fit: BoxFit.cover)),
//                   child: Container(
//                     width: double.infinity,
//                     height: 200,
//                     child: Container(
//                       alignment: Alignment(0.0, 2.5),
//                       child: CircleAvatar(
//                         backgroundImage:
//                             AssetImage('assets/images/profile.jpg'),
//                         radius: 60.0,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Text(
//                   "${datapass.name}",
//                   style: TextStyle(
//                       fontSize: 25.0,
//                       color: Colors.blueGrey,
//                       letterSpacing: 2.0,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "${datapass.mobile}",
//                   style: TextStyle(
//                       fontSize: 18.0,
//                       color: Colors.black45,
//                       letterSpacing: 2.0,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w300),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Farmer",
//                   style: TextStyle(
//                       fontSize: 15.0,
//                       color: Colors.black45,
//                       letterSpacing: 2.0,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w300),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Card(
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//                     color: Colors.orange,
//                     elevation: 2.0,
//                     child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//                         child: Text(
//                           "${datapass.rating.length - 1} Stars",
//                           style: TextStyle(
//                               letterSpacing: 2.0,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w700),
//                         ))),
//                 SizedBox(
//                   height: 15,
//                 ),

//                 Card(
//                   margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Age",
//                                 style: TextStyle(
//                                     color: Colors.blueAccent,
//                                     fontSize: 22.0,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               SizedBox(
//                                 height: 7,
//                               ),
//                               Text(
//                                 "${datapass.age}",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 22.0,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w300),
//                               )
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Gender",
//                                 style: TextStyle(
//                                     color: Colors.blueAccent,
//                                     fontSize: 22.0,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               SizedBox(
//                                 height: 7,
//                               ),
//                               Text(
//                                 "${datapass.gender}",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 22.0,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w300),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 Card(
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//                     color: Colors.blue[200],
//                     elevation: 2.0,
//                     child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//                         child: Text(
//                           "Stay(Available)",
//                           style: TextStyle(
//                               letterSpacing: 2.0,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w700),
//                         ))),
//                 SizedBox(
//                   height: 15,
//                 ),

//                 Text(
//                   "Farms",
//                   style: TextStyle(
//                       color: Colors.red.shade700,
//                       fontSize: 32.0,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w900),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Card(
//                   elevation: 50,
//                   shadowColor: Colors.black,
//                   color: Colors.greenAccent[100],
//                   child: SizedBox(
//                     width: 300,
//                     // height: 500,
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 10,
//                           ), //SizedBox
//                           Text(
//                             'Mango Tree Farm',
//                             style: TextStyle(
//                               fontSize: 30,
//                               color: Colors.green[900],
//                               fontWeight: FontWeight.w500,
//                             ), //Textstyle
//                           ), //Text
//                           const SizedBox(
//                             height: 10,
//                           ), //SizedBox
//                           const Text(
//                             'farm area/trees : 200 square metre',
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.green,
//                             ), //Textstyle
//                           ), //Text
//                           const SizedBox(
//                             height: 10,
//                           ), //SizedBox
//                           const Text(
//                             'Address of farm : noida',
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.green,
//                             ), //Textstyle
//                           ), //Text
//                           const SizedBox(
//                             height: 10,
//                           ), //SizedBox
//                           const Text(
//                             'Sowing date : date',
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.green,
//                             ), //Textstyle
//                           ), //Text
//                           const SizedBox(
//                             height: 10,
//                           ), //SizedBox
//                           const Text(
//                             'harvesting date : harvesting date',
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.green,
//                             ), //Textstyle
//                           ), //Text
//                           const SizedBox(
//                             height: 10,
//                           ), //SizedBox
//                           //SizedBox
//                         ],
//                       ), //Column
//                     ), //Padding
//                   ),
//                 ),
//                 CarouselSlider(
//                   items: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Farm()),
//                         );
//                       },
//                       child: Container(
//                           color: Colors.green[100],
//                           height: 280,
//                           child: GridView.extent(
//                             primary: false,
//                             padding: const EdgeInsets.all(16),
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             maxCrossAxisExtent: 150.0,
//                             children: <Widget>[
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Farm 1',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   children: [
//                                     Text('Volume',
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: 'Poppins')),
//                                     SizedBox(height: 20),
//                                     Text(
//                                       "100 trees ,20 crops",
//                                       style: TextStyle(
//                                           fontSize: 14, fontFamily: 'Poppins'),
//                                     )
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Area',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Carbon Nuetrals',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins')),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 75 / 100,
//                                       progressColor: Colors.blue[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Adoption',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins')),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 40 / 100,
//                                       progressColor: Colors.red[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Stay',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                             ],
//                           )),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Farm()),
//                         );
//                       },
//                       child: Container(
//                           color: Colors.green[100],
//                           height: 280,
//                           child: GridView.extent(
//                             primary: false,
//                             padding: const EdgeInsets.all(16),
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             maxCrossAxisExtent: 150.0,
//                             children: <Widget>[
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Farm 2',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   children: [
//                                     Text('Volume',
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: 'Poppins')),
//                                     SizedBox(height: 20),
//                                     Text(
//                                       "100 trees ,20 crops",
//                                       style: TextStyle(
//                                           fontSize: 14, fontFamily: 'Poppins'),
//                                     )
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Area',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Carbon Nuetrals',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins')),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 75 / 100,
//                                       progressColor: Colors.blue[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Adoption',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins')),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 40 / 100,
//                                       progressColor: Colors.red[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Stay',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                             ],
//                           )),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Farm()),
//                         );
//                       },
//                       child: Container(
//                           color: Colors.green[100],
//                           height: 280,
//                           child: GridView.extent(
//                             primary: false,
//                             padding: const EdgeInsets.all(16),
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             maxCrossAxisExtent: 150.0,
//                             children: <Widget>[
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Farm 3',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   children: [
//                                     Text('Volume',
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: 'Poppins')),
//                                     SizedBox(height: 20),
//                                     Text(
//                                       "100 trees ,20 crops",
//                                       style: TextStyle(fontSize: 14),
//                                     )
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Area',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Carbon Nuetrals',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins')),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 75 / 100,
//                                       progressColor: Colors.blue[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Adoption',
//                                         style: TextStyle(
//                                             fontFamily: 'Poppins',
//                                             fontSize: 12)),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 40 / 100,
//                                       progressColor: Colors.red[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Stay',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                             ],
//                           )),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Farm()),
//                         );
//                       },
//                       child: Container(
//                           color: Colors.green[100],
//                           height: 280,
//                           child: GridView.extent(
//                             primary: false,
//                             padding: const EdgeInsets.all(16),
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             maxCrossAxisExtent: 150.0,
//                             children: <Widget>[
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Farm 4',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   children: [
//                                     Text('Volume',
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: 'Poppins')),
//                                     SizedBox(height: 20),
//                                     Text(
//                                       "100 trees ,20 crops",
//                                       style: TextStyle(
//                                           fontSize: 14, fontFamily: 'Poppins'),
//                                     )
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Area',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Carbon Nuetrals',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins')),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 75 / 100,
//                                       progressColor: Colors.blue[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Adoption',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins')),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 40 / 100,
//                                       progressColor: Colors.red[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Stay',
//                                     style: TextStyle(
//                                         fontFamily: 'Poppins', fontSize: 20)),
//                                 color: Colors.blue.shade100,
//                               ),
//                             ],
//                           )),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Farm()),
//                         );
//                       },
//                       child: Container(
//                           color: Colors.green[100],
//                           height: 280,
//                           child: GridView.extent(
//                             primary: false,
//                             padding: const EdgeInsets.all(16),
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             maxCrossAxisExtent: 150.0,
//                             children: <Widget>[
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Farm 5',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   children: [
//                                     Text('Volume',
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: 'Poppins')),
//                                     SizedBox(height: 20),
//                                     Text(
//                                       "100 trees ,20 crops",
//                                       style: TextStyle(
//                                           fontSize: 14, fontFamily: 'Poppins'),
//                                     )
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Area',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Carbon Nuetrals',
//                                         style: TextStyle(
//                                             fontFamily: 'Poppins',
//                                             fontSize: 12)),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 75 / 100,
//                                       progressColor: Colors.blue[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Adoption',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins')),
//                                     CircularPercentIndicator(
//                                       radius: 40,
//                                       lineWidth: 14,
//                                       animation: true,
//                                       animationDuration: 1500,
//                                       circularStrokeCap:
//                                           CircularStrokeCap.round,
//                                       percent: 40 / 100,
//                                       progressColor: Colors.red[400],
//                                       // center: Text(
//                                       //   "CARBON FOOTPRINT",
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //       color: Colors.black, fontSize: 8),
//                                       // ),
//                                     ),
//                                   ],
//                                 ),
//                                 color: Colors.blue.shade100,
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Text('Stay',
//                                     style: TextStyle(
//                                         fontSize: 20, fontFamily: 'Poppins')),
//                                 color: Colors.blue.shade100,
//                               ),
//                             ],
//                           )),
//                     ),
//                   ],

//                   //Slider Container properties
//                   options: CarouselOptions(
//                     height: 270.0,
//                     enlargeCenterPage: true,
//                     autoPlay: true,
//                     aspectRatio: 16 / 9,
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enableInfiniteScroll: true,
//                     autoPlayAnimationDuration: Duration(milliseconds: 800),
//                     viewportFraction: 0.95,
//                   ),
//                 ),
//                 // Container(
//                 //   margin: const EdgeInsets.all(10.0),
//                 //   child: ClipRect(
//                 //     /** Banner Widget **/

//                 //     // message: "20% off !!",
//                 //     // location: BannerLocation.bottomStart,
//                 //     // color: Colors.red,
//                 //     child: Container(
//                 //       color: Colors.green[100],
//                 //       height: 320,
//                 //       child: Padding(
//                 //         padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 //         child: Column(
//                 //           children: <Widget>[
//                 //             Image.network(
//                 //                 'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg'), //Image.network
//                 //             const SizedBox(height: 10),
//                 //             const Text(
//                 //               'Hello',
//                 //               style: TextStyle(
//                 //                   color: Colors.green,
//                 //                   fontSize: 40,
//                 //                   fontWeight: FontWeight.bold), //TextStyle
//                 //             ),
//                 //             const SizedBox(
//                 //               height: 5,
//                 //             ), //SizedBox
//                 //             const Text(
//                 //               'Fork Python Course',
//                 //               style: TextStyle(
//                 //                   color: Colors.green,
//                 //                   fontSize: 20,
//                 //                   fontWeight: FontWeight.bold), //TextStyle
//                 //             ), //Text
//                 //             const SizedBox(height: 20),

//                 //             // RaiseButton is deprecated and should not be used. Use ElevatedButton instead.

//                 //             RaisedButton(
//                 //               color: Colors.greenAccent[400],
//                 //               onPressed: () {},
//                 //               child: const Text('Register'),
//                 //             ) //RaisedButton
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // ), /
//                 // /container

//                 SizedBox(
//                   height: 30,
//                 ),
//               ],

//               // Row(
//               //   children: [r
//               //     RatingBar.builder(
//               //       initialRating: 3,
//               //       minRating: 1,
//               //       direction: Axis.horizontal,
//               //       allowHalfRating: true,
//               //       itemCount: 3,
//               //       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//               //       itemBuilder: (context, _) => Icon(
//               //         Icons.star,
//               //         color: Colors.amber,
//               //       ),
//               //       onRatingUpdate: (rating) {
//               //         print(rating);
//               //       },
//               //     ),
//               //   ],
//               // ),
//             ),
//           ],
//         ));
//   }
// }

import 'package:allcanfarmapp/Farm.dart';
import 'package:allcanfarmapp/FarmerData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileUI2 extends StatelessWidget {
  final FarmerData datapass;
  final String login_token;
  final String group;
  ProfileUI2(this.datapass, this.login_token, this.group);
  bool mode = true;
  @override
  Widget build(BuildContext context) {
    print(datapass.farmes);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: Text(
            'Farmer Profile',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                          fit: BoxFit.cover)),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: Container(
                      alignment: Alignment(0.0, 2.5),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "${datapass.name}",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${datapass.mobile}",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Farmer",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    color: Colors.orange,
                    elevation: 2.0,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        child: Text(
                          "${datapass.rating.length - 1} Stars",
                          style: TextStyle(
                              letterSpacing: 2.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 22.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${datapass.age}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Gender",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 22.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${datapass.gender}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    color: Colors.blue[200],
                    elevation: 2.0,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        child: Text(
                          "Stay(Available)",
                          style: TextStyle(
                              letterSpacing: 2.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Farms",
                  style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 32.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 25,
                ),
                datapass.farmes.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: datapass.farmes.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                List<dynamic> formDb = [datapass.farmes[index]];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Farm(formDb, login_token, group)),
                                );
                              },
                              child: Card(
                                  color: Colors.green[100],
                                  margin: EdgeInsets.all(20),
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${datapass.farmes[index]["type"] == "tree" ? "mango" : "wheat"} Farm",
                                              style: TextStyle(
                                                fontFamily: 'Poppins-Bold',
                                                fontSize: 18,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(children: [
                                              Text(
                                                  "${datapass.farmes[index]["type"] == "crop" ? "Farme area" : "Total Tree"}"),
                                              Text("Address"),
                                              Text("Sowing Date"),
                                              Text("Harvesting Date"),
                                            ]),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 40),
                                              child: Column(
                                                children: [
                                                  Text(
                                                      "${datapass.farmes[index]["type"] == "crop" ? "${datapass.farmes[index]["remaining_area"]} Square Metre" : "${datapass.farmes[index]["remaining_tree"]} trees"}"),
                                                  Text(
                                                      "${datapass.farmes[index]["address"]}"),
                                                  Text(
                                                      "${datapass.farmes[index]["sowing_month"]}"),
                                                  Text(
                                                      "${datapass.farmes[index]["harvest_month"]}"),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                  // ),
                                  ));
                        })
                    : Text(
                        "No Farm Listed",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                      ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ));
  }
}
