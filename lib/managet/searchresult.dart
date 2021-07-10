import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
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
class Searchresult extends StatefulWidget {
  final firstname;
  final aboutname;
  final image;
  final image1;

  const Searchresult({
    Key key,
    this.firstname,
    this.aboutname,
    this.image,
    this.image1,
  }) : super(key: key);

  @override
  _SearchresultState createState() => _SearchresultState();
}

List<Management> _list = [];

Management management = Management();
final _namecontroller = TextEditingController();
int count = 0;
final _formKey = GlobalKey<FormState>();

class _SearchresultState extends State<Searchresult> {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.firstname.toString(),
              style: TextStyle(
                  color: textcolrs,
                  fontSize: 30,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold),
            ),
          ),
          ButtCheek(
            clipShadows: [ClipShadow(color: Colors.black)],
            height: 30,
            child: Hero(
                tag: widget.image1,
                child: Image.asset(
                  widget.image1,
                  height: 400,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Text(widget.aboutname.toString(),
                style: TextStyle(color: textcolrs, fontSize: 20)
                //  TextStyle(
                //   fontSize: 18,
                //   fontWeight: FontWeight.bold,
                //   color: Colors.black,
                //   fontFamily: 'Montserrat'
                // ),
                ),
          ),
          Arc(
              height: 30,
              child: Image.asset(
                widget.image1,
                height: 400,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              )),
          //      Container(
          //   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
          //   child: Text(widget.othername,style: textstyle),
          // ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: Card(
              elevation: 0,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TypewriterAnimatedTextKit(
                  pause: Duration(seconds: 3),
                  displayFullTextOnTap: true,
                  totalRepeatCount: 3,
                  isRepeatingAnimation: true,
                  textAlign: TextAlign.center,
                  text: [
                    ' [ $count ] People Comment',
                    ' Add your own Comment ',
                    'below...'
                  ],
                  textStyle: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent)),
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.orangeAccent,
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                        _list[index].name.toString().trim(),
                        style: textstyle,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
