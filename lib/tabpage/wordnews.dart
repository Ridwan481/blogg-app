import 'package:blog/news/setting.dart';
import 'package:flutter/material.dart';
import 'package:blog/tabpage/popularNews.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scalffordcolor,
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        shrinkWrap: true,
        children: [
          secondNews(
            'assets/s3.jpeg',
            'technical delivery systems of All Football’s providers Americal president',
            'technical delivery systems of All Football’s providers Americal president',
          ),
          secondNews(
            'assets/s3.jpeg',
            'technical delivery systems of All Football’s providers Americal president',
            'technical delivery systems of All Football’s providers Americal president',
          ),
          secondNews(
            'assets/s3.jpeg',
            'technical delivery systems of All Football’s providers Americal president',
            'technical delivery systems of All Football’s providers Americal president',
          ),
          secondNews(
            'assets/s3.jpeg',
            'technical delivery systems of All Football’s providers Americal president',
            'technical delivery systems of All Football’s providers Americal president',
          ),
          secondNews(
            'assets/s3.jpeg',
            'technical delivery systems of All Football’s providers Americal president',
            'technical delivery systems of All Football’s providers Americal president',
          )
        ],
      ),
    );
  }

  // _secondNews(String image1,String title,String detail)=>Padding(padding:EdgeInsets.only(left: 10,right: 10,bottom: 30),

  //    child: Flexible(child:Material(
  //       elevation: 8.0,
  //       borderRadius: BorderRadius.circular(10),
  //       child: Container(
  //         height: 150,
  //         decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         ),
  //         child: Row(
  //             children: [
  //               Image.asset(image1,height: 150,width: MediaQuery.of(context).size.width/2-10, fit: BoxFit.fill,),
  //               Flexible(child:Padding(
  //                 padding: const EdgeInsets.only(left: 15,),
  //                 child: Column(
  //                 children: [
  //                 Text(title,style: TextStyle(
  //                  fontSize: 14,
  //                  fontWeight: FontWeight.w900,
  //                  color: Colors.black,
  //                  fontFamily: 'Montserrat'
  //                    ),),
  //                   Text(detail,style: TextStyle(
  //                      fontSize: 12,
  //                      fontWeight: FontWeight.w600,
  //                      color: Colors.grey,
  //                      fontFamily: 'Montserrat'
  //                  ),),
  //                   SizedBox(height:7 ,),
  //                  Flexible(
  //                    child: SingleChildScrollView(
  //                      scrollDirection: Axis.horizontal,
  //                                             child: Row(
  //                        mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                      children: [
  //                        Container(
  //                          height: 30,
  //                          width: 30,
  //                            decoration: BoxDecoration(
  //                              color: Colors.grey,
  //                              image: DecorationImage(image: AssetImage('assets/logo1.png'),fit: BoxFit.contain),
  //                              shape: BoxShape.circle
  //                            ),
  //                        ),
  //                        SizedBox(width: 5,),
  //                        Column(
  //                          mainAxisAlignment: MainAxisAlignment.center,
  //                          crossAxisAlignment: CrossAxisAlignment.start,
  //                          children: [
  //                 Text('Stream News',style: TextStyle(
  //                           fontWeight: FontWeight.w700,
  //                           color: Colors.redAccent,
  //                           fontSize: 12,
  //                           wordSpacing: 3
  //                 ),),
  //                        Text('12.30 AM',style: TextStyle(
  //                           fontWeight: FontWeight.w700,

  //                           fontSize: 10,
  //                           wordSpacing: 3
  //                 ),),
  //                          ],
  //                        ),
  //                        SizedBox(width: 0,),
  //                        IconButton(icon: Icon(Icons.share,color: Colors.black,size: 20,), onPressed: (){
  //                         //  Navigator.of(context).push(MaterialPageRoute(builder: (cnt)=>Newdetail()));
  //                        })
  //                      ],
  //                        ),
  //                    ),
  //                  )
  //                 ],
  //                   ),
  //               )
  //               )
  //             ],
  //         ),
  //       ),
  //    ) ),

  //  );
}
