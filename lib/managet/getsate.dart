import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Gradintbt extends StatelessWidget {
  var w, h, roundedRadius, btncolor, btntext, textcolor, textfont, Do;
  Gradintbt({
    @required this.roundedRadius,
    @required this.btncolor,
    @required this.btntext,
    @required this.textcolor,
    @required this.textfont,
    @required this.w,
    @required this.h,
    @required this.Do,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      child: RaisedButton(
          color: btncolor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(roundedRadius)),
          child: Text(
            btntext,
            style: TextStyle(
                fontSize: textfont, color: textcolor, fontFamily: "Raleway"),
          ),
          onPressed: Do),
    );
  }
}

class Getsate extends StatefulWidget {
  @override
  _GetsateState createState() => _GetsateState();
}

SharedPreferences logindata;
bool newuser;
int selectedindexpage = 0;
var wave = WaveClipperOne(flip: false, reverse: true);

class _GetsateState extends State<Getsate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: DefaultTabController(
        length: 3,
        child: Builder(
            builder: (BuildContext context) => SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    image: DecorationImage(
                                        image: AssetImage('assets/ff.png'),
                                        fit: BoxFit.contain)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 18, right: 18, bottom: 450),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 18),
                                        child: Text(
                                          'Entertament',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Raleway",
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Get the latest entertainment news and Gist in Nigeria. We are delivering online blog for breaking gossips, rumor and bulletin daily in Naija?',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    image: DecorationImage(
                                        image: AssetImage('assets/im.png'),
                                        fit: BoxFit.contain)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 18, right: 18, bottom: 400),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 18),
                                        child: Text(
                                          'World News',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Raleway",
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'the  Sentry Provides Innovative, Investigative Reports On World News & African War Crimes. Stay Informed On World News With Reports Of War Crimes In Africa And Their Global Impact. Forensic Investigations. Analyzing Corruption. Policy Analysis. Conflicts In Africa.',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    image: DecorationImage(
                                        image: AssetImage('assets/r.png'),
                                        fit: BoxFit.contain)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 18, right: 18, bottom: 450),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 18),
                                        child: Text(
                                          'Spots',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: "Raleway"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Watch the best live coverage of your favourite sports: Football, Golf, Rugby, Cricket, F1, Boxing, NFL, NBA, plus the latest sports news, transfers & scores.',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway"),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.65,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: Column(
                                children: [
                                  ClipPath(
                                    clipper: wave,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.35,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              (selectedindexpage == 0)
                                                  ? SizedBox(
                                                      width: 120,
                                                    )
                                                  : Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 35),
                                                      child: Gradintbt(
                                                          roundedRadius: 30.0,
                                                          btncolor:
                                                              Colors.orange,
                                                          btntext: 'Previous',
                                                          textcolor:
                                                              Colors.white,
                                                          textfont: 16.0,
                                                          w: 100.0,
                                                          h: 40.0,
                                                          Do: () {
                                                            if (selectedindexpage <=
                                                                0) {
                                                              setState(() {
                                                                selectedindexpage =
                                                                    0;
                                                              });
                                                            }
                                                            Future.delayed(
                                                                Duration(
                                                                    milliseconds:
                                                                        400),
                                                                () {
                                                              if (selectedindexpage %
                                                                      2 ==
                                                                  0) {
                                                                setState(() {
                                                                  wave = WaveClipperOne(
                                                                      flip:
                                                                          false,
                                                                      reverse:
                                                                          true);
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  wave = WaveClipperOne(
                                                                      flip:
                                                                          true,
                                                                      reverse:
                                                                          true);
                                                                });
                                                              }
                                                              if (selectedindexpage <=
                                                                  0) {
                                                                setState(() {
                                                                  selectedindexpage =
                                                                      0;
                                                                });
                                                              }
                                                              final TabController
                                                                  controller =
                                                                  DefaultTabController
                                                                      .of(context);
                                                              if (!controller
                                                                      .indexIsChanging &&
                                                                  controller
                                                                          .index !=
                                                                      0) {
                                                                controller.animateTo(
                                                                    controller
                                                                            .index -
                                                                        1);
                                                                print(controller
                                                                    .index);
                                                                selectedindexpage--;
                                                              }
                                                            });
                                                          }),
                                                    ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 35),
                                                child: Gradintbt(
                                                    roundedRadius: 30.0,
                                                    btncolor: Colors.orange,
                                                    btntext: 'Next',
                                                    textcolor: Colors.white,
                                                    textfont: 16.0,
                                                    w: 100.0,
                                                    h: 40.0,
                                                    Do: () {
                                                      if (selectedindexpage <=
                                                          0) {
                                                        setState(() {
                                                          selectedindexpage = 0;
                                                        });
                                                      }
                                                      Future.delayed(
                                                          Duration(
                                                              milliseconds:
                                                                  400), () {
                                                        if (selectedindexpage %
                                                                2 ==
                                                            0) {
                                                          setState(() {
                                                            wave =
                                                                WaveClipperOne(
                                                                    flip: false,
                                                                    reverse:
                                                                        true);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            wave =
                                                                WaveClipperOne(
                                                                    flip: true,
                                                                    reverse:
                                                                        true);
                                                          });
                                                        }
                                                        final TabController
                                                            controller =
                                                            DefaultTabController
                                                                .of(context);
                                                        if (!controller
                                                                .indexIsChanging &&
                                                            controller.index !=
                                                                2) {
                                                          controller.animateTo(
                                                              controller.index +
                                                                  1);
                                                          print(
                                                              controller.index);
                                                          selectedindexpage++;
                                                        } else {}
                                                      });
                                                    }),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                          ),
                                          TabPageSelector(
                                            selectedColor:
                                                Color.fromRGBO(122, 53, 166, 0),
                                            color: Colors.orange,
                                          ),
                                          Expanded(
                                            child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                            context, '/states');
                                                  },
                                                  child: Text(
                                                    'Skip',
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "Raleway"),
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
