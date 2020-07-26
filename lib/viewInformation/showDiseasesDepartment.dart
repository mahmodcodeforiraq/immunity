
import 'package:flutter/material.dart';
class ShowDiseasesDepartment extends StatelessWidget {
  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('قسم الامراض',style: TextStyle(color: textColor, fontFamily: 'Cairo' ),),
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
                      containerImage(context, 'images/departmentOfDiseases.png'),
                      SizedBox(height: 10,),
                      centerAddress('الأرتباط مع كورونا'),

                      SizedBox(height: 10,),
                      containerDes(context,"هناك العديد من الامراض التي ترتبط مع كورونا منها مزمنة والغير مزمنة لك ."),
                      containerDes(context,'ماذا عن الامراض المعدية التي تجعل من حياة الشخص على المحك قد تؤدي الى وفاته '),
                      containerDes(context,'من هذه الامراض هي الملاريا او حمى الضنك المنتشرة في افريقيا بشكل شبه كبير فمن المطلوب اذا كانت لديك هذه الامراض وتصاب بعدها بفايروس كوفيد -19 توجه لأقرب مركز صحي '),
                      containerDes(context,'هناك بعض الامراض التي تشابه كورونا في الاعراض منها الانفلونزا وبعض الامراض الأخرى . اذا كانت لديك اعراض احجر نفسك بالبيت ولكن في حالة تضاعفت الاعراض توجه لأقرب مركز صحي .'),



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
