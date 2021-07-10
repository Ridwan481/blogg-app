import 'package:blog/home.dart';
import 'package:blog/news/setting.dart';
import 'package:blog/tabpage/popularNews.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailNewas extends StatelessWidget {
  final image;
  final title;
  final detail;

  const DetailNewas({Key key, this.image, this.title, this.detail});
  Widget container(Widget img) {
    if (img != null) {
      Container(
        height: 300,
        child: Image.network(
          image,
          fit: BoxFit.fitWidth,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                semanticsLabel: 'Loding',
                backgroundColor: Colors.grey,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },

          /////////////
        ),
      );
    } else {
      Container(
        height: 20,
        color: Colors.black54,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              height: 70,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/logo1.png',
                          height: 35,
                          width: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 5.8,
                      ),
                      Text(
                        'Stream News   ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Raleway',
                            fontSize: 15),
                      ),
                    ],
                  ),
                  Flexible(
                    child:
                        IconButton(icon: Icon(Icons.share), onPressed: () {}),
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              title.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 300.0,
            width: double.infinity,
            padding: new EdgeInsets.all(5.0),
            child: Image.network(
              image,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                    child: child,
                    period: Duration(
                        milliseconds: loadingProgress.expectedTotalBytes),
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.grey.shade400);
              },

              /////////////
            ),
          ),
          SizedBox(
            height: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              detail,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins'),
            ),
          ),
        ],
      ),
    );
  }
}
