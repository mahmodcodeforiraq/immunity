import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/department/departmentControl.dart';
import 'package:Immunity_Box/viewInformation/AllPageOfSeccesss.dart';
import 'package:Immunity_Box/viewInformation/AllPageOfTecnology.dart';
import 'package:Immunity_Box/viewInformation/EditUserPosts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Immunity_Box/settingsAccount/settingsAccount.dart';

class Department extends StatefulWidget {
  bool logedin;
  NormalUser normalUser;


  Department(this.normalUser,this.logedin);

  @override
  _DepartmentState createState() => _DepartmentState();
}


FirebaseAuth myAuth = FirebaseAuth.instance;


String _name;
String _id;
String _email;
String _password;
String _type;





class _DepartmentState extends State<Department> {



  Color textColor = Color(0xff5B7FFF);


  DepartmentControl _departmentControl = new DepartmentControl();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'حقيبة المناعة',
            style: TextStyle(color: textColor , fontFamily: 'Cairo'),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: textColor),
        ),
        drawer: widget.logedin == true ?Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height:70),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.person,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('اعدادات الحساب',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.of(context).push( MaterialPageRoute(builder: (context) {


                              return SettingsAccount(widget.normalUser.name,widget.normalUser.password,
                                  widget.normalUser.email,widget.normalUser.id,widget.normalUser.type);

                            })

                            );

                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.assignment,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('تعديل منشوراتي',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.of(context).push( MaterialPageRoute(builder: (context) {


                              return EditUserPosts(NormalUser(_id,_name,_email,_password,_type));

                            })
                            );
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.local_offer,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('عن التطبيق',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.popAndPushNamed(context, '/aboutApplication');
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child:Row(
                            children: <Widget>[
                              Icon(Icons.flag,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('عن المبادرة',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.popAndPushNamed(context, '/aboutInitiative');
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child:Row(
                            children: <Widget>[
                              Icon(Icons.group,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('فريق العمل',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.popAndPushNamed(context, '/staff');
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),

            ],
          ),
        ):
        Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height:70),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.person,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('تسجيل الدخول',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.popAndPushNamed(context, '/signin');
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),

              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.person,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('انشاء حساب',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.popAndPushNamed(context, '/signUP');
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.local_offer,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('عن التطبيق',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.popAndPushNamed(context, '/aboutApplication');
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child:Row(
                            children: <Widget>[
                              Icon(Icons.flag,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('عن المبادرة',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.popAndPushNamed(context, '/aboutInitiative');
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Container(
                      width:MediaQuery.of(context).size.width *0.8 ,
                      child:GestureDetector(
                          child:Row(
                            children: <Widget>[
                              Icon(Icons.group,size: 20,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text('فريق العمل',style: TextStyle(color:textColor,fontSize: 20 ),),
                            ],
                          ),
                          onTap:(){
                            Navigator.popAndPushNamed(context, '/staff');
                          }
                      )
                  ),
                ),
              ),
              Divider(color: Colors.grey,),

            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: 30,
                  ),
                  containerForDepaetments(
                      context,
                      _departmentControl.names['guidance'],
                      _departmentControl.description['guidance'],
                      _departmentControl.iamges['guidance'],
                      _departmentControl.routeName['guidance']),
                  SizedBox(
                    height: 30,
                  ),
                  containerForDepaetments(
                      context,
                      _departmentControl.names['awereness'],
                      _departmentControl.description['awereness'],
                      _departmentControl.iamges['awereness'],
                      _departmentControl.routeName['awereness']
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  new FlatButton(
                      onPressed: (){
                        Navigator.of(context).push( MaterialPageRoute(builder: (context) {


                          return AllPageOfTecnology(widget.normalUser);

                        }),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),topRight: Radius.circular(10))
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 200,
                              height:200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/technology.png')),
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width ,
                              height: 45,
                              alignment: Alignment.center,

                              child:Text(
                                'قسم التكنلوجيا',
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold

                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'في هذا القسم سوف نتكلم عن اهم التقنيات المستخدمة للمساعدة في الحد من مرض كورونا وكذلك عمل بعض بالدول في استخدام التكنلوجيا لتقليل انتشار المرض',
                                  style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Cairo',),
                                  textAlign:TextAlign.center ,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  new FlatButton(
                      onPressed: (){
                        Navigator.of(context).push( MaterialPageRoute(builder: (context) {


                          return  AllPageOfSeccesss(NormalUser(_id,_name,_email,_password,_type));

                        }),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),topRight: Radius.circular(10))
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 200,
                              height:200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/successStories.png')),
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width ,
                              height: 45,
                              alignment: Alignment.center,

                              child:Text(
                                'قصص نجاح والمستفيدين من كورونا',
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold

                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'في هذا القسم ستجد قصص اشخاص حققو نجاح اثناء فترة بقائهم في المنزل كذلك اهم المستفيدون من مرض كورونا',
                                  style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Cairo',),
                                  textAlign:TextAlign.center ,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  containerForDepaetments(
                      context,
                      _departmentControl.names['coronaBenefits'],
                      _departmentControl.description['coronaBenefits'],
                      _departmentControl.iamges['coronaBenefits'],
                      _departmentControl.routeName['coronaBenefits']
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  containerForDepaetments(
                      context,
                      _departmentControl.names['departmentOfDiseases'],
                      _departmentControl.description['departmentOfDiseases'],
                      _departmentControl.iamges['departmentOfDiseases'],
                      _departmentControl.routeName['departmentOfDiseases']
                  ),

                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ));
  }


  Widget containerForDepaetments(BuildContext context, String departmentName,
      String departmentDescription, String pathImge,String routeName) {
    return new FlatButton(
        onPressed: (){
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),topRight: Radius.circular(10))
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height:200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('$pathImge')),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width ,
                height: 45,
                alignment: Alignment.center,

                child:Text(
                  '$departmentName',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold

                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    '$departmentDescription',
                    style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Cairo',),
                    textAlign:TextAlign.center ,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }

}
