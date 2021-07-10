import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blog/home.dart';
import 'package:blog/main.dart';
import 'package:blog/managet/loding.dart';
import 'package:blog/news/setting.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:clippy_flutter/buttcheek.dart';
import 'package:flutter/material.dart';

// class NewsDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(

//     );
//   }
// }
class NewsDetail extends StatefulWidget {
  final firstname;
  final aboutname;
  final image;

  const NewsDetail({
    Key key,
    this.firstname,
    this.aboutname,
    this.image,
  }) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

List<Management> _list = [];

Management management = Management();
final _namecontroller = TextEditingController();
int count = 0;
final _formKey = GlobalKey<FormState>();

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scalffordcolor,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: .1)]),
          height: 78,
          child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: Row(
                        children: [
                          Flexible(
                              child: TextFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                fillColor: Colors.orangeAccent,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                labelText: 'Comment',
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                                suffixIcon: Icon(
                                  Icons.comment,
                                  color: Colors.white,
                                )),
                            onSaved: (val) =>
                                setState(() => management.name = val),
                            validator: (valu) =>
                                valu.isEmpty ? 'This field can be Empty' : null,
                            controller: _namecontroller,
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Center(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    var form = _formKey.currentState;

                                    if (form.validate()) {
                                      form.save();
                                      form.reset();
                                      count++;
                                      _list.add(Management(
                                          name: management.name, id: null));

                                      print(management.name);
                                    }
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
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
                    Icons.tab,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Text(widget.firstname.toString()),
            Image.network(
              widget.image ? widget.image.toString() : 'assets/re.png',
              filterQuality: FilterQuality.high,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
              ////

              errorBuilder: (BuildContext context, Object exception,
                  StackTrace stackTrace) {
                // Appropriate logging or analytics, e.g.
                // myAnalytics.recordError(
                //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                //   exception,
                //   stackTrace,
                // );
                return Column(
                  children: [Text('😢'), Text('Network Error')],
                );
              },

              /////
            ),
            Text(widget.aboutname.toString()),
          ],
        ));
  }
}
