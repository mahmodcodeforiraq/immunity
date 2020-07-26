import 'package:flutter/material.dart';
class AboutApplication extends StatelessWidget {
  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'عن التطبيق',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),

      body: Stack(
        children: <Widget>[
          Transform.translate(offset: Offset(0,5),
         child: Align(
           alignment: Alignment.bottomCenter,
           child: Container(
             width: MediaQuery.of(context).size.width ,
             height: MediaQuery.of(context).size.width * 0.9,
             decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage('images/app.png'),
                   fit: BoxFit.none
               ),
             ),
           ),
         ),
          ),
         Align(
           alignment: Alignment.topCenter,
           child: Container(
               width: MediaQuery.of(context).size.width * 0.80,
               child:  Center(

                 child: ListView(
                   children: <Widget>[
                     SizedBox(
                       height: 10,
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width * 0.80,
                       decoration: BoxDecoration(
                           border: Border.all(color: Colors.black12),
                           color: Colors.white
                       ),
                       child: Column(
                         children: <Widget>[
                           SizedBox(
                             height: 20,
                           ),
                           Container(
                             width: MediaQuery.of(context).size.width * 0.85,
                             height:150,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: AssetImage('images/aboutApplication.png'), fit: BoxFit.none),
                             ),
                           ),
                           SizedBox(
                             height: 45,
                           ),
                           Text('عن التطبيق',style: TextStyle(fontSize: 24,),),
                           SizedBox(
                             height: 20,
                           ),
                           Container(
                             margin: EdgeInsets.all(10),
                             width: MediaQuery.of(context).size.width * 0.80,
                             child: Directionality(
                               textDirection: TextDirection.rtl,
                               child: Text(
                                 'في ضل الضروف التي يشهدها العالم من تفشي فيروس كورونا ونحن كمطورين يجب ان يكون لنا بصمه للحد من انتشار هذا الفيروس من خلال التكنلوجي المتوفره لدينا ان نقوم ببناء تطبيق موبايل نشرح في كل الطرق المتوفره للتقليل من انتشار الفيروس لذلك سيكون هذا التطبيق هو ارشادي وتوعوي في نفس الوقت وذلك من خلال اعطاء بعض النصائح والارشادات للاشخاص عن طريق هذا التطبيق .',
                                 style: TextStyle(color: Colors.black, fontSize: 18),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 30,
                           ),
                         ],
                       ),
                     ),
                     SizedBox(
                       height: 40,
                     ),
                   ],
                 ),
               )
           ),
         ),


        ],
      ),


    );
  }
}
