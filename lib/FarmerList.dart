// import 'package:allcanfarmapp/dashboard.dart';
// import 'package:allcanfarmapp/mainprofile.dart';
// import 'package:allcanfarmapp/menu.dart';
// import 'package:allcanfarmapp/packages.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:allcanfarmapp/profile.dart';
// import 'package:allcanfarmapp/userprofile.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:async';

// class FarmerList extends StatefulWidget {
//   final String login_token;
//   FarmerList(this.login_token);
//   @override

//   // _OTPScreenState createState() => _OTPScreenState();
//   _FarmerListState createState() => _FarmerListState();
// }

// class _FarmerListState extends State<FarmerList> {
//   var images = [
//     "https://www.melivecode.com/users/1.png",
//     "https://www.melivecode.com/users/3.png",
//     "https://www.melivecode.com/users/4.png",
//     "https://www.melivecode.com/users/2.png",
//     "https://www.melivecode.com/users/5.png"
//   ];
//   int _selectedScreenIndex = 1;
//   List<dynamic> farmerData = [];
//   late List _screens;
//   void farmerList(
//     String login_token,
//   ) async {
//     final response = await http.get(
//       Uri.parse('http://18.138.159.120/api/get-farmers'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer $login_token',
//       },
//     );
//     if (response.statusCode == 200) {
//       var jcode = jsonDecode(response.body);
//       var resp = jcode["response"];
//       var message = resp["message"];
//       setState(() {
//         farmerData = message;
//       });
//       // print(message);
//       print(farmerData[0]);
//       print(farmerData[1]);
//       print(farmerData[2]);
//       print(farmerData[3]);
//       print(farmerData[4]);
//       print(farmerData.length);
//     }
//   }

//   @override
//   initState() {
//     _screens = [
//       {"screen": MyDashboard(widget.login_token), "title": "DashBoard"},
//       {"screen": Packages(widget.login_token), "title": "Packages"},
//       {"screen": MyProfile(widget.login_token), "title": "Profile"},
//       // {"screen": FarmerList(), "title": "List"}
//     ];
//     farmerList(widget.login_token);
//   }

//   void _selectScreen(int index) {
//     setState(() {
//       _selectedScreenIndex = index;
//     });
//     Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => _screens[_selectedScreenIndex]["screen"]));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/background.jpeg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         // )
//         child: Scaffold(
//           // backgroundColor: Colors.green[300],
//           appBar: AppBar(
//             title: Text("Farmer List",
//                 style: TextStyle(
//                     // color: Colors.black,
//                     fontFamily: 'Poppins')),
//             backgroundColor: Colors.green[300],
//           ),

//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 20, left: 20, right: 20),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Flexible(
//                             flex: 1,
//                             child: TextField(
//                               // cursorHeight: 10,
//                               cursorColor: Colors.grey,
//                               decoration: InputDecoration(
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 10.0, horizontal: 20.0),
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(40),
//                                       borderSide: BorderSide(
//                                           color: Color.fromARGB(
//                                               255, 193, 63, 40))),
//                                   hintText: 'Search',
//                                   hintStyle: TextStyle(
//                                       color: Colors.grey, fontSize: 18),
//                                   suffixIcon: Container(
//                                     padding: EdgeInsets.all(15),
//                                     child:
//                                         Image.asset('assets/images/search.png'),
//                                     width: 18,
//                                   )),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   //  crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             side: BorderSide(
//                                 color: Color.fromARGB(255, 193, 63, 40),
//                                 width: 1.5)),
//                         elevation: 4,
//                         color: Colors.white,
//                         shadowColor: Colors.grey,
//                         child: Padding(
//                             padding: EdgeInsets.all(4),
//                             child: Row(
//                               children: [
//                                 Image.network(
//                                   images[0],
//                                   height: 50,
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   "sachin Kumar ",
//                                   style: TextStyle(fontFamily: 'Poppins'),
//                                 ),
//                               ],
//                             ))),
//                     SizedBox(
//                       width: 10.0,
//                     ),
//                     Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             side: BorderSide(
//                                 color: Color.fromARGB(255, 193, 63, 40),
//                                 width: 1.5)),
//                         elevation: 4,
//                         color: Colors.white,
//                         shadowColor: Colors.grey,
//                         child: Padding(
//                             padding: EdgeInsets.all(4),
//                             child: Row(
//                               children: [
//                                 Image.network(
//                                   images[0],
//                                   height: 50,
//                                 ),
//                                 Text("Anuj Kumar ",
//                                     style: TextStyle(fontFamily: 'Poppins')),
//                               ],
//                             )))
//                   ],
//                 ),
//                 Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: farmerData.isNotEmpty
//                         ? GridView.count(
//                             crossAxisCount: 2,
//                             scrollDirection: Axis.vertical,
//                             shrinkWrap: true,
//                             children:
//                                 List.generate(farmerData.length, (int ind) {
//                               print('adffbsdfh ${farmerData.length}');
//                               return Center(
//                                 child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => ProfileUI2(
//                                                 // list: farmerData[index]
//                                                 )),
//                                       );
//                                     },
//                                     child: Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                         ),
//                                         elevation: 4,
//                                         color: Colors.white,
//                                         shadowColor: Colors.grey,
//                                         child: Padding(
//                                             padding: EdgeInsets.all(1),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Center(
//                                                   child: Image.network(
//                                                       'https://www.melivecode.com/users/1.png',
//                                                       width: 100,
//                                                       height: 100,
//                                                       fit: BoxFit.fill),
//                                                 ),
//                                                 Center(
//                                                   child: Text(
//                                                     farmerData[ind]["name"] ==
//                                                             null
//                                                         ? 'User'
//                                                         : "${farmerData[ind]['name']}",
//                                                     style: TextStyle(
//                                                         fontSize: 12.0,
//                                                         color: Colors.blue,
//                                                         fontFamily: 'Poppins',
//                                                         fontWeight:
//                                                             FontWeight.w500),
//                                                   ),
//                                                 ),
//                                                 Center(
//                                                   child: Text(
//                                                     "Mobile",
//                                                     style: TextStyle(
//                                                         fontSize: 12.0,
//                                                         fontFamily: 'Poppins',
//                                                         color: Colors.black,
//                                                         fontWeight:
//                                                             FontWeight.w500),
//                                                   ),
//                                                 ),
//                                                 Center(
//                                                   child: Text(
//                                                     farmerData[ind][
//                                                                 'contact_no'] ==
//                                                             null
//                                                         ? "N\A"
//                                                         : "${farmerData[ind]['contact_no']}",
//                                                     style: TextStyle(
//                                                         fontSize: 12.0,
//                                                         color: Colors.black,
//                                                         fontFamily: 'Poppins',
//                                                         fontWeight:
//                                                             FontWeight.w700),
//                                                   ),
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Icon(
//                                                       Icons.star,
//                                                       color: Colors.amber[800],
//                                                     ),
//                                                     Icon(
//                                                       Icons.star,
//                                                       color: Colors.amber[800],
//                                                     ),
//                                                     Icon(
//                                                       Icons.star,
//                                                       color: Colors.amber[800],
//                                                     ),
//                                                     Icon(
//                                                       Icons.star_border_sharp,
//                                                       color: Colors.amber[800],
//                                                     ),
//                                                     Icon(
//                                                       Icons.star_border_sharp,
//                                                       color: Colors.amber[800],
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             )))),
//                               );
//                               return Center(
//                                 child: Text(
//                                   'Item $ind',
//                                   // style: Theme.of(context).textTheme.headline5,
//                                 ),
//                               );
//                             }),
//                           )
//                         : Center(
//                             child: Text(
//                               "No Farmer Listed ",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'Poppins',
//                                   fontSize: 20),
//                             ),
//                           )),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: _selectedScreenIndex,
//             onTap: _selectScreen,
//             items: const [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.home), label: 'Dashboard'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.list), label: "Farmer List"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.account_circle), label: "Profile"),
//               // BottomNavigationBarItem(icon: Icon(Icons.library_add), label: "List"),
//             ],
//           ),
//         ));
//   }
// }

// // import 'package:allcanfarmapp/dashboard.dart';
// // import 'package:allcanfarmapp/mainprofile.dart';
// // import 'package:allcanfarmapp/menu.dart';
// // import 'package:allcanfarmapp/packages.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:allcanfarmapp/profile.dart';
// // import 'package:allcanfarmapp/userprofile.dart';

// // class FarmerList extends StatefulWidget {
// //   final String login_token;
// //   FarmerList(this.login_token);
// //   @override

// //   // _OTPScreenState createState() => _OTPScreenState();
// //   _FarmerListState createState() => _FarmerListState();
// // }

// // class _FarmerListState extends State<FarmerList> {
// //   int _selectedScreenIndex = 1;
// //   late List _screens;

// //   @override
// //   initState() {
// //     _screens = [
// //       {"screen": MyDashboard(widget.login_token), "title": "DashBoard"},
// //       {"screen": Packages(widget.login_token), "title": "Packages"},
// //       {"screen": MyProfile(widget.login_token), "title": "Profile"},
// //       // {"screen": FarmerList(), "title": "List"}
// //     ];
// //   }

// //   void _selectScreen(int index) {
// //     setState(() {
// //       _selectedScreenIndex = index;
// //     });
// //     Navigator.of(context).push(MaterialPageRoute(
// //         builder: (context) => _screens[_selectedScreenIndex]["screen"]));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             image: AssetImage("assets/images/background.jpeg"),
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //         // )
// //         child: Scaffold(
// //           // backgroundColor: Colors.green[300],
// //           appBar: AppBar(
// //             title: Text("Farmer List",
// //                 style: TextStyle(
// //                     // color: Colors.black,
// //                     fontFamily: 'Poppins')),
// //             backgroundColor: Colors.green[300],
// //           ),
// //           backgroundColor: Colors.transparent,
// //           body: Container(
// //             // color: Colors.amber,
// //             padding: EdgeInsets.only(top: 20),
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   Container(
// //                     margin: EdgeInsets.only(left: 20, right: 20),
// //                     child: Column(
// //                       children: [
// //                         Row(
// //                           children: [
// //                             Flexible(
// //                               flex: 1,
// //                               child: TextField(
// //                                 // cursorHeight: 10,
// //                                 cursorColor: Colors.grey,
// //                                 decoration: InputDecoration(
// //                                     fillColor: Colors.white,
// //                                     filled: true,
// //                                     contentPadding: EdgeInsets.symmetric(
// //                                         vertical: 10.0, horizontal: 20.0),
// //                                     border: OutlineInputBorder(
// //                                         borderRadius: BorderRadius.circular(40),
// //                                         borderSide: BorderSide(
// //                                             color: Color.fromARGB(
// //                                                 255, 193, 63, 40))),
// //                                     hintText: 'Search',
// //                                     hintStyle: TextStyle(
// //                                         color: Colors.grey,
// //                                         fontFamily: 'Poppins',
// //                                         fontSize: 18),
// //                                     suffixIcon: Container(
// //                                       padding: EdgeInsets.all(15),
// //                                       child: Image.asset(
// //                                           'assets/images/search.png'),
// //                                       width: 18,
// //                                     )),
// //                               ),
// //                             )
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Row(
// //                     //  crossAxisAlignment: CrossAxisAlignment.start,
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Card(
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(5),
// //                               side: BorderSide(
// //                                   color: Color.fromARGB(255, 193, 63, 40),
// //                                   width: 1.5)),
// //                           elevation: 4,
// //                           color: Colors.white,
// //                           shadowColor: Colors.grey,
// //                           child: Padding(
// //                               padding: EdgeInsets.all(4),
// //                               child: Row(
// //                                 children: [
// //                                   Image.asset(
// //                                     'assets/images/profile.jpg',
// //                                     height: 50,
// //                                   ),
// //                                   Text(
// //                                     " Anurag Sisodia",
// //                                     style: TextStyle(fontFamily: 'Poppins'),
// //                                   ),
// //                                 ],
// //                               ))),
// //                       SizedBox(
// //                         width: 10.0,
// //                       ),
// //                       Card(
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(5),
// //                               side: BorderSide(
// //                                   color: Color.fromARGB(255, 193, 63, 40),
// //                                   width: 1.5)),
// //                           elevation: 4,
// //                           color: Colors.white,
// //                           shadowColor: Colors.grey,
// //                           child: Padding(
// //                               padding: EdgeInsets.all(4),
// //                               child: Row(
// //                                 children: [
// //                                   Image.asset(
// //                                     'assets/images/profile.jpg',
// //                                     height: 50,
// //                                   ),
// //                                   Text(" sachin Kumar",
// //                                       style: TextStyle(fontFamily: 'Poppins')),
// //                                 ],
// //                               )))
// //                     ],
// //                   ),
// //                   // ratings
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       InkWell(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                   builder: (context) => ProfileUI2()),
// //                             );
// //                           },
// //                           child: Card(
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(5),
// //                                   side: BorderSide(
// //                                       color: Color.fromARGB(255, 193, 63, 40),
// //                                       width: 1.5)),
// //                               elevation: 4,
// //                               color: Colors.white,
// //                               shadowColor: Colors.grey,
// //                               child: Padding(
// //                                   padding: EdgeInsets.all(4),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Image.asset(
// //                                         'assets/images/profile.jpg',
// //                                         height: 120,
// //                                       ),
// //                                       // Text(
// //                                       //   " Ankush",
// //                                       //   style: TextStyle(fontWeight: FontWeight.bold),
// //                                       // ),
// //                                       Text(
// //                                         "Ankush",
// //                                         style: TextStyle(
// //                                             fontSize: 15,
// //                                             fontFamily: 'Poppins'),
// //                                       ),
// //                                       Row(
// //                                         children: [
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                         ],
// //                                       )
// //                                     ],
// //                                   )))),
// //                       SizedBox(
// //                         width: 10.0,
// //                       ),
// //                       InkWell(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                   builder: (context) => ProfileUI2()),
// //                             );
// //                           },
// //                           child: Card(
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(5),
// //                                   side: BorderSide(
// //                                       color: Color.fromARGB(255, 193, 63, 40),
// //                                       width: 1.5)),
// //                               elevation: 4,
// //                               color: Colors.white,
// //                               shadowColor: Colors.grey,
// //                               child: Padding(
// //                                   padding: EdgeInsets.all(4),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Image.asset(
// //                                         'assets/images/profile.jpg',
// //                                         height: 120,
// //                                       ),
// //                                       Text(
// //                                         "Kunal",
// //                                         style: TextStyle(
// //                                             fontSize: 15,
// //                                             fontFamily: 'Poppins'),
// //                                         textAlign: TextAlign.left,
// //                                       ),
// //                                       Row(
// //                                         children: [
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                         ],
// //                                       )
// //                                     ],
// //                                   ))))
// //                     ],
// //                   ),
// //                   // rating
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       InkWell(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                   builder: (context) => ProfileUI2()),
// //                             );
// //                           },
// //                           child: Card(
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(5),
// //                                   side: BorderSide(
// //                                       color: Color.fromARGB(255, 193, 63, 40),
// //                                       width: 1.5)),
// //                               elevation: 4,
// //                               color: Colors.white,
// //                               shadowColor: Colors.grey,
// //                               child: Padding(
// //                                   padding: EdgeInsets.all(4),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Image.asset(
// //                                         'assets/images/profile.jpg',
// //                                         height: 120,
// //                                       ),
// //                                       Text(
// //                                         "Subham",
// //                                         style: TextStyle(
// //                                           fontFamily: 'Poppins',
// //                                           fontSize: 15,
// //                                         ),
// //                                       ),
// //                                       Row(
// //                                         children: [
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                         ],
// //                                       )
// //                                     ],
// //                                   )))),
// //                       SizedBox(
// //                         width: 10.0,
// //                       ),
// //                       InkWell(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                   builder: (context) => ProfileUI2()),
// //                             );
// //                           },
// //                           child: Card(
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(5),
// //                                   side: BorderSide(
// //                                       color: Color.fromARGB(255, 193, 63, 40),
// //                                       width: 1.5)),
// //                               elevation: 4,
// //                               color: Colors.white,
// //                               shadowColor: Colors.grey,
// //                               child: Padding(
// //                                   padding: EdgeInsets.all(4),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Image.asset(
// //                                         'assets/images/profile.jpg',
// //                                         height: 120,
// //                                       ),
// //                                       Text(
// //                                         "Ankit",
// //                                         style: TextStyle(
// //                                           fontFamily: 'Poppins',
// //                                           fontSize: 15,
// //                                         ),
// //                                         textAlign: TextAlign.left,
// //                                       ),
// //                                       Row(
// //                                         children: [
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                         ],
// //                                       )
// //                                     ],
// //                                   ))))
// //                     ],
// //                   ),
// //                   // end  rating
// //                   // rating
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       InkWell(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                   builder: (context) => ProfileUI2()),
// //                             );
// //                           },
// //                           child: Card(
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(5),
// //                                   side: BorderSide(
// //                                       color: Color.fromARGB(255, 193, 63, 40),
// //                                       width: 1.5)),
// //                               elevation: 4,
// //                               color: Colors.white,
// //                               shadowColor: Colors.grey,
// //                               child: Padding(
// //                                   padding: EdgeInsets.all(4),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Image.asset(
// //                                         'assets/images/profile.jpg',
// //                                         height: 120,
// //                                       ),
// //                                       Text(
// //                                         "Rajesh",
// //                                         style: TextStyle(
// //                                             fontFamily: 'Poppins',
// //                                             fontWeight: FontWeight.bold),
// //                                       ),
// //                                       Row(
// //                                         children: [
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                         ],
// //                                       )
// //                                     ],
// //                                   )))),
// //                       SizedBox(
// //                         width: 10.0,
// //                       ),
// //                       InkWell(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                   builder: (context) => ProfileUI2()),
// //                             );
// //                           },
// //                           child: Card(
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(5),
// //                                   side: BorderSide(
// //                                       color: Color.fromARGB(255, 193, 63, 40),
// //                                       width: 1.5)),
// //                               elevation: 4,
// //                               color: Colors.white,
// //                               shadowColor: Colors.grey,
// //                               child: Padding(
// //                                   padding: EdgeInsets.all(4),
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Image.asset(
// //                                         'assets/images/profile.jpg',
// //                                         height: 120,
// //                                       ),
// //                                       Text(
// //                                         "Karan",
// //                                         style: TextStyle(
// //                                             fontFamily: 'Poppins',
// //                                             fontWeight: FontWeight.bold),
// //                                       ),
// //                                       Row(
// //                                         children: [
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                           Icon(
// //                                             Icons.star_border_sharp,
// //                                             color: Colors.amber[800],
// //                                           ),
// //                                         ],
// //                                       )
// //                                     ],
// //                                   ))))
// //                     ],
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //           bottomNavigationBar: BottomNavigationBar(
// //             currentIndex: _selectedScreenIndex,
// //             onTap: _selectScreen,
// //             items: const [
// //               BottomNavigationBarItem(
// //                   icon: Icon(Icons.home), label: 'Dashboard'),
// //               BottomNavigationBarItem(
// //                   icon: Icon(Icons.list), label: "Farmer List"),
// //               BottomNavigationBarItem(
// //                   icon: Icon(Icons.account_circle), label: "Profile"),
// //               // BottomNavigationBarItem(icon: Icon(Icons.library_add), label: "List"),
// //             ],
// //           ),
// //         ));
// //   }
// // }

import 'package:allcanfarmapp/dashboard.dart';
import 'package:allcanfarmapp/mainprofile.dart';
import 'package:allcanfarmapp/menu.dart';
import 'package:allcanfarmapp/packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:allcanfarmapp/profile.dart';
import 'package:allcanfarmapp/userprofile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../FarmerData.dart';

class FarmerList extends StatefulWidget {
  final String login_token;
  final String group;
  FarmerList(this.login_token, this.group);
  @override

  // _OTPScreenState createState() => _OTPScreenState();
  _FarmerListState createState() => _FarmerListState();
}

class _FarmerListState extends State<FarmerList> {
  var images = [
    "https://www.melivecode.com/users/1.png",
    "https://www.melivecode.com/users/8.png",
    "https://www.melivecode.com/users/1.png",
    "https://www.melivecode.com/users/2.png",
    "https://www.melivecode.com/users/5.png"
  ];
  int _selectedScreenIndex = 1;
  List<dynamic> farmerData = [];
  late List _screens;
  void farmerList(
    String login_token,
  ) async {
    final response = await http.get(
      Uri.parse('http://18.138.159.120/api/get-farmers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
    );
    if (response.statusCode == 200) {
      var jcode = jsonDecode(response.body);
      var resp = jcode["response"];
      var message = resp["message"];
      setState(() {
        farmerData = message;
      });
      //  print();
    }
  }

  @override
  initState() {
    _screens = [
      {
        "screen": MyDashboard(widget.login_token, widget.group),
        "title": "DashBoard"
      },
      {
        "screen": Packages(widget.login_token, widget.group),
        "title": "Packages"
      },
      {
        "screen": MyProfile(widget.login_token, widget.group),
        "title": "Profile"
      },
      // {"screen": FarmerList(), "title": "List"}
    ];
    farmerList(widget.login_token);
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => _screens[_selectedScreenIndex]["screen"]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        // )
        child: Scaffold(
          // backgroundColor: Colors.green[300],
          appBar: AppBar(
            title: Text("Farmer List",
                style: TextStyle(
                    // color: Colors.black,
                    fontFamily: 'Poppins')),
            backgroundColor: Colors.green[300],
          ),

          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextField(
                              // cursorHeight: 10,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 193, 63, 40))),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                  suffixIcon: Container(
                                    padding: EdgeInsets.all(15),
                                    child:
                                        Image.asset('assets/images/search.png'),
                                    width: 18,
                                  )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                                color: Color.fromARGB(255, 193, 63, 40),
                                width: 1.5)),
                        elevation: 4,
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Image.network(
                                  images[0],
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "sachin Kumar ",
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ],
                            ))),
                    SizedBox(
                      width: 10.0,
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                                color: Color.fromARGB(255, 193, 63, 40),
                                width: 1.5)),
                        elevation: 4,
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Image.network(
                                  images[0],
                                  height: 50,
                                ),
                                Text("sachin Kumar ",
                                    style: TextStyle(fontFamily: 'Poppins')),
                              ],
                            )))
                  ],
                ),
                farmerData.isNotEmpty
                    ? GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: List.generate(farmerData.length, (index) {
                          return Center(
                            child: InkWell(
                                onTap: () {
                                  var age = farmerData[index]['age'] == null
                                      ? "N/A"
                                      : farmerData[index]['age'];
                                  var gender =
                                      farmerData[index]['gender'] == "M"
                                          ? "Male"
                                          : "Female";
                                  var farmesData = farmerData[index]["farm"];
                                  var userinfo = FarmerData(
                                      "${farmerData[index]['name']}",
                                      "${farmerData[index]['contact_no']}",
                                      "${farmerData[index]['rating'].length}",
                                      "${age}",
                                      "${gender}",
                                      farmesData);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileUI2(
                                            userinfo,
                                            widget.login_token,
                                            widget.group)),
                                  );
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    elevation: 4,
                                    color: Colors.white,
                                    shadowColor: Colors.grey,
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Image.network(
                                                  images[index],
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.fill),
                                            ),
                                            Center(
                                              child: Text(
                                                "${farmerData[index]['name']}",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Mobile",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "${farmerData[index]['contact_no']}",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber[800],
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber[800],
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber[800],
                                                ),
                                                Icon(
                                                  Icons.star_border_sharp,
                                                  color: Colors.amber[800],
                                                ),
                                                Icon(
                                                  Icons.star_border_sharp,
                                                  color: Colors.amber[800],
                                                ),
                                              ],
                                            )
                                          ],
                                        )))),
                          );
                        }),
                      )
                    : Text("loading"),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedScreenIndex,
            onTap: _selectScreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "Farmer List"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Profile"),
              // BottomNavigationBarItem(icon: Icon(Icons.library_add), label: "List"),
            ],
          ),
        ));
  }
}
