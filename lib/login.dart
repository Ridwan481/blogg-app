import 'package:blog/managet/reset.dart';
import 'package:blog/news/setting.dart';
import 'package:blog/regester.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'managet/loding.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _error;
  String _email, _pass;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final _passcontroller = TextEditingController();
  final _emalcontroller = TextEditingController();
  SharedPreferences logindata;
  bool newuser;
  checkauthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed('/loding');
      }
    });
  }

  var cicle;

  @override
  void initState() {
    super.initState();
    this.checkauthentication();
  }

  login() async {
    var form = _formkey.currentState;
    if (form.validate()) {
      try {
        dialog(context);
        await Future.delayed(Duration(seconds: 7));
        Navigator.pop(context);
        AuthResult user = await _auth.signInWithEmailAndPassword(
            email: _emalcontroller.text.toString().trim(),
            password: _passcontroller.text.toString().trim());
      } catch (e) {
        setState(() {
          _error = e.message;
        });
      }

      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            showerror(),
            Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(drawerimage), fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100))),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 20),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35,
                      color: textcolrs,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: Material(
                child: Container(
                  height: 400,
                  margin: EdgeInsets.all(18),
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway"),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(style: BorderStyle.none),
                            ),
                            fillColor: Colors.orange[233],
                            filled: true,
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Raleway"),
                            suffixIcon: Icon(Icons.email)),
                        onSaved: (vlu) => _email = vlu,
                        controller: _emalcontroller,
                        validator: (validat) {
                          if (validat.isEmpty) {
                            return 'please Enter Your Email';
                          } else {
                            bool emailvalid = RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(validat);
                            if (!emailvalid) {
                              return 'please Enter  A Real Email Format';
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway"),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(style: BorderStyle.none),
                            ),
                            fillColor: Colors.orange[233],
                            filled: true,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Raleway"),
                            suffixIcon: Icon(Icons.visibility)),
                        obscureText: true,
                        controller: _passcontroller,
                        onSaved: (vlu) => _pass = vlu,
                        validator: (validat) {
                          if (validat.isEmpty) {
                            return 'please Enter Your Password';
                          }
                        },
                        maxLength: 8,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (cnt) => Reset())),
                          child: Text(
                            'forget password?',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Raleway"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: login,
                        child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                color: drawercolor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            child: Center(
                                child: !loding
                                    ? Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway"),
                                      )
                                    : CircularProgressIndicator())),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text(
                              'Dont have an Account?',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Raleway"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                //
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (cnt) => Regester()));
                              },
                              child: Text(
                                'signup',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Raleway"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showerror() {
    if (_error != null) {
      return SafeArea(
        child: Container(
          color: Colors.red,
          child: Row(
            children: [
              Icon(Icons.error),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  child: Text(
                _error,
                style: TextStyle(
                    fontFamily: "Raleway", fontWeight: FontWeight.bold),
              )),
              SizedBox(
                width: 20,
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
      return SizedBox(
        height: 0,
      );
    }
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
}
