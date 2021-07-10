import 'package:blog/home.dart';
import 'package:blog/managet/adminpage.dart';
import 'package:blog/news/detalinews.dart';
import 'package:blog/news/newsdetail.dart';
import 'package:blog/news/setting.dart';
import 'package:blog/tabpage/popularNews.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Entertan extends StatefulWidget {
  @override
  _EntertanState createState() => _EntertanState();
}

var ui;

class _EntertanState extends State<Entertan> {
  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => null),
    );
  }

  @override
  void initState() {
    super.initState();
    ui = new StreamBuilder(
        stream: Firestore.instance.collection("entercool").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 50, left: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
                  Text('Loding please wait...')
                ],
              ),
            );
          }

          int length = snapshot.data.documents.length;
          return ListView.builder(
            primary: true,
            reverse: true,
            itemCount: length,
            itemBuilder: (context, index) {
              final DocumentSnapshot doc = snapshot.data.documents[index];
              return InkWell(
                  onTap: () => navigateToInfo(doc),
                  child: _news(
                      '${doc.data['ProdImg'].toString()}',
                      '${doc.data["title"].toString()}',
                      '${doc.data["detail"].toString()}'));
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ui,
    ));
  }

  _news(var img, String title, String detail) => Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: InkWell(
            onTap: () {
              print(title);
              Get.to(() => DetailNewas(
                    image: img,
                    title: title,
                    detail: detail,
                  ));
            },
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: MediaQuery.of(context).size.height / 2 + 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Wrap(
                  children: [
                    Hero(
                        tag: title,
                        transitionOnUserGestures: true,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2 - 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              image: DecorationImage(
                                image: NetworkImage(img, scale: 2),
                              )),
                          // child: SafeArea(
                          //   child: Image.network(
                          //     img,
                          //     excludeFromSemantics: true,
                          //     width: double.infinity,
                          //   ),
                          // ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 10, top: 10),
                      child: Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 0.8,
                            ),
                            Text(
                              'Stream News   ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                  fontSize: 14),
                            ),
                            Text(
                              '7 hours ago',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.redAccent,
                                  fontFamily: 'Raleway',
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '1.6k',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.favorite_border,
                                        size: 20,
                                      ),
                                      onPressed: () {}),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
}
