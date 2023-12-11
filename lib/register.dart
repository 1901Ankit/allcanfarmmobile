import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:allcanfarmapp/dashboard.dart';
import 'package:allcanfarmapp/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future addUser(BuildContext context, String title) async {
  final response = await http.post(
    Uri.parse('http://18.138.159.120/api/add-user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'contact_no': title,
    }),
  );

  if (response.statusCode == 200) {
    // print("dnfcdfmd $title");

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen(title)));
    // return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

// class Album {
//   final int id;
//   final String title;

//   const Album({required this.id, required this.title});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       id: json['id'],
//       title: json['contact_no'],
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  // final String phone;
  // LoginScreen(this.phone);
  @override
  // _OTPScreenState createState() => _OTPScreenState();
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  // Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/allback.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // appBar: AppBar(
        //   title: Text('Phone Auth'),
        // ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                // mainAxisSize: Mai,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                      // margin: EdgeInsets.only(
                      //   top: 280,
                      // ),
                      elevation: 20,
                      // shadowColor: Colors.accents,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          // The child of a round Card should be in round shape
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300.0),
                          child: Container(
                            child: Image.asset("assets/images/acflogo.png"),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Center(
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 160),
                    child: Center(
                      child: Text(
                        'Welcome to All Can Farm App',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.tablet_android_sharp),
                        suffixIcon: Icon(Icons.keyboard_double_arrow_right),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _controller,
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                        child: const Text('Send OTP'),
                        // onPressed: () {
                        //   print(_controller.text);
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) =>
                        //           LoginScreen(_controller.text)));
                        // },
                        onPressed: () {
                          setState(() {
                            addUser(context, _controller.text);
                          });
                        },
                      )),
                ]),

            // )
            // ],
          ),
        ),
      ),
    );
  }
}
