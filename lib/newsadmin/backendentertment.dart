import 'package:blog/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:like_button/like_button.dart';

File image;
String filename;
Color currentColor = Colors.limeAccent;

class CommonThings {
  static Size size;
}

class EntertamnetAdd extends StatefulWidget {
  @override
  _EntertamnetAddState createState() => _EntertamnetAddState();
}

class _EntertamnetAddState extends State<EntertamnetAdd> {
  TextEditingController descInputController = new TextEditingController();
  TextEditingController nameInputController = new TextEditingController();

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String title;
  String detail;
  var color;

  pickerCam() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Future _showNotification() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'Stream News', 'News App', 'Read all the latest News ',
        importance: Importance.max, priority: Priority.high);

    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();

    var platformChannelSpecifics = new NotificationDetails(
        iOS: iOSPlatformChannelSpecifics,
        android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'Breaking News!',
      '${title.toString()}',
      RepeatInterval.daily,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      payload: 'Default_Sound',
    );
    // await flutterLocalNotificationsPlugin.show(
    //   0,
    //   'Breaking News!',
    //   '${title.toString()}',
    //   platformChannelSpecifics,
    //   payload: 'Default_Sound',
    // );
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              actions: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                )
              ],
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 300.0,
                    width: double.infinity,
                    decoration: new BoxDecoration(),
                    padding: new EdgeInsets.all(5.0),
                    child: Image.file(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Divider(),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                    detail,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  bool loading = false;

  var fullImageName;

  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  Future<String> uploadImage(var imageFile) async {
    var rand1 = new Random().nextInt(999);
    var rand2 = new Random().nextInt(999);
    var rand3 = new Random().nextInt(999);

    fullImageName = 'Img-$rand1-$rand2-$rand3.jpg';

    final StorageReference refImg =
        FirebaseStorage.instance.ref().child(fullImageName);
    StorageUploadTask uploadTask = refImg.putFile(image);
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();

    DocumentReference ref = await db.collection("entercool").add({
      "title": "$title",
      "detail": "$detail",
      "ProdImg": "$dowurl",
      "currentColor": "$currentColor"
    });

    setState(() {
      id = ref.documentID;
    });

    return dowurl.toString();
  }

  @override
  initState() {
    super.initState();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = new IOSInitializationSettings();

    var initializationSettings = new InitializationSettings(
        iOS: initializationSettingsIOS, android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void createData() async {
    if (_formKey.currentState.validate()) {
      loading = true;
      _formKey.currentState.save();
//Success!

      if (uploadImage(image) != null) {
        loading = false;
        image = null;
        nameInputController.text = "";
        descInputController.text = "";
        Get.defaultDialog(
            backgroundColor: Colors.green,
            title: 'Success!',
            middleText: 'Image Uploaded,Might Take Few Seconds To Appear! 😂');

        Future.delayed(Duration(minutes: 2), () {
          _showNotification();
        });
      } else {
        print("No");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Add Blogs',
            style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
          ),
          actions: [
            new IconButton(
              icon: new Icon(Icons.camera_alt),
              onPressed: pickerCam,
              color: Colors.black,
            ),
            Divider(),
            new IconButton(
              icon: new Icon(Icons.image),
              onPressed: pickerGallery,
              color: Colors.black,
            ),
          ]),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: new Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.black),
                        ),
                        padding: new EdgeInsets.all(5.0),
                        child: image == null
                            ? Center(
                                child: Text(
                                  'Add Image',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                              )
                            : Image.file(
                                image,
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
                Divider(),
                Text(
                  "Bloge title:",
                  style: TextStyle(color: Colors.black),
                ),
                TextFormField(
                  controller: nameInputController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Product Name!';
                    }
                  },
                  maxLength: 55,
                  onSaved: (value) => title = value,
                ),
                Divider(),
                Text(
                  "Bloge Desc:",
                  style: TextStyle(color: Colors.black),
                ),
                TextFormField(
                  controller: descInputController,
                  maxLines: 6,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Product Desc!';
                    }
                  },
                  onSaved: (value) => detail = value,
                ),
                Divider(),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: loading
                        ? LinearProgressIndicator(
                            backgroundColor: Colors.black,
                          )
                        : Text(
                            'Add blog',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                    onPressed: () {
                      if (image != null) {
                        createData();
                      } else {
                        Get.defaultDialog(
                            title: 'Please select Image',
                            middleText: 'Image Requir');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
