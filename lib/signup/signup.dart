import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/department/department.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getwidget.dart';
import 'package:lottie/lottie.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  Color textColor = Color(0xff5B7FFF);
  final _formKey=GlobalKey<FormState>();


  TextEditingController _textControllerfullName=TextEditingController();
  TextEditingController _textControllerEmial=TextEditingController();
  TextEditingController _textControllerPassword=TextEditingController();
  TextEditingController _textControllerConfirmPassword=TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _textControllerfullName.dispose();
    _textControllerEmial.dispose();
    _textControllerPassword.dispose();
    _textControllerConfirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('انشاء حساب',style: TextStyle(color: textColor),),
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
                  SizedBox(height: 20,),
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
                    height: 10,
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
                                controller: _textControllerfullName,
                                style: TextStyle(color: textColor),

                                decoration: InputDecoration(
                                  hintText: 'الأسم الكامل',
                                  prefixIcon:  Icon(Icons.person,size: 20,),
                                  hintStyle: TextStyle(color: Colors.black,fontSize: 14),

                                ),
                                validator: (value) {
                                  if(value.isEmpty){
                                    return"الرجاء ادخال الأسم الكامل";
                                  }
                                },
                              ) ,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child:TextFormField(
                                controller: _textControllerEmial,
                                style: TextStyle(color: textColor),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(

                                  hintText: 'البريد الألكتروني',
                                  prefixIcon:  Icon(Icons.email,size: 20,),
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
                              height: 10,
                            ),
                            Container(
                              child:TextFormField(
                                controller: _textControllerPassword,
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
                            Container(
                              child:TextFormField(
                                controller: _textControllerConfirmPassword,
                                style: TextStyle(color: textColor),

                                decoration: InputDecoration(
                                  hintText: 'تأكيد كلمة المرور',
                                  prefixIcon:  Icon(Icons.lock,size: 20,),

                                  hintStyle: TextStyle(color: Colors.black,fontSize: 14),

                                ),
                                obscureText: true,
                                validator: (value) {
                                  if(value !=_textControllerPassword.text){
                                    return "كلمة السر غير متطابقتا";
                                  }
                                },
                              ) ,
                            ),


                            SizedBox(
                              height: 40,
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
                                    register(_textControllerEmial.text,_textControllerPassword.text).then((value){


                                    });
                                  }

                                },
                                color: textColor,
                                child: Text(
                                  'انشاء الحساب',
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

  Future  register(String email , String password)async{

    FirebaseAuth myAuth = FirebaseAuth.instance;

    myAuth.createUserWithEmailAndPassword(email: email, password: password).then((_){

      myAuth.signInWithEmailAndPassword(email: email, password: password).then((_)async{

         await myAuth.currentUser().then((user){
           String uid= user.uid;

           final db = FirebaseDatabase.instance.reference().child('Users').child('NormalUser');

           db.child(uid).set({

             'id':uid,
             'name':_textControllerfullName.text,
             'email':email,
             "password":password,
             'type':'user'


           }).then((value) =>
               Navigator.pushAndRemoveUntil(
                 context,
                 MaterialPageRoute(builder: (context) {


                   return  Department(NormalUser(uid, _textControllerfullName.text, email, password, 'user'),true);

                 }),
                     (Route<dynamic> route) => false,
               )
           );
         });


      });

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

}




