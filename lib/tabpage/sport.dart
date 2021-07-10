import 'package:blog/main.dart';
import 'package:blog/news/setting.dart';
import 'package:blog/news/sportDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sport extends StatefulWidget {
  @override
  _SportState createState() => _SportState();
}

class _SportState extends State<Sport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scalffordcolor,
        body: Container(
            child: ListView(
          children: [
            _secondNews(
                'c.Ronalndo  as scored over 700 goals in juventos and he is still wish to continue',
                'assets/l.jpeg',
                'assets/just.jpeg',
                'assets/jo.jpeg',
                'c.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continue',
                'c.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continue'),
            _secondNews(
                'c.Ronalndo  as scored over 700 goals in juventos and he is still wish to continue',
                'assets/fuk.jpeg',
                'assets/download.jpeg',
                'assets/b.jpeg',
                'c.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuec.Ronalndo  as scored over 700 goals in juventos and he is still wish to continue',
                'c.Ronalndo  as scored over 700 goals in juventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continuejuventos and he is still wish to continue juventos and he is still wish to continue')
          ],
        )));
  }

  _secondNews(String title, String image, String image1, String imge3,
          String club1, String subtitle) =>
      GestureDetector(
        onTap: () {
          Get.to(() => SportDetail(
                title: title,
                detail: club1,
                image1: image,
                image2: image1,
                image3: imge3,
                subtitle: subtitle,
              ));
        },
        child: Container(
          margin: EdgeInsets.all(8),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Container(
                        child: Image.asset(
                          image,
                          height: 150,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Image.asset(
                          imge3,
                          height: 150,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Image.asset(
                          image1,
                          fit: BoxFit.cover,
                          height: 150,
                          width: 130,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  child: Text(
                    club1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
