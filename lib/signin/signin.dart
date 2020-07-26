import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/department/department.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/loader/gf_loader.dart';
import 'package:getflutter/types/gf_loader_type.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Signin extends StatefulWidget {


  @override
  _SigninState createState() => _SigninState();


}


String _name;
String _id;
String _email;
String _password;
String _type;


FirebaseAuth myAuth = FirebaseAuth.instance;

class _SigninState extends State<Signin> {


  Color textColor = Color(0xff5B7FFF);
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();



  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('تسجيل الدخول',style: TextStyle(color: textColor),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: ListView(
        children: <Widget>[

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/login.png'),
                            fit: BoxFit.cover
                        ),
                        shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                Form(
                  key: _formKey,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child:  Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child:TextFormField(
                              controller: _email,

                              style: TextStyle(color: textColor),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'البريد الألكتروني',
                                prefixIcon:  Icon(Icons.email,size: 20),
                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),

                              ),
                              validator: (value) {
                                if(value.isEmpty){
                                  return"الرجاء ادخال البريد الألكتروني";
                                }
                              },
                            ) ,
                          ),


                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child:TextFormField(
                              controller: _password,

                              style: TextStyle(color: textColor),

                              decoration: InputDecoration(
                                hintText: 'كلمة المرور',
                                prefixIcon:  Icon(Icons.lock,size: 20,),

                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),

                              ),
                             obscureText: true,
                              validator: (value) {
                                if(value.isEmpty){
                                  return"الرجاء ادخال كلمة المرور";
                                }
                              },
                            ) ,
                          ),
                          SizedBox(
                            height: 10,
                          ),
//                          Container(
//                            child: Row(
//                              children: <Widget>[
//                                Text('هل نسيت كلمة المرور ؟',style : TextStyle(color:textColor)),
//                                new Padding(padding: EdgeInsets.only(right: 10)),
//                                GestureDetector(
//                                  child: Text('اضغط هنا',style : TextStyle(color:textColor,fontWeight: FontWeight.bold)),
//                                  onTap: (){
//                                    Navigator.pushNamed(context, '/sentEmail');
//                                  },
//                                ),
//
//                              ],
//                            ),
//                          ),
                          SizedBox(
                            height: 60,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black12, blurRadius: 5),
                                ]),
                            child: RaisedButton(
                              onPressed: () {
                                if(_formKey.currentState.validate()) {

                                  _progressBar();
                                  myAuth.signInWithEmailAndPassword(email: _email.text, password: _password.text).then((_){

                                    getuid();


                                  }).catchError((onError){
                                    Alert();

                                  });
                                  }




                              },
                              color: textColor,
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(color: Colors.white, fontSize: 24,),
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          new FlatButton(onPressed: (){

                            Navigator.pushNamed(context, '/signUP');


                          },
                            child: Text('انشاء حساب',
                              style: TextStyle(color: Colors.redAccent, fontSize: 24, fontFamily: 'Cairo'),
                            ),),


                        ],
                      ),
                    ),
                  ),
                ),

                ],
              ),
            ),

        ],
      )
    );
  }

  Future<FirebaseUser> getuid() async {

    return await myAuth.currentUser().then((user){
      getuserData(user.uid).then((value){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {


            return  Department(NormalUser(_id, _name, _email.text, _password.text, _type),true);

          }),
              (Route<dynamic> route) => false,
        );
      });
    });
  }


  Future getuserData(String uid)async{
    final db = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('name')
        .once().then((value) {

      _name =value.value;
      print(_name);

    });
    final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('id')
        .once().then((value) {

      _id =value.value;
      print(_id);

    });

    final db3 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('email')
        .once().then((value) {

      _email =value.value;
      print(_email);

    });

    final db4 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('password')
        .once().then((value) {

      _password =value.value;
      print(_password);

    });

    final db5 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('type')
        .once().then((value) {

      _type =value.value;
      print(_type);

    });


  }


  Future<Widget> _progressBar() async {

    return (await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new GFLoader(
              type: GFLoaderType.custom,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(


                    child:AnimatedOpacity(
                      child: new Container(
                        height: 200,
                        width: 200,
                        child:  Lottie.asset('images/data.json'),
                      ),
                      opacity:  1,
                      duration: const Duration(seconds: 1),
                      alwaysIncludeSemantics: false,

                    ),
                  )
                ],
              )
          );
        }
    ));
  }

  Future<void> Alert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
              side: new BorderSide(color:Color(0xffff006064) ,
                  width: 3)
          ),
          elevation: 6,
          content: new Text('تأكد من الايميل المدخل او الباسورد',textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
          actions: <Widget>[
            new Center(
              child:new Row(
                children: <Widget>[

                  new FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();

                    },
                    child: new Text('الغاء'),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10),
                        side: new BorderSide(color: Colors.black)
                    ),

                    textColor: Colors.black,

                  ),


                ],
              ),
            )
          ],

        );
      },
    );
  }


}
