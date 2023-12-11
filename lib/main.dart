// import 'package:flutter/material.dart';
import 'package:allcanfarmapp/login.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // static const String _title = 'Sample App';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: _title,
//       home: Scaffold(
//         // appBar: AppBar(title: const Text(_title)),
//         body: const MyStatefulWidget(),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   TextEditingController nameController = TextEditingController();
//   // TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: <Widget>[
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'All Can Farm',
//                   style: TextStyle(fontSize: 40),
//                 )),
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'Sign in',
//                   style: TextStyle(fontSize: 20),
//                 )),
//             Container(
//                 padding: const EdgeInsets.all(10),
//                 child:
//                     //  TextField(
//                     //   controller: nameController,
//                     //   decoration: const InputDecoration(
//                     //     // border: OutlineInputBorder(),
//                     //     border: OutlineInputBorder(),
//                     //     labelText: 'Phone Number',
//                     //   ),
//                     // ),
//                     TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       filled: true,
//                       hintStyle: TextStyle(color: Colors.grey[800]),
//                       hintText: " Phone number",
//                       fillColor: Colors.white70),
//                 )),
//             Container(
//                 height: 50,
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ))),
//                   child: const Text('Send OTP'),
//                   onPressed: () {
//                     print(nameController.text);
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) =>
//                             LoginScreen(nameController.text)));
//                   },
//                 )),
//           ],
//         ));
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:allcanfarmapp/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ));
  }
}
