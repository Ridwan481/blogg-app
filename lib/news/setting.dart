import 'package:blog/main.dart';
import 'package:blog/managet/search.dart';
import 'package:flutter/material.dart';

var textstyle = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textcolrs);

var textcolrs = Colors.black;
var scalffordcolor = Colors.white;
var inercolor = Colors.white.withOpacity(.9);
var linaergrand = LinearGradient(begin: Alignment.bottomRight, colors: [
  Colors.black12.withOpacity(.9),
  Colors.black54.withOpacity(.4),
  Colors.black54.withOpacity(.2),
]);
String themename = 'light';
bool ischange = false;
var drawercolor = Colors.white;
var drawerimage = 'assets/fuk.jpeg';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

List<bool> _selections = List.generate(2, (_) => false);

class _SettingState extends State<Setting> {
  void _sete(bool value) {
    setState(() {
      ischange = value;
      if (ischange == true) {
        drawercolor = Colors.orange[100];
        drawerimage = 'assets/try.jpeg';
        textcolrs = Colors.white;
        scalffordcolor = Colors.grey.shade900;
        themename = 'dark';
        inercolor = Colors.black;
        linaergrand = LinearGradient(begin: Alignment.bottomRight, colors: [
          Colors.white10.withOpacity(.9),
          Colors.black54.withOpacity(.4),
          Colors.black54.withOpacity(.4),
        ]);
      } else {
        textcolrs = Colors.black;
        scalffordcolor = Colors.grey.shade100;
        drawercolor = Colors.white;
        drawerimage = 'assets/fuk.jpeg';
        inercolor = Colors.white.withOpacity(.9);
        themename = 'light';
        linaergrand = LinearGradient(begin: Alignment.bottomRight, colors: [
          Colors.black12.withOpacity(.9),
          Colors.black54.withOpacity(.4),
          Colors.black54.withOpacity(.2),
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scalffordcolor,
      appBar: AppBar(
        backgroundColor: drawercolor,
        title: Text(
          'Setting',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            trailing: _turgull(),
            title: Text('ForntStyle',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: textcolrs)),
          ),
          Divider(),
          ListTile(
            title: Text(themename,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: textcolrs)),
            trailing: Switch(
              focusColor: textcolrs,
              hoverColor: textcolrs,
              splashRadius: 100.0,
              activeColor: textcolrs,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: ischange,
              onChanged: _sete,
            ),
          )
        ],
      ),
    );
  }

  _turgull() => ToggleButtons(
        borderColor: textcolrs,
        borderRadius: BorderRadius.circular(20),
        focusColor: Colors.transparent,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Icon(Icons.format_italic),
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Icon(Icons.format_bold),
            ),
          )
        ],
        isSelected: _selections,
        onPressed: (int index) {
          setState(() {
            _selections[index] = !_selections[index];
            if (index == 0 && _selections[index]) {
              textstyle = TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  color: textcolrs,
                  fontWeight: FontWeight.normal);
            } else if (index == 1 && _selections[index]) {
              textstyle = TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: textcolrs,
              );
            }
            if (index == 0 && _selections[index]) {
              textstyle = TextStyle(
                fontSize: 15,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: textcolrs,
              );
            } else {
              textstyle = TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: textcolrs);
            }
          });
        },
        color: Colors.orange,
        fillColor: textcolrs,
      );
}
