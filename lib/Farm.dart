import 'package:allcanfarmapp/order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:counter_button/counter_button.dart';

class Farm extends StatefulWidget {
  final List name;
  final String login_token;
  final String group;
  Farm(this.name, this.login_token, this.group);
  @override
  _FarmState createState() => _FarmState();
}

class _FarmState extends State<Farm> {
  bool _status = true;

  final FocusNode myFocusNode = FocusNode();
  TextEditingController _quantity = TextEditingController();

  @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: Text('Farm Details'),
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
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "${widget.name[0]["crop"]} Farm",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins-Bold',
                      fontWeight: FontWeight.w700),
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
                          "${widget.name[0]["type"] == "crop" ? "Total Area (55 Square metre)" : "Total Trees (5 trees)"}",
                          style: TextStyle(
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
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
                                "Sowing Date",
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
                                "${widget.name[0]["sowing_month"]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Harvesting Date",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${widget.name[0]["harvest_month"]}",
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
                                "${widget.name[0]["type"] == "crop" ? "Total Area" : "Total Trees"}",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${widget.name[0]["type"] == "crop" ? "${widget.name[0]["farm_area"]} Square metre" : "${widget.name[0]["tree"]} trees"}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${widget.name[0]["type"] == "crop" ? "Remaining Area" : "Remaining Trees"}",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${widget.name[0]["type"] == "crop" ? "${widget.name[0]["remaining_area"]} Square metre" : "${widget.name[0]["remaining_tree"]} trees"}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
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
                SizedBox(
                  height: 10,
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
                          "Stay(${widget.name[0]["stay"] == false ? "Not Available" : "Available"})",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w700),
                        ))),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 30,
                ),
                _status
                    ? Text(
                        "Crops",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900),
                      )
                    : Text(
                        "Adoption Details",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900),
                      ),
                SizedBox(
                  height: 25,
                ),
                !_status
                    ? Text(
                        "Adopted Item",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900),
                      )
                    : Text(''),
                _status
                    ? CarouselSlider(
                        items: [
                          //1st Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //2nd Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //3rd Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //4th Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //5th Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],

                        //Slider Container properties
                        options: CarouselOptions(
                          height: 180.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      )
                    : Container(
                        width: 300,
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/wheat.jpg'),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _status
                        ? ElevatedButton(
                            onPressed: () => {
                              setState(() {
                                _status = false;
                              })
                            },
                            child: Text(
                              "Adopt",
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  // side: BorderSide(
                                  //     color: Color.fromARGB(255, 193, 63, 40),
                                  //     width: 2 //<-- SEE HERE
                                  //     ),
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                primary: Color.fromARGB(255, 193, 63, 40),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            // background

                            // foreground
                            // ),
                          )
                        : Text(''),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                !_status ? _AdoptionDetails() : new Container(),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ));
  }

  Widget _AdoptionDetails() {
    // var remaining = widget.name[0]["produce_in_KG"] / int.parse(_quantity.text);
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter the Quantity for Adoption",
            style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _quantity,
              // maxLength: widget.name[0]["trees"],
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "[${widget.name[0]["type"] == "crop" ? "In square meter" : "trees"}]",
            style: TextStyle(
                fontSize: 20, fontFamily: 'Poppins', color: Colors.blue),
          ),
          SizedBox(
            height: 30,
          ),
          // Text(
          //   "( $remaining kg)",
          //   style: TextStyle(
          //       fontSize: 20, color: Colors.blue, fontFamily: 'Poppins'),
          // ),
          SizedBox(
            height: 30,
          ),
          Text(
            "(Max ${widget.name[0]["type"] == "crop" ? "${widget.name[0]["remaining_area"]} square metre" : "${widget.name[0]["remaining_tree"]} trees"})",
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontFamily: 'Poppins'),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 55,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _status = false;
                  });
                  var order = [
                    _quantity.text,
                    widget.name[0]["cost_in_INR"],
                    widget.name[0]["crop"],
                    widget.name[0]["produce_in_KG"],
                    widget.name[0]["type"],
                  ];
                  double produce = widget.name[0]["type"] == "crop"
                      ? widget.name[0]["produce_in_KG"] /
                          int.parse(widget.name[0]["farm_area"])
                      : widget.name[0]["produce_in_KG"] /
                          widget.name[0]["tree"];
                  print(produce);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderDetail(
                            widget.name[0]["farm_id"],
                            int.parse(_quantity.text),
                            widget.name[0]["cost_in_INR"],
                            widget.name[0]["crop"],
                            produce,
                            widget.name[0]["type"],
                            widget.login_token,
                            widget.group)),
                  );
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      // side: BorderSide(
                      //     color: Color.fromARGB(255, 193, 63, 40),
                      //     width: 2 //<-- SEE HERE
                      //     ),
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    primary: Color.fromARGB(255, 193, 63, 40),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          )
        ],
      ),
    );
  }
}
