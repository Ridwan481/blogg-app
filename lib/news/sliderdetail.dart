import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MyInfoPage extends StatefulWidget {
  final DocumentSnapshot ds;
  MyInfoPage({this.ds});
  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  String productImage;
  String id;
  String name;
  String desc;
  int likeCount;

  TextEditingController nameInputController;
  TextEditingController descInputController;

  Future getPost() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("ProdColl").getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    descInputController =
        new TextEditingController(text: widget.ds.data["desc"]);
    nameInputController =
        new TextEditingController(text: widget.ds.data["name"]);
    productImage = widget.ds.data["ProdImg"];
    name = widget.ds.data["name"];
    desc = widget.ds.data["desc"];
  }

  @override
  Widget build(BuildContext context) {
    getPost();
    return Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20, left: 300),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 4,
            child: LikeButton(
              crossAxisAlignment: CrossAxisAlignment.center,
              size: 25,
              circleColor:
                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
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
                child: Image.network(
                  productImage,
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
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }
}
