import 'package:flutter/material.dart';
class AboutInitiative extends StatelessWidget {
  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'عن المبادرة',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),

      body: Stack(
        children: <Widget>[
          Transform.translate(offset: Offset(0,4),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Initiative.png'),
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
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/aboutInitiative.png'), fit: BoxFit.none),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('عن المبادرة',style: TextStyle(fontSize: 24,),),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                width:MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.only(right: 10),

                                child:  Directionality(
                                  textDirection: TextDirection.rtl,
                                  child:  Text(
                                    'مبادرة Code for Iraq هي مبادرة إنسانية غير ربحية تهدف إلى خدمة المجتمع باستخدام التكنولوجيا، تعتبر "Code For IRAQ" مبادرة تعليمية حقيقية ترعى المهتمين بتعلم تصميم وبرمجة تطبيقات الهاتف الجوّال ومواقع الأنترنت وبرامج الحاسوب والشبكات والاتصالات ونظم تشغيل الحاسوب باستخدام التقنيات مفتوحة المصدر Open Source، كما توفر لهم جميع الدروس التعليمية اللازمة وبشكل مجاني تماماً.',
                                    style: TextStyle(color: Colors.black, fontSize: 18),
                                  ),

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
