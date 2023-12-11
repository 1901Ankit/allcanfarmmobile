// import 'package:allcanfarmapp/menu.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ThankYou extends StatefulWidget {
//   const ThankYou({Key? key}) : super(key: key);

//   @override
//   State<ThankYou> createState() => _ThankYouState();
// }

// class _ThankYouState extends State<ThankYou> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: IconButton(
//                 color: Colors.green,
//                 onPressed: () {},
//                 iconSize: 50,
//                 icon: Icon(Icons.check_circle_outline)),
//           ),
//           Center(
//             child: Text(
//               "Thank you",
//               style: TextStyle(fontSize: 25),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Menu()),
//                 );
//               },
//               child: Text("Back to Home"))
//           // Center(
//           //     child: Text(
//           //   "Thank you for getting in the green initiative for betterment of the world",
//           //   style: TextStyle(fontSize: 18),
//           // ))
//         ],
//       ),
//     ));
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:allcanfarmapp/mainprofile.dart';
import 'package:allcanfarmapp/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import 'home_button.dart';

class ThankYou extends StatefulWidget {
  // const ThankYou({Key? key, required this.title}) : super(key: key);

  final String title;
  final String group;
  ThankYou(this.title, this.group);

  @override
  State<ThankYou> createState() => _ThankYouState();
}

Color themeColor = const Color(0xFF43D19E);

class _ThankYouState extends State<ThankYou> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 170,
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: themeColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.wallet_giftcard_outlined,
                  size: 40,
                )
                // child: Image.asset(
                //   "assets/images/farmer.jpg",
                //   fit: BoxFit.contain,
                // ),
                ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Payment done Successfully",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "You will be redirected to the home page shortly\nor click here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Flexible(
              child: ElevatedButton(
                child: Text("Home"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyProfile(widget.title, widget.group)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
