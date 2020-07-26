
import 'package:flutter/material.dart';
class ShowGuidanceDepartment extends StatelessWidget {
  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('قسم الأرشاد',style: TextStyle(color: textColor ),),
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
                      containerImage(context, 'images/guidance.png'),
                      SizedBox(height: 10,),
                      centerAddress('الوقاية من كوفيد-19'),

                      SizedBox(height: 10,),
                      containerDes(context,'واظب على تنظيف يديك , استخدم الماء والصابون أو محلول كحولي لتعقيم اليدين .'),
                      containerImageForDes(context,'images/cleaningHands.png'),

                      SizedBox(height: 10,),
                      containerDes(context,'ابتعد مسافة امنة عن أي شخص يسعل أو يعطس.'),
                      containerImageForDes(context,'images/Corona Virus Symptoms Cough.png'),

                      SizedBox(height: 10,),
                      containerDes(context,'لا تلمس عينيك أو أنفك أو فمك . احرص على تغطية فمك وأنفك بثني المرفق أو بمنديل ورقي عند السعال أو العطس .'),
                      containerImageForDes(context,'images/hand.png'),

                      SizedBox(height: 10,),
                      containerDes(context,'إلزم المنزل إذا شعرت بالمرض . إذا كنت مصاباً بالحمى والسعال وصعوبة التنفس , التمس الرعاية الطبية واتصل بمرفق الرعاية قبل أن تذهب .'),
                      containerImageForDes(context,'images/Group 137.png'),
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
                      containerImage(context, 'images/Group136.png'),
                      SizedBox(height: 10,),
                      centerAddress('الوقاية من العدوى'),

                      SizedBox(height: 10,),
                      containerDes(context,'تجنب الذهاب الى الأماكن العامة والمزدحمة المليئة بالاشخاص .'),
                      containerImageForDes(context,'images/coronavirus (6).png'),

                      SizedBox(height: 10,),
                      containerDes(context,'تجنب الزيارات العائلية والاجتماعية مع الاصدقاء في الوقت الراهن .'),
                      containerImageForDes(context,'images/No Group Gathering.png'),

                      SizedBox(height: 10,),
                      containerDes(context,'تجنب ملامسة العين والوجة قبل التأكد من تطهير اليدين بالماء والصابون أو المواد المطهرة . '),
                      containerImageForDes(context,"images/Don't touch eye.png"),

                      SizedBox(height: 10,),
                      containerDes(context,'الحرص على ارتداء قفازات اليدين الطبية والكمامة قبل الخروج من المنزل ويكون الخروج للضرورة القصوى فقط .'),
                      containerImageForDes(context,'images/Group 341.png'),
                      SizedBox(height: 10,),

                      containerDes(context,'عدم استعمال الأدوات في الأماكن العامة مثل عربات التسويق وغيرها حيث نسبة وجود المرض على سطوحها عالي جداً .'),
                      containerImageForDes(context,'images/Group 171.png'),
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
                      containerImage(context, 'images/Group64.png'),
                      SizedBox(height: 10,),
                      centerAddress('الوسائل المتاحة لأنتشار المرض'),

                      SizedBox(height: 10,),
                      containerDes(context,'وينتشر المرض بشكل أساسي من شخص ألى شخص عن طريق القطيرات الصغيرة التي يفرزها الشخص المصاب بكوفيد-19 من أنفه أو فمه عندما يسعل أو يعطس أو يتكلم .'),
                      containerImageForDes(context,'images/Group 342.png'),

                      SizedBox(height: 10,),
                      containerDes(context,'سقوط قطيرات من الشخص المصاب على الاسطح مثل الطاولات ومقابض الأبواب ويمكن حينها أن يصاب الناس بالعدوى عند ملامستها .'),
                      containerImageForDes(context,'images/Group 344.png'),

                      SizedBox(height: 10,),
                      containerDes(context,'تجنب ملامسة العين والوجة قبل التأكد من تطهير اليدين بالماء والصابون أو المواد المطهرة . '),
                      containerImageForDes(context,"images/Don't touch eye.png"),

                      SizedBox(height: 10,),


                      containerDes(context,'تفادي أي ملامسة جسدية عندما تحي الأخرين . وتشمل التحيات المأمونة التلويح والأيماء والانحناء .'),
                      containerImageForDes(context,'images/No Touching.png'),
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
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),

      ),
    );
  }
  Widget containerDes(BuildContext context ,String des){
    return Container(
      width:MediaQuery.of(context).size.width *0.75,
      child: Text(
        des,
        style: TextStyle(fontSize: 18.0),
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
