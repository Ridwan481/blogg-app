import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SportDetail extends StatefulWidget {
  final image1;
  final image2;
  final image3;
  final title;
  final detail;
  final subtitle;

  const SportDetail(
      {Key key,
      this.image1,
      this.image2,
      this.image3,
      this.title,
      this.detail,
      this.subtitle})
      : super(key: key);
  @override
  _SportDetailState createState() => _SportDetailState();
}

class _SportDetailState extends State<SportDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image1.toString()),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: ListView(
              children: [
                ListTile(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Get.back();
                      }),
                  trailing:
                      IconButton(icon: Icon(Icons.share), onPressed: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 10),
                  child: Container(
                    child: Text(
                      " ${widget.title} \n",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(8),
              child: Text(
                widget.detail,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              )),
          Container(
              height: 200,
              child: Image.asset(
                widget.image2,
                fit: BoxFit.cover,
              )),
          Container(
              margin: EdgeInsets.all(8),
              child: Text(
                widget.subtitle,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 200,
              child: Image.asset(
                widget.image3,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
