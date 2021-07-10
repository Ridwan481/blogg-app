import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blog/managet/adminpage.dart';
import 'package:blog/managet/loding.dart';
import 'package:blog/managet/mylist.dart';
import 'package:blog/managet/search.dart';

import 'package:blog/managet/state.dart';
import 'package:blog/news/sliderdetail.dart';
import 'package:get/get.dart';
import 'package:blog/tabpage/popularNews.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:blog/news/setting.dart';

import 'package:blog/tabpage/entertan.dart';
import 'package:blog/tabpage/politice.dart';

import 'package:blog/tabpage/sport.dart';
import 'package:blog/tabpage/wordnews.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shimmer/shimmer.dart';

import 'TextPage/uiscreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool isloding = true;

double hight = 150;
double widhte = 300;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 2), () {
      setState(() {
        isloding = false;
      });
    });

    return FirstNews();
  }
}

class Justin extends StatelessWidget {
  final Timer timer;
  const Justin({this.timer});

  @override
  Widget build(BuildContext context) {
    timer.cancel();
    return FirstNews();
  }
}

class FirstNews extends StatefulWidget {
  final VoidCallback openDrawer;

  const FirstNews({Key key, this.openDrawer}) : super(key: key);
  _FirstNewsState createState() => _FirstNewsState();
}

class _FirstNewsState extends State<FirstNews>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  String id;
  final db = Firestore.instance;

  String name;
  var st;
  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyInfoPage(
          ds: ds,
        ),
      ),
    );
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('ProdColl').document(doc.documentID).delete();
    setState(() => id = null);
  }

  final time = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    setState(() {
      st = StreamBuilder(
        stream: Firestore.instance.collection("ProdColl").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.black)),
              ),
            );
          }
          if (snapshot.hasError) return null;

          int length = snapshot.data.documents.length;
          return CarouselSlider.builder(
            itemCount: length,
            itemBuilder: (bct, index, realIdx) {
              final DocumentSnapshot doc = snapshot.data.documents[index];
              return InkWell(
                onLongPress: () {
                  deleteData(doc);
                },
                onTap: () => navigateToInfo(doc),
                child: _firstnews('${doc.data['ProdImg']}',
                    '${doc.data["name"].toString()}', ''),
              );
            },
            options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: false,
                aspectRatio: 20 / 10,
                enableInfiniteScroll: true),
          );
        },
      );
    });
    controller =
        ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

    tabController = TabController(length: 5, vsync: this);
  }

  bool iscang = false;
  void _onpress() {
    widget.openDrawer();
    print(sizee);
  }

  bool newuser;
  FirebaseUser user;
  bool islogin = true;

  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthStatuse _authStatuse = AuthStatuse.notedetaermin;

  checkauthentication(BuildContext context) async {
    _auth.onAuthStateChanged.listen((user) {
      if (user == null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => States()));
        setState(() {
          _authStatuse = AuthStatuse.notedetaermin;
        });
      }
    });
  }

  void despose() {
    super.dispose();
  }

  Future refres() async {
    Future.delayed(Duration(milliseconds: 500), () {});
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController controller;

  void _selt(selet) {
    setState(() {
      selet = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay.now().format(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(() => Texte());
              _onpress();
            }),
        title: InkWell(
          onLongPress: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (cnt) => Admin()));
          },
          child: TextLiquidFill(
              boxBackgroundColor: Colors.grey.shade50,
              waveColor: Colors.black,
              loadDuration: Duration(seconds: 2),
              textStyle: TextStyle(fontSize: 26, color: Colors.black),
              waveDuration: Duration(seconds: 6),
              text: 'Stream News'),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(Texte());
              })
        ],
      ),
      body: Container(
        height: size.height,
        padding: MediaQuery.of(context).padding,
        width: size.width,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'your daily',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    Text('Recomendation',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: st,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.transparent,
                  controller: tabController,
                  isScrollable: true,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black),
                  tabs: <Widget>[
                    Text('Today'),
                    Text(
                      'Etertament',
                    ),
                    Text('Sport'),
                    Text('Trending'),
                    Text('Politice')
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: size.height / 2 - 50,
                width: size.width,
                child: TabBarView(controller: tabController, children: [
                  Popula(),
                  Entertan(),
                  Sport(),
                  World(),
                  Politice(),
                ]))
          ],
        ),
      ),
    );
  }

//  set this code it for the slider but the problem is that wen i open this page on other emulator it will ree size or overflow!!?
//bro can you rich me
  _firstnews(String image, String dicribtion, String time) => InkWell(
        child: Container(
            margin: EdgeInsets.all(2),
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: linaergrand,
              ),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            dicribtion,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: inercolor,
                                fontSize: 14,
                                fontFamily: "Poppins"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(time,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: inercolor))
                      ],
                    ),
                  )),
            )),
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
        baseColor: Colors.grey[300],
        highlightColor: Colors.white24,
        child: Container(
          height: 200,
          width: 300,
        ),
      ),
    ));
  }
}
