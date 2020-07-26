import 'package:flutter/material.dart';
class ShowAwerenessDepartment extends StatelessWidget {
  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('قسم التوعية',style: TextStyle(color: textColor, fontFamily: 'Cairo' ),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),

      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[

                Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  decoration: BoxDecoration(
                    border: Border.all(width:1,color:Colors.black12 ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      containerImage(context, 'images/awereness.png'),
                      SizedBox(height: 10,),
                      centerAddress('أسئلة واجابات'),

                      SizedBox(height: 10,),
                      containerDes(context,' هل تقضي مصابيح التعقيم بالأشعة فوق البنفسجية على فيروس كورونا المستجد ؟'),
                      containerImageForDes(context,'images/lamp.png'),
                      containerDes(context,'ينبغي عدم استخدام مصابيح الأشعة فوق البنفسجية لتعقيم اليدين أو أي أجزاء أخرى من الجسم .'),

                      SizedBox(height: 20,),
                      containerDes(context,'ما مدى فعالية الماسحات الضوئية الحرارية في اكتشاف الأشخاص المصابين بفيروس كورونا المستجد ؟'),
                      containerImageForDes(context,'images/outbreak.png'),
                      containerDes(context,'تعد الماسحات الضوئية فعالة في الكشف عن الأشخاص الذين أصيبوا بالحمى ( أي ارتفاع درجة حرارة الجسم عن المعتاد ) بسبب الأصابة بفيروس كورونا الجديد . ومع ذلك , لا يمكن للماسحات الحرارية اكتشاف الأشخاص المصابين بالعدوى ولم يصابوا بعد بالحمى .'),

                      SizedBox(height: 20,),
                      containerDes(context,'هل ان الكحول والتعقيم يساعد في شفاء المصاب ؟'),
                      containerImageForDes(context,'images/chlorine.png'),
                      containerDes(context,'بالتأكيد لا , رش الجسم بالكحول أو الكلور لن يقضي على الفيروسات التي دخلت جسمك بالفعل . بل قد يكون ضاراً بالملابس أو الأغشية المخاطية ( كالعينين والفم ) .'),

                      SizedBox(height: 20,),
                      containerDes(context,'هل المضادات الحيوية فعالة في الوقاية من فيروس كورونا المستجد وعلاجه ؟'),
                      containerImageForDes(context,'images/Group346.png'),
                      containerDes(context,'	لا , لا تقضي المضادات الحيوية على الفيروسات , بل تقضي على الجراثيم فقط .'),

                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20,
                                height:20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/clock.png'),
                                    )
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text('July 1 , 2020',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),

                SizedBox(height: 40,),

                Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  decoration: BoxDecoration(
                    border: Border.all(width:1,color:Colors.black12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      containerImage(context, 'images/Group228.png'),
                      SizedBox(height: 10,),
                      centerAddress('تصيح مفاهيم خاطئة '),

                      SizedBox(height: 10,),
                      containerDes(context,'مفهوم مغلوط : البرد والثلج يمكن أن يقتلا فيروس كورونا .'),
                      containerImageForDes(context,'images/ice.png'),
                      containerDes(context,'حقيقة : البرد والثلج لا يمكن أن يقتل فيروس كورونا المستجد COVID-19 . '),

                      SizedBox(height: 20,),
                      containerDes(context,'مفهوم مغلوط : يمكن أن ينتقل فيروس كورونا المستجد ( COVID-19 ) عن طريق أشياء مثل العملات المعدنية والاوراق النقدية .'),
                      containerImageForDes(context,'images/Group344.png'),
                      containerDes(context,'حقيقة : إن خطر الأصابة بفيروس كورونا المستجد ( COVID-19 ) نتيجة ملامسة أشياء بما فيها العملات المعدنية أو الأوراق النقدية أو بطاقات الائتمان ضعيف للغاية .'),

                      SizedBox(height: 20,),
                      containerDes(context,'مفهوم مغلوط : يمكن للقطيرات التي يفرزها شخص ما عند السعال أو العطس أن تنقل فيروس كورونا المستجد ( COVID-19 ) لمسافة قد تصل إلى 8 أمتار . '),
                      containerImageForDes(context,"images/Don't touch eye.png"),
                      containerDes(context,'حقيقة : تصل قطيرات الجهاز التنفسي إلى متر واحد من الشخص الذي يسعل أو يعطس .'),


                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20,
                                height:20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/clock.png'),
                                    )
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text('July 1 , 2020',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),

                SizedBox(height: 40,),

                Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  decoration: BoxDecoration(
                    border: Border.all(width:1,color:Colors.black12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      containerImage(context, 'images/Group343.png'),
                      SizedBox(height: 10,),
                      centerAddress('ادامة الكمامة وكيفية استخدامها'),

                      SizedBox(height: 10,),
                      containerDes(context,'1-	ﻗﺒﻞ ﻟﻤﺲ اﻟﻜﻤﺎﻣﺔ، ﻧﻈﻒ ﻳﺪﻳﻚ ﺑﻔﺮﻛﻬﻤﺎ ﺑﻤﻄﻬﺮ ﻛﺤﻮﱄ أو ﺑﻐﺴﻠﻬﻤﺎ ﺑﺎﻟﻤﺎء واﻟﺼﺎﺑﻮن .'),


                      SizedBox(height: 10,),
                      containerDes(context,'2-	ﺗﻔﻘﺪ اﻟﻜﻤﺎﻣﺔ وﺗﺄﻛﺪ ﻣﻦ ﺧﻠﻮﻫﺎ ﻣﻦ اﻟﺸﻘﻮق واﻟﺜﻘﻮب .'),

                      SizedBox(height: 10,),
                      containerDes(context,'تجنب ملامسة العين والوجة قبل التأكد من تطهير اليدين بالماء والصابون أو المواد المطهرة . '),

                      SizedBox(height: 10,),
                      containerDes(context,'3-	حدد الطرف العلوي من الكمامة (موضع الشريط المعدني ) .'),

                      SizedBox(height: 10,),
                      containerDes(context,'تفادي أي ملامسة جسدية عندما تحي الأخرين . وتشمل التحيات المأمونة التلويح والأيماء والانحناء .'),

                      SizedBox(height: 10,),
                      containerDes(context,'4-	اﻟﻜﻤﺎﻣﺔ إﱃ اﻟﺨﺎرج (الجهة الملونة ) .'),

                      SizedBox(height: 10,),
                      containerDes(context,'5-	ضع الكمامة على وجهك . اضغط  على الشريط المعدني أو الطرف المقوي للكمامة ليتخذ شكل أنفك .'),

                      SizedBox(height: 10,),
                      containerDes(context,'6-	اسحب الجزء السفلي من الكمامة لتغطي فمك وذقنك . '),

                      SizedBox(height: 10,),
                      containerDes(context,'7-	ﻻ ﺗﻠﻤﺲ اﻟﻜﻤﺎﻣﺔ ﻣﺎ دﻣﺖ ﺗﺮﺗﺪﻳﻬﺎ ﻟﻠﺤﻤﺎﻳﺔ .'),

                      SizedBox(height: 10,),
                      containerDes(context,'8-	بعد الاستخدام , اخلع الكمامة بنزع الشريط المطاطي من خلف الأذنين مع الحرص على إبعادها عن وجهك وملابسك لتجنب ملامسة أجزاء الكمامة التي يحتمل أن تكون ملوثة .'),

                      SizedBox(height: 10,),
                      containerDes(context,'9-	تخلص من الكمامة المستعملة على الفور برميها في سلة مهملات مغلقة . لا تستخدم الكمامة المستعملة مرى أخرى .'),

                      SizedBox(height: 10,),
                      containerDes(context,'10-	نظف يديك بعد ملامسة الكمامة أو رميها , إما بفركهما بمطهر كحولي أو بغسلهما بالماء والصابون إذا كانتا متسختين بوضوح .'),

                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20,
                                height:20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/clock.png'),
                                    )
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text('July 1 , 2020',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget containerImage(BuildContext context , String imagePath){
    return Container(
      width: MediaQuery.of(context).size.width *0.8 ,
      height: MediaQuery.of(context).size.width *0.8 ,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
          )
      ),
    );
  }

  Widget centerAddress(String address){
    return Center(
      child: Text(
        address,
        style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600 , fontFamily: 'Cairo' ),

      ),
    );
  }
  Widget containerDes(BuildContext context ,String des){
    return Container(
      width:MediaQuery.of(context).size.width *0.75,
      child: Text(
        des,
        style: TextStyle(fontSize: 18.0, fontFamily: 'Cairo'),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,

      ),
    );
  }
  Widget containerImageForDes(BuildContext context , String imagePath){
    return Container(
      width: MediaQuery.of(context).size.width *0.25 ,
      height: MediaQuery.of(context).size.width *0.25 ,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
          )
      ),
    );
  }
}
