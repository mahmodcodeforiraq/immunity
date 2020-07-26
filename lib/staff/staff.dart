import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Staff extends StatelessWidget {
  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'فريق العمل',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),

      body: ListView(
        children: <Widget>[
         Container(
           decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage('images/staff11.png'), fit: BoxFit.cover),
           ),
           child: Align(
                     alignment: Alignment.topCenter,

                     child: Column(
                         children: <Widget>[
                           Container(
                             width: MediaQuery.of(context).size.width * 0.80,
                             child:  Center(

                               child: Container(
                                 width: MediaQuery.of(context).size.width * 0.80,
                                 decoration: BoxDecoration(
                                     border: Border.all(color: Colors.black12),
                                     color: Colors.white
                                 ),
                                 child: Column(
                                   children: <Widget>[
                                     SizedBox(
                                       height: 10,
                                     ),
                                     Container(
                                       width: MediaQuery.of(context).size.width * 0.85,
                                       height: 150,
                                       decoration: BoxDecoration(
                                         image: DecorationImage(
                                             image: AssetImage('images/staff3.png'), fit: BoxFit.none),
                                       ),
                                     ),
                                     SizedBox(
                                       height: 45,
                                     ),
                                     Text('فريق العمل',style: TextStyle(fontSize: 24,),),
                                     SizedBox(
                                       height: 20,
                                     ),
                                     containerMaleStaff(context,'المتطلبات', 'حسن احمد محمد'),
                                     containerFemaleStaff(context, 'الخوارزمية', 'زبيدة سليم ابراهيم'),
                                     containerMaleStaff(context,'التصميم', 'وليد خالد خليفه'),
                                     containerFemaleStaff(context, 'قاعدة البيانات', 'عهد زهير بدري'),
                                     containerMaleStaff(context,'جمع وأدخال البيانات', 'عبد العزيز خالد خليفه'),
                                     containerMaleStaff(context,'الفرونت اند', 'احمد ياسين محمد'),
                                     containerMaleStaff(context,'الباك اند', 'محمود نوري محمود'),
                                     SizedBox(
                                       height: 30,
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 30,
                           ),
                         ]
                     )

                 ),

         ),
        ],
      ),



      );



  }
  Widget containerMaleStaff(BuildContext context,String position,String name){
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.80,

      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/maleStaff.png'), fit: BoxFit.none),
            ),
          ),
          Expanded(child: SizedBox(width: 2,),),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('$position',style: TextStyle(fontSize: 18),),
                Text('$name',style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
          Expanded(child: SizedBox(width: 2,),),
        ],
      ) ,
    );
  }
  Widget containerFemaleStaff(BuildContext context,String position,String name){
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.80,

      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/femaleStaff.png'), fit: BoxFit.none),
            ),
          ),
          Expanded(child: SizedBox(width: 2,),),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('$position',style: TextStyle(fontSize: 18),),
                Text('$name',style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
          Expanded(child: SizedBox(width: 2,),),
        ],
      ) ,
    );
  }
}
