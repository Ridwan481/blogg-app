import 'package:blog/home.dart';
import 'package:blog/login.dart';
import 'package:blog/managet/getsate.dart';
import 'package:blog/managet/pageslas.dart';
import 'package:blog/managet/state.dart';
import 'package:blog/tabpage/popularNews.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Management {
  String name;
  int id;
  Management({this.name, this.id});
}

bool loding = false;
enum AuthStatuse { loggin, notlogin, notedetaermin }
AuthStatuse _authStatuse = AuthStatuse.notedetaermin;

class Rootapp extends StatefulWidget {
  @override
  _RootappState createState() => _RootappState();
}

class _RootappState extends State<Rootapp> {
  bool newuser;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_authStatuse != AuthStatuse.loggin) {
      return Loding();
    } else if (_authStatuse != AuthStatuse.notlogin) {
      return States();
    } else if (_authStatuse != AuthStatuse.notedetaermin) {
      return Getsate();
    } else {
      return Login();
    }
    // switch (_authStatuse) {
    //   case AuthStatuse.loggin:
    //     return Home();
    //     break;
    //   case AuthStatuse.notlogin:
    //     return States();
    //     break;
    //   case AuthStatuse.notedetaermin:
    //     return Getsate();
    //   default:
    //     return Getsate();
    // }
  }
}
