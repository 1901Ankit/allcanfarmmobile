// import 'package:allcanfarmapp/FarmerList.dart';
// import 'package:allcanfarmapp/dashboard.dart';
// import 'package:allcanfarmapp/mainprofile.dart';
// import 'package:allcanfarmapp/packages.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:allcanfarmapp/profile.dart';
// import 'package:allcanfarmapp/userprofile.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:allcanfarmapp/Farm.dart';
// import 'package:allcanfarmapp/FarmerList.dart';
// import 'package:allcanfarmapp/addFarm.dart';
// import 'package:allcanfarmapp/adoption.dart';
// import 'package:allcanfarmapp/mainprofile.dart';
// import 'package:allcanfarmapp/packages.dart';
// import 'package:allcanfarmapp/userprofile.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:allcanfarmapp/create_post.dart';
// import 'package:allcanfarmapp/menu.dart';
// import 'package:allcanfarmapp/profile.dart';
// import 'package:allcanfarmapp/register.dart';
// import 'package:allcanfarmapp/settings.dart';
// import 'package:allcanfarmapp/about.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:async';

// class Menu extends StatefulWidget {
//   final String login_token;
//   Menu(this.login_token);
//   @override

//   // _OTPScreenState createState() => _OTPScreenState();
//   _MenuScreenState createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<Menu> {
//   List<dynamic> object = [];
//   late List<dynamic> Postobject;
//   Future getDashBoard(
//     BuildContext context,
//     // int group,
//     String login_token,
//     // String group_name,
//   ) async {
//     final response = await http.get(
//       Uri.parse('http://10.0.2.2:8081/api/dashboard-angel-farmer'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer $login_token',
//       },
//     );

//     if (response.statusCode == 200) {
//       // print("dnfcdfmd $title");
//       var res = jsonDecode(response.body);
//       var resp = res["response"];
//       var message = resp["message"];
//       setState(() {
//         object = [message];
//       });
//       // print(res);
//       // print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//       // print(message);
//       // print('>>>>>>>>>>>>>>>>>> ${object[0]["total_trees"]}');
//     } else {
//       throw Exception('Failed to create album.');
//     }
//   }

// // class Menu extends StatefulWidget {
//   int _selectedScreenIndex = 0;
//   late List _screens;

//   @override
//   initState() {
//     _screens = [
//       {"screen": Menu(widget.login_token), "title": "DashBoard"},
//       {"screen": Packages(widget.login_token), "title": "Packages"},
//       {"screen": MySelfProfile(widget.login_token), "title": "Profile"},
//       // {"screen": FarmerList(), "title": "List"}
//     ];
//     getDashBoard(context, widget.login_token);
//   }

//   void _selectScreen(int index) {
//     setState(() {
//       _selectedScreenIndex = index;
//     });
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//             builder: (context) => _screens[_selectedScreenIndex]["screen"]),
//         (route) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/background.jpeg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("DashBoard",
//                 style: TextStyle(
//                     // color: Colors.black,
//                     fontFamily: 'Poppins')),
//             actions: <Widget>[
//               // FaIcon(FontAwesomeIcons.bell),
//               IconButton(
//                 icon: const FaIcon(FontAwesomeIcons.solidBell),
//                 tooltip: 'Show Snackbar',
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text('hello,This is a snackbar')));
//                 },
//               ),
//             ],
//             backgroundColor: Colors.green[300],
//           ),
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//               child: Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(top: 20, left: 20, right: 20),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Flexible(
//                           flex: 1,
//                           child: TextField(
//                             // cursorHeight: 10,
//                             cursorColor: Colors.grey,
//                             decoration: InputDecoration(
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: 10.0, horizontal: 20.0),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(40),
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 193, 63, 40))),
//                                 hintText: 'Search',
//                                 hintStyle:
//                                     TextStyle(color: Colors.grey, fontSize: 18),
//                                 suffixIcon: Container(
//                                   padding: EdgeInsets.all(15),
//                                   child:
//                                       Image.asset('assets/images/search.png'),
//                                   width: 18,
//                                 )),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 15,
//                   ),
//                   SizedBox(
//                     height: 100,
//                     width: 150,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: new RoundedRectangleBorder(
//                             // side: BorderSide(
//                             //   color: Colors.black,
//                             //width:2 //<-- SEE HERE
//                             // ),
//                             borderRadius: new BorderRadius.circular(10.0),
//                           ),
//                           primary: Colors.white,
//                           // Color.fromARGB(255, 193, 63, 40), // background

//                           // foreground
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     Packages(widget.login_token)),
//                           );
//                         },
//                         child: Container(
//                             child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // FaIcon(FontAwesomeIcons.magnifyingGlassLocation),
//                             Image.asset(
//                               "assets/images/AngelFarmerIcon1.png",
//                               scale: 15,
//                             ),
//                             SizedBox(height: 6),
//                             Text(
//                               "Adopt Farm",
//                               style: TextStyle(
//                                   fontFamily: "Poppins", color: Colors.black),
//                             ),
//                           ],
//                         ))),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   SizedBox(
//                     height: 100,
//                     // width: 100,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             shape: new RoundedRectangleBorder(
//                               side: BorderSide(
//                                   color: Color.fromARGB(255, 193, 63, 41),
//                                   width: 1.5),
//                               borderRadius: new BorderRadius.circular(10.0),
//                             ),
//                             primary: Colors.white),
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(builder: (context) => Farm()),
//                           // );
//                         },
//                         child: Container(
//                             child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // FaIcon(
//                             //   FontAwesomeIcons.fileImport,
//                             //   color: Colors.black,
//                             // ),
//                             Image.asset(
//                               "assets/images/Asset1.png",
//                               scale: 15,
//                             ),
//                             SizedBox(height: 6),
//                             Text(
//                               "View Farm",
//                               style: TextStyle(
//                                   fontFamily: "Poppins", color: Colors.black),
//                             ),
//                           ],
//                         ))),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   SizedBox(
//                     width: 100,
//                     height: 100,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: new RoundedRectangleBorder(
//                             side: BorderSide(
//                                 color: Color.fromARGB(255, 193, 63, 41),
//                                 width: 1.5 //<-- SEE HERE
//                                 ),
//                             borderRadius: new BorderRadius.circular(10.0),
//                           ),
//                           primary: Colors.white, // background

//                           // foreground
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     MySelfProfile(widget.login_token)),
//                           );
//                         },
//                         child: Container(
//                             child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // FaIcon(
//                             //   FontAwesomeIcons.idCard,
//                             //   color: Colors.black,
//                             // ),
//                             Image.asset(
//                               "assets/images/Asset3.png",
//                               scale: 15,
//                             ),
//                             // Image.asset("assets/images/AngelFarmerIcon.jpg"),
//                             SizedBox(height: 6),
//                             Text(
//                               "Profile",
//                               style: TextStyle(
//                                   fontFamily: "Poppins", color: Colors.black),
//                             ),
//                           ],
//                         ))),
//                   ),
//                 ],
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                         color: Color.fromARGB(255, 193, 63, 40), width: 2),
//                     borderRadius: BorderRadius.circular(10.0)),
//                 margin: EdgeInsets.only(top: 40, right: 10, left: 10),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 30, bottom: 30, right: 10, left: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Text("Today"),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(
//                             "Total Trees Adopted : 100",
//                             style: const TextStyle(
//                                 color: Colors.black, fontFamily: 'Poppins'),
//                           ),
//                           Text(
//                             "Total Crops Adopted : 45",
//                             style: const TextStyle(
//                                 color: Colors.black, fontFamily: 'Poppins'),
//                           ),
//                           // Text(
//                           //   "Size Of Farm : 45 hectare",
//                           //   style: const TextStyle(color: Colors.black),
//                           // ),
//                           Text(
//                             "Number Of Farm Adopted: 9",
//                             style: const TextStyle(
//                                 color: Colors.black, fontFamily: 'Poppins'),
//                           ),
//                           Text(
//                             "Total Number Of Farmer Involved : 3",
//                             style: const TextStyle(
//                                 color: Colors.black, fontFamily: 'Poppins'),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircularPercentIndicator(
//                             radius: 55,
//                             lineWidth: 14,
//                             animation: true,
//                             animationDuration: 1500,
//                             circularStrokeCap: CircularStrokeCap.round,
//                             percent: 75 / 100,
//                             progressColor: Colors.green[400],
//                             center: Text(
//                               "CARBON NEUTRALS",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),

//               SizedBox(
//                 height: 20,
//               ),
//               Text("Stories",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'Poppins',
//                       fontSize: 20)),
//               // Divider(
//               //   height: 20,
//               //   thickness: 1,
//               //   endIndent: 0,
//               //   color: Colors.black,
//               // ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                         color: Color.fromARGB(255, 193, 63, 40), width: 2),
//                     borderRadius: BorderRadius.circular(10.0)),
//                 margin: EdgeInsets.only(
//                   top: 20,
//                   right: 10,
//                   left: 10,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10, top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage:
//                                     AssetImage('assets/images/profile.jpg'),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     " Kunal sharma",
//                                     style: TextStyle(
//                                         color: Colors.green[600],
//                                         fontWeight: FontWeight.w500,
//                                         fontFamily: 'Poppins'),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         " 15hrs",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontFamily: 'Poppins',
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                       Icon(
//                                         Icons.watch_later_rounded,
//                                         color: Colors.grey,
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(top: 0),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "Follow",
//                                       style: TextStyle(
//                                           fontSize: 14.0,
//                                           color: Colors.green[600],
//                                           fontFamily: 'Poppins'),
//                                     ),
//                                     Icon(
//                                       Icons.bookmark,
//                                       color: Colors.grey[700],
//                                     ),
//                                     Icon(
//                                       Icons.more_horiz,
//                                       color: Colors.grey[700],
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                   "",
//                                   style: TextStyle(
//                                     fontSize: 14.0,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 10),
//                       child: Text(
//                         "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
//                         style: TextStyle(
//                             color: Colors.grey, fontFamily: 'Poppins-Light'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: Column(
//                         children: [Image.asset("assets/images/profile.jpg")],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10, top: 5),
//                       child: Row(
//                         children: [
//                           Text(
//                             "15 Like",
//                             style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           SizedBox(
//                             width: 90,
//                           ),
//                           Text(
//                             "61 Comments",
//                             style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Divider(
//                       height: 20,
//                       thickness: 1,
//                       endIndent: 0,
//                       color: Colors.grey[200],
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(Icons.thumb_up_off_alt_outlined),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Like",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins-Light',
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(Icons.comment),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Comments",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins-Light',
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               FaIcon(FontAwesomeIcons.share),
//                               // Icon(Icons.share),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Share",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins-Light',
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                         color: Color.fromARGB(255, 193, 63, 40), width: 2),
//                     borderRadius: BorderRadius.circular(10.0)),
//                 margin: EdgeInsets.only(
//                   top: 20,
//                   right: 10,
//                   left: 10,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10, top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage:
//                                     AssetImage('assets/images/profile.jpg'),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     " Kunal sharma",
//                                     style: TextStyle(
//                                         color: Colors.green[600],
//                                         fontWeight: FontWeight.w500,
//                                         fontFamily: 'Poppins'),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         " 15hrs",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontFamily: 'Poppins',
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                       Icon(
//                                         Icons.watch_later_rounded,
//                                         color: Colors.grey,
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(top: 0),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "Follow",
//                                       style: TextStyle(
//                                           fontSize: 14.0,
//                                           color: Colors.green[600],
//                                           fontFamily: 'Poppins'),
//                                     ),
//                                     Icon(
//                                       Icons.bookmark,
//                                       color: Colors.grey[700],
//                                     ),
//                                     Icon(
//                                       Icons.more_horiz,
//                                       color: Colors.grey[700],
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                   "",
//                                   style: TextStyle(
//                                     fontSize: 14.0,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 10),
//                       child: Text(
//                         "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
//                         style: TextStyle(
//                             color: Colors.grey, fontFamily: 'Poppins-Light'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: Column(
//                         children: [Image.asset("assets/images/profile.jpg")],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10, top: 5),
//                       child: Row(
//                         children: [
//                           Text(
//                             "15 Like",
//                             style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           SizedBox(
//                             width: 90,
//                           ),
//                           Text(
//                             "61 Comments",
//                             style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Divider(
//                       height: 20,
//                       thickness: 1,
//                       endIndent: 0,
//                       color: Colors.grey[200],
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(Icons.thumb_up_off_alt_outlined),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Like",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins-Light',
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(Icons.comment),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Comments",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins-Light',
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               FaIcon(FontAwesomeIcons.share),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Share",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins-Light',
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           )),
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: Color.fromARGB(255, 193, 63, 40),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => CreatePost(widget.login_token)),
//               );
//             },
//             child: const Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: _selectedScreenIndex,
//             onTap: _selectScreen,
//             items: const [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.home), label: 'Dashboard'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.list), label: "Packages"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.account_circle), label: "Profile"),
//               // BottomNavigationBarItem(icon: Icon(Icons.library_add), label: "List"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
