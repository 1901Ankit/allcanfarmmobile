import 'package:allcanfarmapp/FarmerData.dart';
import 'package:allcanfarmapp/dashboard.dart';
import 'package:allcanfarmapp/packages.dart';
import 'package:allcanfarmapp/profile.dart';
import 'package:allcanfarmapp/register.dart';
import 'package:allcanfarmapp/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class MyProfile extends StatefulWidget {
  final String login_token;
  final String group;
  MyProfile(this.login_token, this.group);
  // const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

Future logout(BuildContext context, String number) async {
  String num = number.replaceAll('+91', '');
  print(num);
  final response = await http.post(
    Uri.parse('http://18.138.159.120/api/logout'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $login_token',
    },
    body: jsonEncode({
      'contact_no': num,
      // 'group_id': group,
    }),
  );

  if (response.statusCode == 200) {
    // print("dnfcdfmd $title");
    var res = jsonDecode(response.body);
    print(res);
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => group_name == "Farmer"
    //             ? new MyDashboard(login_token)
    //             : Menu(login_token)),
    //     (route) => false);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => C);
    // return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    // throw Error();
    throw Exception('Failed to create album.');
  }
}

class _MyProfileState extends State<MyProfile> {
  int _selectedScreenIndex = 2;
  late List _screens;
  var number = FirebaseAuth.instance.currentUser!.phoneNumber;
  List<dynamic> object = [];

  Future getDetails(
    BuildContext context,
    String login_token,
  ) async {
    // _isloading = false;
    final response = await http.get(
      Uri.parse('http://18.138.159.120/api/get-details'),
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
        // _isloading = false;
        object = [message];
        print(object[0]);
      });
    } else {
      throw Exception('Failed to create album.');
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
    getDetails(context, widget.login_token);
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => _screens[_selectedScreenIndex]["screen"]),
        (route) => false);
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => _screens[_selectedScreenIndex]["screen"]));
  }

  String status = "Off";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          //   child:
          Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Profile",
              style: TextStyle(
                  // color: Colors.black,
                  fontFamily: 'Poppins')),
          actions: <Widget>[
            // FaIcon(FontAwesomeIcons.bell),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.solidBell),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('hello,This is a snackbar')));
              },
            ),
          ],
          backgroundColor: Colors.green[300],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                    radius: 40,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "${object[0]["name"]}",
                  style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                ),
                SizedBox(
                  width: 150.0,
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.edit),
                  label: Text("Edit"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Profile(widget.login_token, widget.group)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Divider(
              height: 20,
              thickness: 10,
              endIndent: 0,
              color: Colors.grey[200],
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notifications_active_outlined),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text("Notifications")
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: TextButton(
                        onPressed: () {
                          setState(() {
                            status == "ON" ? status = "Off" : status = "ON";
                          });
                        },
                        child: Text(status),
                      ))
                    ],
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      var farmdata = object[0]["farm"];
                      var userinfo = FarmerData(
                          "${object[0]['name']}",
                          "${object[0]['contact_no']}",
                          "1",
                          "${object[0]["age"]}",
                          "${object[0]["gender"]}",
                          farmdata);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileUI2(
                                userinfo, widget.login_token, widget.group)),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text("My Profile")
                      ],
                    ),
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.share),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text("Share on Social")
                    ],
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text("Rate US")
                    ],
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      print(FirebaseAuth.instance.currentUser!.phoneNumber);
                      // await FirebaseAuth.instance.signOut();
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => HomeScreen()),
                      //     (route) => false);
                      logout(context, number.toString());
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout_outlined),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text("Logout")
                      ],
                    ),
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Terms & Condition",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "About App",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreenIndex,
          onTap: _selectScreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Packages"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"),
            // BottomNavigationBarItem(icon: Icon(Icons.library_add), label: "List"),
          ],
        ),
      ),
    );
  }
}
