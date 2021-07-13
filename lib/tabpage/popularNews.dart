import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:blog/http_helper/http_class.dart';
import 'package:blog/http_helper/newsclass.dart';
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
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
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

bool loding = true;

List<NewsModel> _newsModel = List<NewsModel>();

class _PopulaState extends State<Popula> {
  @override
  void initState() {
    super.initState();
    _getnews();
  }

  Future<NewsModel> _getnews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=ng&apiKey=1aaa3054cb764b4797e19c40f637cb73';

    final respond = await http.get(url);
    if (respond.statusCode == 200) {
      final jsondata = jsonDecode(respond.body);

      NewsModel.fromjson(jsondata);
      setState(() {});
    } else {
      throw Exception();
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<NewsModel>(
            future: _getnews(),
            builder: (context, snapshort) {
              if (snapshort.hasData) {
                var dat = snapshort.data;

                return Text(dat.title.toString());
              } else if (snapshort.hasError) {}
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
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
                      image: NetworkImage(image1), fit: BoxFit.fill),
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
