import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/department/department.dart';
import 'package:Immunity_Box/start/start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getflutter/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';




class SettingsAccount extends StatefulWidget {

  String name;
  String email;
  String id;
  String password;
  String type;




  SettingsAccount(this.name,this.password,this.email,this.id,this.type);

  @override
  _SettingsAccountState createState() => _SettingsAccountState();
}


FirebaseAuth myAuth= FirebaseAuth.instance;

String _name;
String _email;
String _id;
String _password;


class _SettingsAccountState extends State<SettingsAccount> {
  Color textColor = Color(0xff5B7FFF);
  final _formKey=GlobalKey<FormState>();


  TextEditingController _textEditingControllerName =TextEditingController();
  TextEditingController _textEditingControllerEmail =TextEditingController();
  TextEditingController _textEditingControllerPassword =TextEditingController();



  Future<FirebaseUser> getuid() async {

    return await myAuth.currentUser();
  }


  @override
  void initState() {
    super.initState();
    getuid();


    setState(() {
      _textEditingControllerName.text=widget.name;
      _textEditingControllerEmail.text=widget.email;
      _textEditingControllerPassword.text=widget.password;


    });


  }

  @override
  void dispose() {
    super.dispose();
    _textEditingControllerName.dispose();
    _textEditingControllerEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('اعدادت الحساب',style: TextStyle(color: textColor),),
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
                  SizedBox(height: 60,),
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
                  Center(
                    child: Text('${widget.name}',style: TextStyle(fontSize: 20,color: textColor),),
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
                                controller: _textEditingControllerName,
                                style: TextStyle(color:  Colors.black),
                                decoration: InputDecoration(
                                  labelText: "الاسم",

                                  prefixIcon:  Icon(Icons.edit),
                                ),
                                validator: (value) {
                                  if(value.isEmpty){
                                    return"الرجاء ادخال الاسم";
                                  }
                                },
                              ) ,
                            ),

                            Container(
                              child:TextFormField(
                                controller: _textEditingControllerEmail,
                                style: TextStyle(color:  Colors.black),
                                decoration: InputDecoration(
                                  labelText: "الايميل",

                                  prefixIcon:  Icon(Icons.edit),
                                ),
                                validator: (value) {
                                  if(value.isEmpty){
                                    return"الرجاء ادخال الايميل";
                                  }
                                },
                              ) ,
                            ),


                            Container(
                              child:TextFormField(
                                controller: _textEditingControllerPassword,
                                style: TextStyle(color:  Colors.black),
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "كلمة المرور",
                                  prefixIcon:  Icon(Icons.edit),
                                ),
                                validator: (value) {
                                  if(value.isEmpty){
                                    return"الرجاء ادخال الباسورد";
                                  }
                                },
                              ) ,
                            ),


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
                                    try{
                                      getuid().then((user){
                                        _progressBar();



                                        final db =FirebaseDatabase.instance.reference().child('Users').child('NormalUser')
                                            .child(widget.id);

                                        //update info Of user
                                        db.update({
                                          'name':_textEditingControllerName.text,
                                          'email':_textEditingControllerEmail.text,
                                          'id':widget.id,
                                          'password':_textEditingControllerPassword.text,
                                          'type':widget.type
                                        }).then((value){

                                          //update Password
                                          myAuth.signInWithEmailAndPassword(email: '${widget.email}',password:'${widget.password}' )
                                              .then((userCredential) {
                                            userCredential.user.updatePassword(_textEditingControllerPassword.text);
                                          });


                                          //update Email
                                          myAuth.signInWithEmailAndPassword(email: '${widget.email}',password:'${widget.password}' )
                                              .then((userCredential) {
                                            userCredential.user.updateEmail(_textEditingControllerEmail.text);
                                          })
                                          ;
                                        }).then((value){
                                          Navigator.of(context).push( MaterialPageRoute(builder: (context) {


                                            return Department(NormalUser(widget.id, _textEditingControllerName.text, _textEditingControllerEmail.text,
                                                _textEditingControllerPassword.text, widget.type),true);

                                          })
                                          );
                                        });

                                      });

                                    }catch(e){
                                      Fluttertoast.showToast(
                                          msg: "يوجد خلل يرجى التأكد من اتصالك بالانترنت",
                                          toastLength: Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 5,
                                          gravity: ToastGravity.CENTER
                                      );
                                    }

                                  }else{
                                    Fluttertoast.showToast(
                                        msg: "يجب عدم ترك اي فراغات",
                                        toastLength: Toast.LENGTH_SHORT,
                                        timeInSecForIosWeb: 5,
                                        gravity: ToastGravity.CENTER
                                    );
                                  }

                                },
                                color: textColor,
                                child: Text(
                                  'حفظ',
                                  style: TextStyle(color: Colors.white, fontSize: 24,),
                                ),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                                  FirebaseAuth.instance.signOut().then((value) async{

                                    SharedPreferences sp = await SharedPreferences.getInstance();
                                    final key ='1';
                                    sp.setString(key, 'NotLogin');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) {


                                        return  Start();

                                      }),
                                          (Route<dynamic> route) => false,
                                    );
                                  });
                                },
                                color: textColor,
                                child: Text(
                                  'تسجيل الخروج',
                                  style: TextStyle(color: Colors.white, fontSize: 24,),
                                ),
                               
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
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

}
