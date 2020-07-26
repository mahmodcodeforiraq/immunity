import 'package:flutter/material.dart';
class ShowCoronaBenefitsDepartment extends StatelessWidget {
  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('فوائد كورونا',style: TextStyle(color: textColor, fontFamily: 'Cairo' ),),
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
                      containerImage(context, 'images/coronaBenefits.png'),
                      SizedBox(height: 10,),
                      centerAddress('وضع العالم بعد كورونا'),

                      SizedBox(height: 10,),
                      containerDes(context,"احد اكثر المواضيع جدلاً وهو وضع العالم بعد جائحة كورونا , كلنا نعلم اني هذه الأزمة غيرت الكثير من الكوازين في العالم سواء كان من ناحية الطبية أو من ناحية الشركات العملاقة والوسطى وغيرها . هناك احتمالين لهذا السؤال "),
                      containerDes(context,'الاحتمال الأول سوف ينقسم العالم نصفين النصف الأول سوف يبدأ يخصص ميزانيات مالية هائلة للأبحاث الطبية للاستعداد لمواجهة أي فيروس جديد والاحتمال الثاني ان النصف الثاني من العالم لن يبالي ابداً ويستمر على منهاجيته تطوير أسلحة الحرب وينتظر من النصف الاخير من العالم ان ينقذه في حال ظهور وباء جديد .'),
                      containerDes(context,'والاحتمال الثاني ان النصف الثاني من العالم لن يبالي ابداً ويستمر على منهاجيته تطوير أسلحة الحرب وينتظر من النصف الاخير من العالم ان ينقذه في حال ظهور وباء جديد .'),
                      containerDes(context,'والاحتمال الثاني ان النصف الثاني من العالم لن يبالي ابداً ويستمر على منهاجيته تطوير أسلحة الحرب وينتظر من النصف الاخير من العالم ان ينقذه في حال ظهور وباء جديد .'),



                      SizedBox(height: 10,),

                      SizedBox(height: 10,),
                    ],
                  ),
                ),

                SizedBox(height: 40,),

                Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  decoration: BoxDecoration(
                    border: Border.all(width:1,color:Colors.black12 ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      containerImage(context, 'images/Group284.png'),
                      SizedBox(height: 10,),
                      centerAddress('وضع الأرض من جائحة كورونا'),

                      SizedBox(height: 10,),
                      containerDes(context,"خلال فترة الحجر الصحي والحظر الشامل الذي شهدتة اغلب دول العالم مما تسبب في إيقاف المصانع والمعامل وغيرها من الفروع الأنتاجية وشبه إيقاغ لحركة المركبات . "),
                      containerDes(context,'كل هذا ساهم في تعافي الأرض من كثير من الأمور واستعادة نشاطها واهمها هو انغلاق فجوه الغلاف الجوي في طبقة الأوزون التي كانت تهدد وبشكل كبير على المناخ والتغير المناخي وذوبان الجليد في القطب الشمالي الذي يعد المصدر الرئيسي للمياة العذبة . '),
                      containerDes(context,'مدينة البندقية التي شهدت مياها صفاء تام وعودة حياة فيها حيث لم تكن بذلك النقاء منذ اكثر من 60 عام وغيرها الكثير .'),




                      SizedBox(height: 10,),

                      SizedBox(height: 10,),
                    ],
                  ),
                ),

                SizedBox(height: 40,),

                Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  decoration: BoxDecoration(
                    border: Border.all(width:1,color:Colors.black12 ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      containerImage(context, 'images/Group285.png'),
                      SizedBox(height: 10,),
                      centerAddress('فوائد الحجر المنزلي'),

                      SizedBox(height: 10,),
                      containerDes(context,"خلال فترة الحجر الصحي يمكن للشخص ان يقوم بأعمال رائعة ويكتشف موهبة او هواية جميلة ويمارس تعلم لغة جديدة , قراءة الكتب وغيرها الكثير , انه انسب وقت للتعلم او الأستفادة من فترة الحجر الصحي والعطلة الطويلة ."),
                      containerDes(context,"هنالك اشخاص كثر اكتسبوا شيئاً من العلم ونظموا امورهم واوقاتهم لكن هناك اهمال لهذه الفرصة من قبل اشخاص اخرين وهذا من اكبر الاخطاء ."),

                      SizedBox(height: 10,),

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
        style: TextStyle(fontSize: 16.0, fontFamily: 'Cairo'),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,

      ),
    );
  }

}
