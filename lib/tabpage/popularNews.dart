import 'dart:async';
import 'dart:ui';

import 'package:blog/managet/mylist.dart';
import 'package:blog/news/newsdetail.dart';
import 'package:blog/news/setting.dart';
import 'package:clippy_flutter/buttcheek.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:photo_view/photo_view.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

bool isloding = true;

double hight = 150;
double widhte = 300;

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 2), () {
      setState(() {
        isloding = false;
      });
    });

    return isloding ? Simer() : Populaer(timer);
  }
}

class Populaer extends StatelessWidget {
  final Timer timer;

  const Populaer(this.timer);

  @override
  Widget build(BuildContext context) {
    timer.cancel();
    return Popula();
  }
}

class Popula extends StatefulWidget {
  @override
  _PopulaState createState() => _PopulaState();
}

class _PopulaState extends State<Popula> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              secondNews(
                'assets/t.jpeg',
                'breaking News japannes people as contact coronal virous just a seruse ',
                'detail',
              ),
              secondNews(
                'assets/sleep.jpeg',
                'breaking News japannes people as contact coronal virous just a seruse ',
                'detail',
              ),
              secondNews(
                'assets/k.jpeg',
                'breaking News japannes people as contact coronal virous just a seruse ',
                'detail',
              ),
              secondNews(
                'assets/fuk.jpeg',
                'breaking News japannes people as contact coronal virous just a seruse',
                'detail',
              ),
              secondNews(
                  'assets/jo.jpeg',
                  'am not intrest in relationship  coronal virous just a seruse',
                  'detail')
            ],
          ),
        ),
      ),
    );
  }
}

class Simer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;
    offset += 5;
    time = 800 + offset;

    return Stack(
      children: [
        Shimmer.fromColors(
            period: Duration(milliseconds: time),
            baseColor: Colors.grey[300],
            highlightColor: Colors.white24,
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: hight,
                  width: widhte,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: hight,
                  width: widhte,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: hight,
                  width: widhte,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
          ),
        )
      ],
    );
  }
}

Widget secondNews(
  String image1,
  String title,
  String detail,
) =>
    Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(7),
                height: 110,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image1), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.thumb_up,
                                color: Colors.black54,
                                size: 20,
                              ),
                              label: Text(
                                'Like',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'Poppins'),
                              )),
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.black54,
                              ),
                              label: Text(
                                'shear',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'Poppins'),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
