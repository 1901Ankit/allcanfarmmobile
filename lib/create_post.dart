import 'dart:io';

import 'package:allcanfarmapp/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class CreatePost extends StatefulWidget {
  final String login_token;
  final String group;
  CreatePost(this.login_token, this.group);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

Future createPost(BuildContext context, String token, String heading,
    String title, File image, String group) async {
  Map<String, String> headers = {'Authorization': 'Bearer $token'};

  var req = http.MultipartRequest(
      'POST', Uri.parse('http://18.138.159.120/api/add-post'));
  req.fields['title'] = heading.toString();
  req.fields['details'] = title.toString();
  req.headers.addAll(headers);
  req.files.add(http.MultipartFile.fromBytes(
      'post', File(image.path).readAsBytesSync(),
      filename: image.path));
  var respo = await req.send();
  if (respo.statusCode == 200) {
    print(respo);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => new MyDashboard(token, group)),
        (route) => false);
  } else {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => new MyDashboard(token, group)),
        (route) => false);
    throw Exception('Failed to create album.');
  }
}

class _CreatePostState extends State<CreatePost> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      print(image);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final TextEditingController _title = TextEditingController(text: "");
  final TextEditingController _dummy = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Post",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          backgroundColor: Colors.green[400],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 40),
          child: Column(
            children: [
              TextField(
                controller: _title,
                decoration: InputDecoration(
                  labelText: 'Title',
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //Description
              TextField(
                controller: _dummy,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(5, 12, 5, 0),
                  hintText: "Description",
                ),
                minLines: 1,
                maxLines: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          pickImageC();
                        },
                        color: Color.fromARGB(255, 193, 63, 40),
                        iconSize: 50,
                        icon: Icon(Icons.camera_alt),
                      ),
                      IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        color: Color.fromARGB(255, 193, 63, 40),
                        iconSize: 50,
                        icon: Icon(Icons.photo_camera_back_outlined),
                      )
                    ],
                  )
                ],
              ),
              image != null ? Image.file(image!) : Text("No image selected"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    createPost(context, widget.login_token, _dummy.text,
                        _title.text, image!, widget.group);
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 193, 63, 40), // background
                    // foreground
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
