import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:allcanfarmapp/profile.dart';
import 'package:allcanfarmapp/userprofile.dart';

class ListedFarmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green.shade300,
        appBar: AppBar(
          title: Text("Listed Farmer in Packages"),
        ),
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "these are the farmer that are listed in this packages:",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'OoohBaby'),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.count(
              crossAxisCount: 2,
              children: [
                InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => ProfileUI2()),
                  //   );
                  // },
                  child: Container(
                    color: Colors.green,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.only(
                    //       topRight: Radius.circular(10.0),
                    //       bottomRight: Radius.circular(10.0)),
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Container(
                            width: 170.0,
                            height: 100.0,
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => Menu()),
                            //   );
                            // },
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                image: new ExactAssetImage(
                                    'assets/images/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text("Ravi Kumar",
                            style: TextStyle(color: Colors.white)),
                        Text("₹ 2,500r", style: TextStyle(color: Colors.white)),
                        // RatingBar.builder(
                        //   initialRating: 3,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        //   itemBuilder: (context, _) => Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Profile()),
                  //   );
                  // },
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Container(
                            width: 170.0,
                            height: 100.0,
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => Menu()),
                            //   );
                            // },
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                image: new ExactAssetImage(
                                    'assets/images/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text("Ravi Kumar",
                            style: TextStyle(color: Colors.white)),
                        Text("₹ 1,800", style: TextStyle(color: Colors.white)),
                        // RatingBar.builder(
                        //   initialRating: 3,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        //   itemBuilder: (context, _) => Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Profile()),
                  //   );
                  // },
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Container(
                            width: 170.0,
                            height: 100.0,
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => Menu()),
                            //   );
                            // },
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                image: new ExactAssetImage(
                                    'assets/images/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text("Ravi Kumar",
                            style: TextStyle(color: Colors.white)),
                        Text("₹ 1,300", style: TextStyle(color: Colors.white)),
                        // RatingBar.builder(
                        //   initialRating: 3,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        //   itemBuilder: (context, _) => Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Profile()),
                  //   );
                  // },
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Container(
                            width: 170.0,
                            height: 100.0,
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => Menu()),
                            //   );
                            // },
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                image: new ExactAssetImage(
                                    'assets/images/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text("Ravi Kumar",
                            style: TextStyle(color: Colors.white)),
                        Text("₹ 2,300", style: TextStyle(color: Colors.white)),
                        // RatingBar.builder(
                        //   initialRating: 3,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        //   itemBuilder: (context, _) => Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            )
          ],
        )));
  }
}
