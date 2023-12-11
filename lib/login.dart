import 'package:allcanfarmapp/choose.dart';
import 'package:allcanfarmapp/menu.dart';
import 'package:allcanfarmapp/register.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:allcanfarmapp/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class LoginScreen extends StatefulWidget {
  final String phone;
  LoginScreen(this.phone);
  @override
  // _OTPScreenState createState() => _OTPScreenState();
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  var login_token;
  final int time = 30;
  late AnimationController _controller;
  // late Timer timer;
  late int totalTimeInSeconds;

  bool _hideResendButton = false;
  bool isShowLoader = false;
  String? uid;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  Future verifyUID(BuildContext context, String number, String uid) async {
    print(uid);
    final response = await http.post(
      Uri.parse('http://18.138.159.120/api/verify-uid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'contact_no': number,
        'uid': uid,
      }),
    );

    if (response.statusCode == 200) {
      print(">>>>>>>>>>>>>>>>>>> $response");
      var data = jsonDecode(response.body);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(data);
      var rest = data["response"];
      var message1 = rest["message"];
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      print(rest);
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      login_token = message1["login_token"];
      var group = message1["group_name"];
      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      print(login_token);
      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      if (group == "Farmer" || group == "Angel_Farmer") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MyDashboard(login_token, group)),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ChoiceScreen(login_token)),
            (route) => false);
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      // appBar: AppBar(
      //   title: Text('OTP Verification'),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  elevation: 20,
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
                        child: Image.asset("assets/images/ic_message.png"),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "OTP VERIFICATION",
                    style: TextStyle(
                      // context: context,
                      color: Colors.black,
                      // fontSizeDelta: 2,
                      // fontWeightDelta: 3
                    ),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    " we have sent the otp on mobile number ${widget.phone}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // context: context,
                      color: Colors.black,
                      // fontWeightDelta: 2,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: SizedBox(
                  height: 34,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    // focusNode: mFocusNodeOTP,
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 6,
                    style: TextStyle(
                      // context: context,
                      color: Colors.amber,
                      // fontSizeDelta: 3,
                      // fontWeightDelta: -1
                    ),
                    controller: _pinPutController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 13, left: 3),
                      counterText: "",
                      focusedBorder: UnderlineInputBorder(),
                      border: UnderlineInputBorder(),
                      hintText: "ENTER OTP",
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                        color: Colors.black,
                        // fontSizeDelta: 3,
                        // fontWeightDelta: -1,
                        // context: context
                      ),
                    ),
                    // decoration: new InputDecoration.collapsed(
                    //   filled: true,
                    //   fillColor: AppColors.colorWhite,
                    //   hintStyle: AppStyle.textViewStyleNormalBodyText2(
                    //       color: AppColors.colorTextFildHint.withOpacity(0.6),
                    //       fontSizeDelta: 1,
                    //       fontWeightDelta: -1,
                    //       context: context),
                    //   hintText: hintText,
                    // ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Didn't Recieved OTP?",
                    style: TextStyle(
                      // context: context,
                      color: Colors.black,
                      fontSize: 12,
                      // fontWeightDelta: 1
                    ),
                  )),
              // Container(
              //   height: 30,
              //   alignment: Alignment.center,
              //   child: _hideResendButton
              //       ? InkWell(
              //           child: Text(
              //             "Resend OTP",
              //             style: TextStyle(
              //               // context: context,
              //               color: Colors.accents,
              //               // fontSizeDelta: 1,
              //               // fontWeightDelta: 0
              //             ),
              //           ),
              //           onTap: () {
              //             _verifyPhone();
              //           },
              //         )
              //       : OtpTimer(_controller, 15.0, Colors.amber),
              // ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode!,
                              smsCode: _pinPutController.text.toString()))
                          .then((value) async {
                        if (value.user != null) {
                          print("<<<<<<<<<<<<<<<<<<<<<<<<");
                          print(value.user!.uid);
                          String uids = value.user!.uid;
                          setState(() {
                            uid = value.user!.uid;
                          });
                          verifyUID(context, widget.phone, uids);
                        }
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Pinput(
              //     length: 6,
              //     defaultPinTheme: defaultPinTheme,
              //     controller: _pinPutController,
              //     pinAnimationType: PinAnimationType.fade,
              //     onSubmitted: (pin) async {
              //       try {
              //         await FirebaseAuth.instance
              //             .signInWithCredential(PhoneAuthProvider.credential(
              //                 verificationId: _verificationCode!, smsCode: pin))
              //             .then((value) async {
              //           if (value.user != null) {
              //             Navigator.pushAndRemoveUntil(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => ChoiceScreen()),
              //                 (route) => false);
              //             print("bdvshjahddkfsajkds");
              //             print(value);
              //             print(pin);
              //           }
              //         });
              //       } catch (e) {
              //         ScaffoldMessenger.of(context)
              //             .showSnackBar(SnackBar(content: Text(e.toString())));
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChoiceScreen(login_token)),
                  (route) => false);
              print("hello");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
