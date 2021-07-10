
import 'package:blog/news/setting.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

   final _emalcontroller = TextEditingController();
 final FirebaseAuth _auth = FirebaseAuth.instance;
 String _error;
 String _newError;
 final _formkey = GlobalKey<FormState>();

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
             child: Column(
               children: [
                 showerror(),
                 Container(
                   height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(image:AssetImage('assets/anime.gif'),fit: BoxFit.cover )
                    ),
                      
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('You are come to right place', style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange[300],
                        fontWeight: FontWeight.bold,
                       
                      ),),
                    ),
                 ),


                 SizedBox(height: 30,),
                  Stack(
                    children: [
                          Material(
             
                     child: Container(
                         height: 300,
                         child: Form(
                           key: _formkey,
                                child: SingleChildScrollView(
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 10,right: 10),
                                 child: Column(
                                 children: [
                                    TextFormField(
                                  style: TextStyle(
                             fontSize: 17,
                      
                             fontWeight: FontWeight.w700,
                             fontFamily: "Montserrat"
                     ), 
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      
                                      borderRadius:  BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                            style: BorderStyle.none
                                      ),
                                      
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      
                                      borderRadius:  BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                         style: BorderStyle.none
                                      ),
                                    ),
                                    fillColor: Colors.orange[233],
                                    filled: true,
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                             fontSize: 17,
                        
                             fontWeight: FontWeight.w700,
                             fontFamily: "Raleway"
                                   ),
                                    suffixIcon: Icon(Icons.email)
                                  ),
                             
                             
                              
                                   controller: _emalcontroller,
                                     validator: (validat){
                             if(validat.isEmpty){
                                   return 'please Enter Your Email';
                             }else{
                                 bool emailvalid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(validat);
                                 if (!emailvalid ){
                                   setState((){
                                     _newError = 'Email not valid';
                                   });
                                 }else{
                                         Navigator.pop(context);
                                 }
                             }
                       },
                              ),
                              SizedBox(height: 10,),
                                      GestureDetector  (

                                             onTap: verify,
                                            child: Container(
                                            height: 55,
                                             decoration: BoxDecoration(
                                                color:drawercolor,
                                               borderRadius: BorderRadiusDirectional.circular(20)
                                             ),
                                             child: Center(
                                               child:  Text('Verify',style: TextStyle(
                                       fontSize: 25,
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       fontFamily: "Raleway"
                                   ),),
                                             ),
                                          ),
                                        ),

                                      SizedBox(height: 10,),
                                      Align(
                                        alignment: Alignment.topLeft,
                                           child: Text('Guide:',style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.w900
                                        ),),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                           child: Text('by click verify you will receve message in your Email for completed reset ',style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Raleway",
                                          
                                          color: Colors.grey
                                        ),),
                                      )
                                 ],
                             ),
                               ),
                           ),
                         ),
                     ),
                 ),
               Padding(
                 padding: const EdgeInsets.only(right: 40,top:5),
                 child: Align(
                  alignment: Alignment.centerRight,
                     child: 
                             showerrors())
               )
                    ],
                  )
               ],
             ),
        ),
    );
  }
  
 verify()async{
   var form = _formkey.currentState;
   if(form.validate()){
     form.save();
     try {
        _auth.sendPasswordResetEmail(email: _emalcontroller.text.toString().trim());
  
     } catch (e) {
       setState(() {
       _error = e.message;
       });
     }
   }
 }
 
 showerror(){
    if(_error !=null){
      return SafeArea(
              child: Container(
          color: Colors.red,
        
          child: Row(
             children: [
               Icon(Icons.error),
               SizedBox(width: 10,),
                Flexible(child: Text(_error,style: TextStyle(
                  fontFamily: 'Montserrat',
                   fontWeight: FontWeight.bold
                ),)),
                SizedBox(width: 20,),
                IconButton(icon: Icon(Icons.close), onPressed: (){
                      setState(() {
                        _error = null;
                      });
                })
             ],
          ),
        ),
      );
    }else{
      return SizedBox(height: 0,);
    }
  }
  
 showerrors(){
    if(_newError !=null){
      return Container(
             width: 190,
        decoration: BoxDecoration(
             color: Colors.red,
             shape: BoxShape.rectangle,
             borderRadius: BorderRadiusDirectional.circular(30)
        ),
     
      
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
             children: [
           
               SizedBox(width: 10,),
                Flexible(child: Text(_newError,style: TextStyle(
                  fontFamily: 'Montserrat',
                   fontWeight: FontWeight.bold
                ),)),
                SizedBox(width: 20,),
                IconButton(icon: Icon(Icons.close), onPressed: (){
                      setState(() {
                        _newError = null;
                      });
                })
             ],
          ),
        ),
      );
    }else{
      return SizedBox(height: 0,);
    }
  }
}

