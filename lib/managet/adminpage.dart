import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blog/news/setting.dart';
import 'package:blog/newsadmin/backend1.dart';
import 'package:blog/newsadmin/backendentertment.dart';
import 'package:blog/tabpage/popularNews.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';

import '../home.dart';

dynamic size = 0.0;
double sizee = 0.0;
Widget iscang;

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

bool connet = false;
String text = '😢';

class _AdminState extends State<Admin> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Future<bool> checkconnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          connet = true;
          text = 'your are connected';
        });
      }
    } on SocketException catch (_) {
      connet = false;
      text = 'no Network';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;
    offset += 5;
    time = 800 + offset;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: textcolrs),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: drawercolor,
          title: Text(
            'Admin',
            style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: textcolrs),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 40),
          children: [
            _layout(
                name: 'Popular News',
                name2: 'Entertament',
                onprs: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (cnt) => ProductAdd()));
                },
                onpr: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (cnt) => EntertamnetAdd()));
                },
                color: Colors.redAccent.shade700,
                colors: Colors.orange.shade400),
            SizedBox(
              height: 30,
            ),
            _layout(
                name: 'Sport',
                name2: 'World News',
                onprs: () {},
                onpr: () {},
                color: Colors.cyan.shade700,
                colors: Colors.brown.shade400),
            SizedBox(
              height: 30,
            ),
            _layout(
                name: 'World News',
                name2: 'Feed Back',
                onprs: () {},
                onpr: () {},
                color: Colors.pink.shade700,
                colors: Colors.purpleAccent.shade400),
          ],
        ));
  }

  _layout(
          {String name,
          String name2,
          final onprs,
          final onpr,
          dynamic color,
          dynamic colors}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: onprs,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: colors, borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onpr,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  name2,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      );
}

class Simer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;
    offset += 5;
    time = 800 + offset;

    return Scaffold(
        body: Container(
      height: 200,
      child: Shimmer.fromColors(
        period: Duration(milliseconds: time),
        baseColor: Colors.red[300],
        highlightColor: Colors.white24,
        child: Container(
          height: 200,
          width: 300,
        ),
      ),
    ));
  }
}
