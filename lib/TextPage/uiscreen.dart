import 'dart:math';

import 'package:blog/TextPage/TodoHelper.dart';
import 'package:blog/iconspage/class.dart';
import 'package:blog/managet/reset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class TextApp extends StatefulWidget {
  @override
  _TextAppState createState() => _TextAppState();
}

Animation<double> animation;

TextEditingController controller = TextEditingController();
UserId _userId = UserId();
List<UserId> list = [];

class _TextAppState extends State<TextApp> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            child: ListView(
              padding: EdgeInsets.all(13),
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Title',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onSaved: (slv) {
                    setState(() {
                      _userId.title = slv;
                    });
                  },
                  validator: (e) {
                    if (e.isEmpty) {
                      return 'please insert some field!';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Detail',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onSaved: (slv) {
                    setState(() {
                      _userId.detaile = slv;
                    });
                  },
                  validator: (e) {
                    if (e.isEmpty) {
                      return 'please insert some field!';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.blue,
                  child: ElevatedButton(
                      onPressed: _onpres,
                      child: Text(
                        'Add',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                _continer(),
              ],
            ),
          )),
    );
  }

  _continer() => Container(
        height: MediaQuery.of(context).size.height / 2 + 20,
        child: Flexible(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (cnt, int i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Dismissible(
                    key: Key(list[i].title),
                    onDismissed: (derction) {
                      list.removeAt(i);

                      Get.rawSnackbar(
                          title: '${list[i].title.toString()}',
                          message: 'Delete succesfuly');
                    },
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/us1.jpeg'),
                        ),
                        title: Text(
                          list[i].title.toString().toUpperCase(),
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        subtitle: Text(list[i].detaile.toString()),
                      ),
                    ),
                  ),
                );
              }),
        ),
      );

  _onpres() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      print(_userId.detaile);
      print(_userId.title);
      list.add(UserId(title: _userId.title, detaile: _userId.detaile));

      form.reset();
    }
  }
}
