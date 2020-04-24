import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class Screen15 extends StatefulWidget {
  @override
  _Screen15State createState() => _Screen15State();
}

class _Screen15State extends State<Screen15> {
  // Keeps tracks of images file
  File _image;

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
  }

  Future<void> optionDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(99, 203, 218, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Align(
                      child: Text(
                    'Choose a picture',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(
                                Icons.camera,
                                size: 40.0,
                              ),
                              onTap: openCamera,
                            ),
                            GestureDetector(
                              child: Text(
                                'Camera',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: openCamera,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              child:
                                  Icon(Icons.add_photo_alternate, size: 40.0),
                              onTap: openGallery,
                            ),
                            GestureDetector(
                              child: Text(
                                'Gallery',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: openCamera,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget profileDefault() {
    return Container(
      margin: EdgeInsets.only(top: 80.0, bottom: 70.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 160.0),
            child: GestureDetector(
              child: Image.asset('images/camera.png'),
              onTap: optionDialogBox,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: GestureDetector(
              child: Text(
                'Add Image',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 11.0,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(45, 75, 92, 1.0),
                ),
              ),
              onTap: optionDialogBox,
            ),
          ),
        ],
      ),
    );
  }

  Widget profileImage() {
    return Container(
      margin: EdgeInsets.only(top: 50.0, bottom: 40.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.0),
            child: GestureDetector(
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: FileImage(_image),
              ),
              onTap: optionDialogBox,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: GestureDetector(
              child: Text(
                'Add Image',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(45, 75, 92, 1.0),
                ),
              ),
              onTap: optionDialogBox,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
              child: Stack(
                children: <Widget>[
                  (_image == null) ? profileDefault() : profileImage(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 20.0, 15.0, 20.0),
              padding: EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Account-Identity Confirmation',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 13.0,
                            color: Color.fromRGBO(45, 75, 92, 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      SizedBox(
                        width: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {},
                          color: Color.fromRGBO(99, 203, 218, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'Confirm New ID',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
