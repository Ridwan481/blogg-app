import 'package:blog/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:like_button/like_button.dart';

import 'package:o_color_picker/o_color_picker.dart';

File image;
String filename;
Color currentColor = Colors.limeAccent;

class CommonThings {
  static Size size;
}

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  TextEditingController descInputController = new TextEditingController();
  TextEditingController nameInputController = new TextEditingController();
  TextEditingController imageInputController = new TextEditingController();

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;
  String desc;
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

    await flutterLocalNotificationsPlugin.show(
      0,
      'Breaking News!',
      '${name.toString()}',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new Scaffold(
            floatingActionButton: Padding(
              padding: EdgeInsets.only(bottom: 20, left: 300),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 4,
                child: LikeButton(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  size: 25,
                  circleColor: CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    if (isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 25,
                      );
                    } else {
                      return Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 25,
                      );
                    }
                  },
                  likeCount: 0,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? Colors.red : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "like",
                        style: TextStyle(
                            fontSize: 15,
                            color: color,
                            fontWeight: FontWeight.bold),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(color: color),
                      );
                    return result;
                  },
                ),
              ),
            ),
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
                    name,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                    desc,
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

    DocumentReference ref = await db.collection("ProdColl").add({
      "name": "$name",
      "desc": "$desc",
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

      if (uploadImage(image) != null) {
        loading = false;
        image = null;
        nameInputController.text = "";
        descInputController.text = "";
        var ad = new AlertDialog(
          backgroundColor: Colors.green,
          title: Text("Success!"),
          content: Text("Image Uploaded,Might Take Few Seconds To Appear!"),
        );
        showDialog(
            context: context,
            builder: (_) {
              return ad;
            });
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
            style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          ),
          actions: [
            new IconButton(
              icon: new Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
              onPressed: pickerCam,
              color: currentColor,
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
                        width: 350.0,
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.black),
                        ),
                        padding: new EdgeInsets.all(5.0),
                        child: image == null
                            ? Center(
                                child: Text(
                                  'Add Image',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                              )
                            : Image.file(
                                image,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
                Divider(),
                Text(
                  "Bloge title:",
                  style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                ),
                TextFormField(
                  controller: nameInputController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Product Name!';
                    }
                  },
                  onSaved: (value) => name = value,
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
                  onSaved: (value) => desc = value,
                ),
                Divider(),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: !loading
                        ? Text(
                            'Add Product',
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Poppins"),
                          )
                        : LinearProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                    onPressed: () {
                      if (image != null) {
                        createData();
                      } else {
                        var AD = new AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text("Image Required!"),
                          content: Text("Please Select An Image!"),
                        );
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AD;
                            });
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
