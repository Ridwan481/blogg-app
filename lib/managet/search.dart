import 'package:blog/home.dart';
import 'package:blog/iconspage/class.dart';
import 'package:blog/iconspage/drawerfile.dart';
import 'package:blog/news/detalinews.dart';
import 'package:blog/news/setting.dart';
import 'package:blog/tabpage/entertan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:blog/managet/mylist.dart';
import 'package:get/get.dart';

class Texte extends StatefulWidget {
  @override
  _TexteState createState() => _TexteState();
}

class _TexteState extends State<Texte> {
  double offset;
  double maxset;
  double scale;
  bool isopene;
  bool isdrage = false;
  Drawermenu items = Drawe.home;
  void openDrwer() => setState(() {
        offset = 200;
        maxset = 150;
        scale = 0.7;
        isopene = true;
      });
  void closeDrwer() => setState(() {
        offset = 0;
        maxset = 0;
        scale = 1;
        isopene = false;
      });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closeDrwer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NewWidget(
            onchange: (e) {
              setState(() {
                this.items = e;
                closeDrwer();
              });
            },
          ),
          show()
        ],
      ),
    );
  }

  Widget show() {
    return GestureDetector(
        onHorizontalDragStart: (detailes) => isdrage = true,
        onHorizontalDragUpdate: (detailes) {
          if (!isdrage) return true;
          const dlt = 1;
          if (detailes.delta.dx < -dlt) {
            openDrwer();
          }
          return false;
        },
        onTap: () {
          closeDrwer();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(offset, maxset, 0)..scale(scale),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isopene ? 20 : 0),
            child: Container(
              decoration: BoxDecoration(
                  color:
                      isopene ? Colors.white12 : Color.fromRGBO(21, 40, 77, 2),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: isopene ? 10 : 0,
                        spreadRadius: isopene ? 10 : 0,
                        color: Colors.grey.shade900)
                  ]),
              child: AbsorbPointer(absorbing: isopene, child: getPage()),
            ),
          ),
        ));
  }

  getPage() {
    switch (items) {
      case Drawe.search:
        return Searchpage(
          openDrawer: openDrwer,
        );
      case Drawe.category:
        return Categore(
          openDrawer: openDrwer,
        );
      case Drawe.home:
      default:
        return FirstNews(
          openDrawer: openDrwer,
        );
    }
  }
}

class NewWidget extends StatelessWidget {
  final ValueChanged<Drawermenu> onchange;

  const NewWidget({Key key, this.onchange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/us1.jpeg'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Ridwan',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              buildDrawerItem(context),
            ],
          ),
        ));
  }

  Widget buildDrawerItem(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: Drawe.all
                .map((e) => ListTile(
                      onTap: () => onchange(e),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      leading: Icon(
                        e.icon,
                        color: Colors.black,
                      ),
                      title: Text(
                        e.title,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ))
                .toList(),
          ),
        ),
      );
}

class NewPage extends StatelessWidget {
  final VoidCallback openDrawer;

  const NewPage({Key key, this.openDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        leading: DrwerMenubutton(
          oncleck: openDrawer,
        ),
        backgroundColor: Colors.transparent,
        title: Text('Show'),
      ),
    );
  }
}

class Searchpage extends StatelessWidget {
  final VoidCallback openDrawer;

  const Searchpage({Key key, this.openDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        leading: DrwerMenubutton(
          oncleck: openDrawer,
        ),
        backgroundColor: Colors.transparent,
        title: Text('search'),
      ),
    );
  }
}

class Categore extends StatelessWidget {
  final VoidCallback openDrawer;

  const Categore({Key key, this.openDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        leading: DrwerMenubutton(
          oncleck: openDrawer,
        ),
        backgroundColor: Colors.transparent,
        title: Text('categor'),
      ),
    );
  }
}

class DrwerMenubutton extends StatelessWidget {
  final VoidCallback oncleck;

  const DrwerMenubutton({Key key, this.oncleck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.format_align_left),
      onPressed: oncleck,
      color: Colors.white,
    );
  }
}

// class Shearch extends StatefulWidget {
//   @override
//   _ShearchState createState() => _ShearchState();
// }

// QuerySnapshot snapshot;
// var widget;
// bool ischangeDta = false;

// TextEditingController controller = TextEditingController();

// class _ShearchState extends State<Shearch> {
//   // Widget searchdata() {
//   //   return ListView.builder(
//   //       itemCount: snapshot.documents.length,
//   //       itemBuilder: (context, index) {
//   //         return _news(
//   //             snapshot.documents[index].data['imag'],
//   //             '${snapshot.documents[index].data["title"].toString()}',
//   //             '${snapshot.documents[index].data["detaile"].toString()}');
//   //       });
//   // }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     setState(() {
//       widget = new StreamBuilder(
//           stream: Firestore.instance.collection("entercool").snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Padding(
//                 padding: const EdgeInsets.only(top: 50, left: 50),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircularProgressIndicator(
//                       backgroundColor: Colors.grey,
//                     ),
//                     Text('Loding please wait...')
//                   ],
//                 ),
//               );
//             }

//             int length = snapshot.data.documents.length;
//             return ListView.builder(
//               primary: true,
//               reverse: true,
//               itemCount: length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot doc = snapshot.data.documents[index];
//                 return InkWell(
//                     // onTap: () => navigateToInfo(doc),
//                     child: _news(
//                         '${doc.data['ProdImg'].toString()}',
//                         '${doc.data["title"].toString()}',
//                         '${doc.data["detail"].toString()}'));
//               },
//             );
//           });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: FlatButton.icon(
//             onPressed: () {
//               print(controller.text.toString());
//             },
//             icon: Icon(Icons.close),
//             label: Text('close')),
//         appBar: AppBar(
//           elevation: 0.0,
//           leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Get.back();
//               }),
//           backgroundColor: Colors.white,
//           title: TextField(
//             controller: controller,
//             cursorColor: Colors.transparent,
//             autocorrect: true,
//             decoration: InputDecoration(
//                 labelText: 'Search',
//                 labelStyle: TextStyle(
//                     fontFamily: 'Poppins', color: Colors.grey, fontSize: 17)),
//           ),
//           actions: [
//             GetBuilder<DataController>(
//                 init: DataController(),
//                 builder: (value) {
//                   return IconButton(
//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.black,
//                       ),
//                       onPressed: () {
//                         print(controller.text.toString());
//                         value
//                             .querysnapshort(controller.text, snapshot)
//                             .then((value) {
//                           snapshot = value;
//                           setState(() {
//                             ischangeDta = true;
//                           });
//                         });
//                       });
//                 })
//           ],
//         ),
//         body: ischangeDta
//             ? widget
//             : Container(
//                 height: 200,
//                 width: double.infinity,
//                 child: Center(
//                   child: Text('No Result yet Search to See Result!!! '),
//                 ),
//               ));
//   }

//   _news(var img, String title, String detail) => Padding(
//         padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
//         child: InkWell(
//             onTap: () {
//               print(title);
//               Get.to(DetailNewas(
//                 image: img,
//                 title: title,
//                 detail: detail,
//               ));
//             },
//             child: Material(
//               elevation: 4.0,
//               borderRadius: BorderRadius.circular(25),
//               child: Container(
//                 height: MediaQuery.of(context).size.height / 2 + 5,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Wrap(
//                   children: [
//                     Hero(
//                         tag: title,
//                         transitionOnUserGestures: true,
//                         child: Container(
//                           height: MediaQuery.of(context).size.height / 2 - 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(25),
//                                 topRight: Radius.circular(25)),
//                             // image: DecorationImage(
//                             //   image: NetworkImage(img, scale: 2),
//                             // )
//                           ),
//                           child: Image.network(
//                             img,
//                             height: 159,
//                             width: double.infinity,
//                           ),
//                         )),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(left: 20, right: 10, top: 10),
//                       child: Flexible(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               title,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   fontFamily: 'Raleway',
//                                   fontSize: 17),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SizedBox(
//                               width: 0.8,
//                             ),
//                             Text(
//                               'Stream News   ',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black,
//                                   fontFamily: 'Raleway',
//                                   fontSize: 14),
//                             ),
//                             Text(
//                               '7 hours ago',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.redAccent,
//                                   fontFamily: 'Raleway',
//                                   fontSize: 12),
//                             ),
//                             SizedBox(
//                               width: 40,
//                             ),
//                             Flexible(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '1.6k',
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   IconButton(
//                                       icon: Icon(
//                                         Icons.favorite_border,
//                                         size: 20,
//                                       ),
//                                       onPressed: () {}),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )),
//       );
// }
