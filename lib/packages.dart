import 'package:allcanfarmapp/dashboard.dart';
import 'package:allcanfarmapp/mainprofile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:allcanfarmapp/FarmerList.dart';
import 'package:allcanfarmapp/listed_farmer.dart';
import 'package:allcanfarmapp/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Packages extends StatefulWidget {
  final String login_token;
  final String group;
  Packages(this.login_token, this.group);
  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  int _selectedScreenIndex = 1;
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

  @override
  final myProducts = List<String>.generate(3, (i) => 'Package $i');

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Packages",
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 193, 63, 40), width: 2),
                    borderRadius: BorderRadius.circular(12.5),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                "Direct from farm",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins-Bold',
                                    fontSize: 25),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " connect with traditional farmer for produces",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " stay in the farm",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " access to fresh produces from farm",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " can collaborate with farmer for specific ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 10),
                          child: Row(
                            children: [
                              Text(
                                " type of crop/farmer ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " can collaborate with farmer for specific type",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 10),
                          child: Row(
                            children: [
                              Text(
                                "  of crop/farmer",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 50,
                            width: 365, // specific value

                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FarmerList(
                                        widget.login_token, widget.group)));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  // side: BorderSide(
                                  //   color: Colors.black, //<-- SEE HERE
                                  // ),
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                                primary: Color.fromARGB(
                                    255, 193, 63, 40), // background

                                // foreground
                              ),
                              child: Text(
                                "View Package",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Poppins'),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Color.fromARGB(255, 193, 63, 40), width: 2),

                    //set border radius more than 50% of height and width to make circle
                  ),
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                "Carbon Neutrals",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins-Bold',
                                    fontSize: 25),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " collect carbon nuetrals by coowning ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 10),
                          child: Row(
                            children: [
                              Text(
                                "  the farm plantations",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " plan your carbon neutrals for years by ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 10),
                          child: Row(
                            children: [
                              Text(
                                "  sponsoring new plantation",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " contribute in creating green economy",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.check,
                                  color: Colors.green[600]),
                              Text(
                                " option to work from farm ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Container(
                        //   padding: EdgeInsets.only(left: 30, right: 10),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         " type of crop/farmer ",
                        //         style: TextStyle(
                        //           fontSize: 17,
                        //           fontWeight: FontWeight.w600,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(left: 10, right: 10),
                        //   child: Row(
                        //     children: [
                        //       FaIcon(FontAwesomeIcons.check,
                        //           color: Colors.green[600]),
                        //       Text(
                        //         " can collaborate with farmer for specific type",
                        //         style: TextStyle(
                        //           fontSize: 17,
                        //           fontWeight: FontWeight.w600,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                            height: 50,
                            width: 365, // specific value
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FarmerList(
                                        widget.login_token, widget.group)));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                                primary: Color.fromARGB(
                                    255, 193, 63, 40), // background

                                // foreground
                              ),
                              child: Text(
                                "View Package",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Poppins'),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )),
            ],
          ),
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
    ));
  }
}
