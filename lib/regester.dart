import 'package:blog/news/setting.dart';
import 'package:blog/tabpage/popularNews.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';

import 'managet/loding.dart';

class Regester extends StatefulWidget {
  @override
  _RegesterState createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  final _passcontroller = TextEditingController();
  final _emalcontroller = TextEditingController();
  final _usercontroller = TextEditingController();

  String _error;

  Future<bool> regesterUser(
      String email, String pass, String name, String url) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = result.user;
      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      info.photoUrl = url;
      user.updateProfile(info);
      user.reload();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  String islod = 'submit';
  bool islode = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  checkauthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/loding');
      }
    });
  }

  String _email, _pass, _name;
  @override
  void initState() {
    super.initState();
    this.checkauthentication();
  }

  singup() async {
    var form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      try {
        dialog(context);
        await Future.delayed(Duration(seconds: 7));
        Navigator.pop(context);
        AuthResult result = await _auth.createUserWithEmailAndPassword(
            email: _emalcontroller.text.toString().trim(),
            password: _passcontroller.text.toString().trim());
        FirebaseUser user = result.user;
        if (user != null) {
          UserUpdateInfo updateInfo = UserUpdateInfo();
          updateInfo.displayName = _usercontroller.text.toString().trim();
          user.updateProfile(updateInfo);
          user.reload();
          setState(() {
            islode = true;
          });
        }
      } catch (e) {
        print(e);
        setState(() {
          _error = e.message;
        });
        form.reset();
      }
    }
  }

  //rofiatnuraini
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            storageuser(),
            Container(
                margin: EdgeInsets.only(),
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    //
                    image: DecorationImage(
                        image: AssetImage(drawerimage), fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(100))),
                child: Column(
                  children: [
                    Container(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            })),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150, left: 19),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 35,
                            color: textcolrs,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Raleway",
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Form(
                key: _formkey,
                child: Container(
                  height: 350,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Material(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Raleway"),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            style: BorderStyle.none, width: 2),
                                      ),
                                      fillColor: Colors.orange[233],
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            style: BorderStyle.none, width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            style: BorderStyle.none, width: 2),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 15,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.bold),
                                      labelText: 'UserName',
                                      labelStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Raleway"),
                                      suffixIcon: Icon(Icons.person)),
                                  validator: (validat) {
                                    if (validat.isEmpty) {
                                      return 'Please Enter Your UserName';
                                    }
                                  },
                                  onSaved: (val) => val = _name,
                                  controller: _usercontroller,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Raleway"),
                                  decoration: InputDecoration(
                                      fillColor: Colors.orange[233],
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 15,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Raleway"),
                                      suffixIcon: Icon(Icons.email)),
                                  validator: (validat) {
                                    if (validat.isEmpty) {
                                      return 'please Enter Your Email';
                                    } else {
                                      bool emailvalid =
                                          RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                              .hasMatch(validat);
                                      if (!emailvalid) {
                                        return 'please Enter  A Real Email Format';
                                      }
                                    }
                                  },
                                  onSaved: (val) => val = _email,
                                  controller: _emalcontroller,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Raleway"),
                                  decoration: InputDecoration(
                                      fillColor: Colors.orange[233],
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            style: BorderStyle.none, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 15,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold),
                                      labelText: 'password',
                                      labelStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Raleway"),
                                      suffixIcon: Icon(Icons.visibility)),
                                  validator: (validat) {
                                    if (validat.isEmpty) {
                                      return 'please Enter Your Password';
                                    }
                                  },
                                  maxLength: 8,
                                  obscureText: true,
                                  onSaved: (val) => val = _pass,
                                  controller: _passcontroller,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),

                        //   }

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: GestureDetector(
                            onTap: () {
                              singup();
                            },
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                  color: drawercolor,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20)),
                              child: Center(
                                  child: isloding
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'Submit',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Raleway"),
                                        )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void dialog(context) {
    var db = new AlertDialog(
        backgroundColor: drawercolor,
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('assets/logo1.png'), fit: BoxFit.fill),
              borderRadius: BorderRadiusDirectional.circular(20)),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                    semanticsLabel: 'loding..',
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Loding please Wait.....')
            ],
          ),
        ));

    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: '',
        transitionDuration: Duration(seconds: 2),
        transitionBuilder: (BuildContext context, Animation<double> a1,
                Animation<double> a2, Widget child) =>
            SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                      .animate(a1),
              child: db,
            ),
        pageBuilder: (context, anim1, anim2) {
          return Transform.rotate(angle: anim1.value);
        });
  }

  Widget storageuser() {
    if (_error != null) {
      return SafeArea(
        child: Container(
          color: Colors.red,
          margin: EdgeInsets.only(left: 0, right: 0.0),
          child: Row(
            children: [
              Icon(Icons.error),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  _error,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  })
            ],
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
