import 'package:allcanfarmapp/Farm.dart';
import 'package:allcanfarmapp/FarmerList.dart';
import 'package:allcanfarmapp/addFarm.dart';
import 'package:allcanfarmapp/mainprofile.dart';
import 'package:allcanfarmapp/packages.dart';
import 'package:allcanfarmapp/userprofile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:allcanfarmapp/create_post.dart';
import 'package:allcanfarmapp/menu.dart';
import 'package:allcanfarmapp/menu.dart';
import 'package:allcanfarmapp/profile.dart';
import 'package:allcanfarmapp/register.dart';
import 'package:allcanfarmapp/settings.dart';
import 'package:allcanfarmapp/about.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

// import 'package:testapp/screen/HomeScreen.dart';

class MyDashboard extends StatefulWidget {
  final String login_token;
  final String group;
  MyDashboard(this.login_token, this.group);

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  List<dynamic> object = [];
  bool _isloading = true;
  late List<dynamic> Postobject;
  Future getDashBoard(
    BuildContext context,
    String login_token,
  ) async {
    // _isloading = false;
    final response = await http.get(
      Uri.parse('http://18.138.159.120/api/dashboard-farmer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
    );
    print(login_token);

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      var resp = res["response"];
      var message = resp["message"];
      print(res);
      setState(() {
        _isloading = false;
        object = [message];
        print(object[0]);
      });
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future getPosts(
    BuildContext context,
    String login_token,
  ) async {
    final response = await http.get(
      Uri.parse('http://18.138.159.120/api/get-post'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
    );

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var res = jsonDecode(response.body);
      var resp = res["response"];
      var message = resp["message"];
      setState(() {
        Postobject = message;
        print(Postobject);
      });
    } else {
      throw Exception('Failed to create album.');
    }
  }

  TextEditingController nameController = TextEditingController();
  late List _screens;

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

    getDashBoard(context, widget.login_token);
    getPosts(context, widget.login_token);
  }
  // Future

  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => _screens[_selectedScreenIndex]["screen"]),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("DashBoard",
                style: TextStyle(
                    // color: Colors.black,
                    fontFamily: 'Poppins')),
            actions: <Widget>[
              // FaIcon(FontAwesomeIcons.bell),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.solidBell),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('hello,This is a snackbar')));
                },
              ),
            ],
            backgroundColor: Colors.green[300],
          ),
          backgroundColor: Colors.transparent,
          body: object.isNotEmpty
              // || Postobject.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        children: [
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
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 193, 63, 40))),
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                      suffixIcon: Container(
                                        padding: EdgeInsets.all(15),
                                        child: Image.asset(
                                            'assets/images/search.png'),
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
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  // side: BorderSide(
                                  //   color: Colors.black,
                                  //width:2 //<-- SEE HERE
                                  // ),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                primary: Colors.white,
                                // Color.fromARGB(255, 193, 63, 40), // background

                                // foreground
                              ),
                              onPressed: () {
                                print(widget.login_token);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddFarm(
                                          widget.login_token, widget.group)),
                                );
                              },
                              child: Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // FaIcon(FontAwesomeIcons.magnifyingGlassLocation),
                                  Image.asset(
                                    "assets/images/darklogo.png",
                                    scale: 4,
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Add Farm",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black),
                                  ),
                                ],
                              ))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 100,
                          // width: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 193, 63, 41),
                                        width: 1.5),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  primary: Color.fromARGB(255, 193, 63, 41)),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Farm()),
                                // );
                              },
                              child: Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // FaIcon(
                                  //   FontAwesomeIcons.fileImport,
                                  //   color: Colors.black,
                                  // ),
                                  Image.asset(
                                    "assets/images/lightlogo.png",
                                    scale: 4,
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "View Farm",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black),
                                  ),
                                ],
                              ))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 193, 63, 41),
                                      width: 1.5 //<-- SEE HERE
                                      ),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyProfile(
                                          widget.login_token, widget.group)),
                                );
                              },
                              child: Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/Asset3.png",
                                    scale: 15,
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black),
                                  ),
                                ],
                              ))),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 193, 63, 40),
                              width: 2),
                          borderRadius: BorderRadius.circular(10.0)),
                      margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                      child: !_isloading
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 30, right: 10, left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        object[0]["total_trees"] == null
                                            ? "Total Trees Planted : 0 trees"
                                            : "Total Trees Planted :${object[0]["total_trees"]}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins'),
                                      ),
                                      Text(
                                        "No Of Produce : ${object[0]["total_produce"]}",
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        object[0]["total_area"] == null
                                            ? "Size of farm : 0 square metre"
                                            : "Size Of Farm :${object[0]["total_area"]} Square metre",
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        object[0]["adopted_area"] == null
                                            ? "Farm Adopted : 0 square metre"
                                            : "Farm Adopted:  ${object[0]["adopted_area"]} square metre",
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        object[0]["total_farm"] == null
                                            ? "Total Number Of Farm : 0 square metre"
                                            : "Total Number Of Farm : ${object[0]["total_farm"]}",
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 55,
                                        lineWidth: 14,
                                        animation: true,
                                        animationDuration: 1500,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        percent: object[0]["carbon_credit"] ==
                                                null
                                            ? 0
                                            : object[0]["carbon_credit"] / 100,
                                        progressColor: Colors.green[400],
                                        center: Text(
                                          "CARBON CREDITS",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Stories",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20)),
                    Container(
                      child: Postobject.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: Postobject.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 193, 63, 40),
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  margin: EdgeInsets.only(
                                    top: 20,
                                    right: 10,
                                    left: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/images/profile.jpg'),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      " ${Postobject[index]["posted_by"]}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.green[600],
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'Poppins'),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          " 15hrs",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .watch_later_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Follow",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Colors
                                                                .green[600],
                                                            fontFamily:
                                                                'Poppins'),
                                                      ),
                                                      Icon(
                                                        Icons.bookmark,
                                                        color: Colors.grey[700],
                                                      ),
                                                      Icon(
                                                        Icons.more_horiz,
                                                        color: Colors.grey[700],
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "${Postobject[index]["title"]}",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Poppins-Light'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Image.network(
                                                "${Postobject[index]["url"]}")
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              "15 Like",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 90,
                                            ),
                                            Text(
                                              "61 Comments",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        thickness: 1,
                                        endIndent: 0,
                                        color: Colors.grey[200],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .thumb_up_off_alt_outlined),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Like",
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins-Light',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.comment),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Comments",
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins-Light',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                FaIcon(FontAwesomeIcons.share),
                                                // Icon(Icons.share),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Share",
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins-Light',
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            )
                          : Center(
                              child: Text(
                              "No Stories ",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Poppins'),
                            )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                  // )
                ))
              : Center(
                  child: CircularProgressIndicator(),
                ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 193, 63, 40),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        new CreatePost(widget.login_token, widget.group)),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedScreenIndex,
            onTap: _selectScreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "Packages"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
