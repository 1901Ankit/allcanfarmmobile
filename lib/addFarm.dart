import 'dart:convert';
import 'package:allcanfarmapp/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddFarm extends StatefulWidget {
  final String login_token;
  final String group;
  AddFarm(this.login_token, this.group);
  @override
  _AddFarmState createState() => _AddFarmState();
}

class _AddFarmState extends State<AddFarm> {
  final TextEditingController _cropController = TextEditingController();
  final TextEditingController _sowingController = TextEditingController();
  final TextEditingController _harvestingController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _treesController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _produceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String radioButtonItem = 'crop';
  bool radioButtonItem1 = false;

  // Group Value for Radio Button.
  int id = 1;
  int id1 = 1;
  void initState() {
    _harvestingController.text = "";
    _sowingController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Farm"),
        backgroundColor: Colors.green[300],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Please enter details for adding farms:",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text("Farm Type  :"),
                Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'crop';
                      id = 1;
                    });
                  },
                ),
                Text(
                  'Farm',
                  style: new TextStyle(fontSize: 17.0),
                ),
                Radio(
                  value: 2,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'tree';
                      id = 2;
                    });
                  },
                ),
                Text(
                  'Orchard',
                  style: new TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter your  Crop name',
                labelText: ' Crop Name',
              ),
              controller: _cropController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter Sowing Month',
                labelText: 'Sowing Month',
              ),
              readOnly: false,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate);
                  setState(() {
                    _sowingController.text = formattedDate;
                  });
                } else {}
              },
              controller: _sowingController,
            ),
            TextField(
              controller: _harvestingController,
              decoration: const InputDecoration(
                hintText: 'Enter Harvesting Month',
                labelText: 'Harvesting Month',
              ),
              readOnly: false,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate);
                  setState(() {
                    _harvestingController.text = formattedDate;
                  });
                } else {}
              },
            ),
            radioButtonItem == 'crop'
                ? TextField(
                    controller: _areaController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Total Area',
                      labelText: 'Area (in Square metre)',
                    ),
                  )
                : TextField(
                    controller: _treesController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Total Number of Trees',
                      labelText: 'Total Trees',
                    ),
                  ),
            TextField(
              controller: _produceController,
              decoration: const InputDecoration(
                hintText: 'Enter Total Expected Produce',
                labelText: 'Expected Produces',
              ),
            ),
            TextField(
              controller: _costController,
              decoration: const InputDecoration(
                hintText: 'Enter Cost Per Kg',
                labelText: 'Cost Per Kg',
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                // icon: const Icon(Icons.calendar_today),
                hintText: 'Enter Address',
                labelText: 'Address',
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Stay  :"),
                Radio(
                  value: 2,
                  groupValue: id1,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem1 = true;
                      id1 = 2;
                    });
                  },
                ),
                Text(
                  'Yes',
                  style: new TextStyle(fontSize: 17.0),
                ),
                Radio(
                  value: 1,
                  groupValue: id1,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem1 = false;
                      id1 = 1;
                    });
                  },
                ),
                Text(
                  'No',
                  style: new TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
            new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: new ElevatedButton(
                  onPressed: () {
                    AddFarmDetails(
                        context,
                        widget.login_token,
                        _cropController.text,
                        radioButtonItem,
                        _treesController.text,
                        _sowingController.text,
                        _harvestingController.text,
                        _produceController.text,
                        _costController.text,
                        _addressController.text,
                        _areaController.text,
                        radioButtonItem1,
                        widget.group);
                  },
                  child: const Text('Add Farm'),
                  // icon: const Icon(Icons.plus_one),
                )),
          ],
        ),
      ),
    );
  }
}

Future AddFarmDetails(
  BuildContext context,
  String login_token,
  String crop,
  String croptype,
  String trees,
  String sowing,
  String harvesting,
  String produce,
  String cost,
  String address,
  String area,
  bool stay,
  String group_name,
) async {
  final response = await http.post(
    Uri.parse('http://18.138.159.120/api/add-farm'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $login_token',
    },
    body: jsonEncode({
      "crop": crop,
      "tree": trees,
      "produce": produce,
      "cost": cost,
      "share": "20",
      "address": address,
      "type": croptype,
      "stay": stay,
      "sowing_month": sowing,
      "harvest_month": harvesting,
      "farm_area": area,
    }),
  );

  if (response.statusCode == 200) {
    var res = jsonDecode(response.body);
    print(res);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MyDashboard(login_token, group_name)),
        // : Menu()),
        (route) => false);
  } else {
    throw Exception('Failed to create album.');
  }
}
