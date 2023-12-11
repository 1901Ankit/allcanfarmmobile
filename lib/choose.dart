import 'package:allcanfarmapp/menu.dart';
import 'package:allcanfarmapp/register.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:allcanfarmapp/dashboard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future updateGroup(
  BuildContext context,
  int group,
  String login_token,
  String group_name,
) async {
  // http://10.0.2.2:8081
  final response = await http.post(
    Uri.parse('http://18.138.159.120/api/update-group_id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $login_token',
    },
    body: jsonEncode({
      'group_id': group,
    }),
  );

  if (response.statusCode == 200) {
    // print("dnfcdfmd $title");
    var res = jsonDecode(response.body);
    print(res);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => new MyDashboard(login_token, group_name)),
        (route) => false);
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

class ChoiceScreen extends StatefulWidget {
  final String login_token;
  ChoiceScreen(this.login_token);
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  String radioButtonItem = 'Farmer';

  // Group Value for Radio Button.
  int id = 3;
  String? occupation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('Choose your Profession'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.green[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/farmer_profile.jpg'),
                radius: 80.0,
              ),
              Radio(
                value: 3,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Farmer';
                    id = 3;
                  });
                },
              ),
              Text(
                'Farmer',
                style: new TextStyle(fontSize: 17.0),
              ),

              // RadioListTile(
              //   title: Text("Farmer"),
              //   value: "3",
              //   groupValue: occupation,
              //   onChanged: (value) {
              //     setState(() {
              //       occupation = value.toString();
              //     });
              //   },
              // ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/angel_profile.png'),
                radius: 80.0,
              ),
              Radio(
                value: 4,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Angel_Farmer';
                    id = 4;
                  });
                },
              ),
              Text(
                'Angel Farmer',
                style: new TextStyle(fontSize: 17.0),
              ),
              // RadioListTile(
              //   title: Text("Angel Farmer"),
              //   value: "4",
              //   groupValue: occupation,
              //   onChanged: (value) {
              //     setState(() {
              //       occupation = value.toString();
              //     });
              //   },
              // ),
              SizedBox(
                height: 30,
              ),
              Text(
                  'thanks for updating your profession as : ${radioButtonItem}'),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
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
                      primary: Color.fromARGB(255, 193, 63, 40), // background

                      // foreground
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Menu()),
                      // );
                      updateGroup(
                          context, id, widget.login_token, radioButtonItem);
                      print(occupation);
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontFamily: "Poppins"),
                    )),
              ),
              // RaisedButton(
              //   onPressed: () {
              //     Navigator.of(context)
              //         .push(MaterialPageRoute(builder: (context) => Menu()));
              //   },
              //   child: Text('Submit'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
